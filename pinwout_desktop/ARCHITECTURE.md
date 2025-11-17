# Architecture

## System Overview

PinWout Desktop is a hybrid application combining Flutter's UI capabilities with Rust's security guarantees, connected to the Cardano blockchain for immutable record-keeping.

```
┌─────────────────────────────────────────────────────────────┐
│                     Flutter UI Layer                         │
│  ┌─────────────┐  ┌──────────────┐  ┌─────────────────┐   │
│  │ Minute Book │  │  Cap Table   │  │  Verification   │   │
│  │   Screen    │  │    Screen    │  │     Screen      │   │
│  └──────┬──────┘  └──────┬───────┘  └────────┬────────┘   │
│         │                 │                    │             │
│  ┌──────▼─────────────────▼────────────────────▼────────┐  │
│  │           Provider State Management Layer            │  │
│  │  (MinuteBookProvider, CapTableProvider, etc.)        │  │
│  └──────┬──────────────────────────────────────────────┘  │
└─────────┼──────────────────────────────────────────────────┘
          │ flutter_rust_bridge (FFI)
┌─────────▼──────────────────────────────────────────────────┐
│                    Rust Security Layer                      │
│  ┌────────────────┐  ┌────────────────┐  ┌──────────────┐ │
│  │ Document Hash  │  │  Signature     │  │  Validation  │ │
│  │   Generator    │  │   Manager      │  │   Engine     │ │
│  └────────┬───────┘  └────────┬───────┘  └──────┬───────┘ │
│           │                    │                  │          │
│  ┌────────▼────────────────────▼──────────────────▼──────┐ │
│  │          Cardano Transaction Builder                   │ │
│  │  (Pallas: primitives, crypto, addresses)              │ │
│  └────────┬───────────────────────────────────────────────┘ │
└───────────┼─────────────────────────────────────────────────┘
            │
┌───────────▼─────────────────────────────────────────────────┐
│                    Cardano Blockchain                        │
│  ┌──────────────────────────────────────────────────────┐  │
│  │  Transaction Metadata (Document Hashes, Timestamps)  │  │
│  │  ✓ Immutable    ✓ Timestamped    ✓ Verifiable      │  │
│  └──────────────────────────────────────────────────────┘  │
└──────────────────────────────────────────────────────────────┘

┌──────────────────────────────────────────────────────────────┐
│                    Local Storage                             │
│  ┌──────────────┐  ┌──────────────┐  ┌──────────────────┐  │
│  │   Minutes    │  │  Cap Table   │  │   Documents      │  │
│  │   (SQLite)   │  │   (SQLite)   │  │ (Encrypted FS)   │  │
│  └──────────────┘  └──────────────┘  └──────────────────┘  │
└──────────────────────────────────────────────────────────────┘
```

## Core Components

### 1. Corporate Minute Book

#### Data Flow: Recording a Minute
```
1. User Input (Flutter)
   ↓
2. Validation (Dart)
   ↓
3. Document Assembly (Dart)
   ↓
4. Hash Generation (Rust)
   └→ SHA-256 of document content
   └→ SHA-256 of attached files
   ↓
5. Transaction Creation (Rust/Pallas)
   └→ Metadata includes: hash, timestamp, minute type
   └→ Sign with company private key
   ↓
6. Blockchain Submission (Cardano)
   └→ Returns transaction ID
   ↓
7. Local Storage (SQLite)
   └→ Document + Transaction ID + Hash
   ↓
8. UI Update (Flutter)
   └→ Confirmation + Verification link
```

#### Data Structure

**Flutter Model:**
```dart
class CorporateMinute {
  final String id;              // UUID
  final String title;           // e.g., "Board Resolution #24-001"
  final DateTime date;
  final MinuteType type;        // Resolution, Meeting, Notice, etc.
  final String content;         // Markdown or rich text
  final List<Attachment> attachments;
  final String documentHash;    // SHA-256 from Rust
  final String? txId;          // Cardano transaction ID
  final VerificationStatus status;
  final List<Signature> signatures;
}
```

**Rust Struct:**
```rust
#[derive(Debug, Clone)]
pub struct MinuteRecord {
    pub id: String,
    pub title: String,
    pub content_hash: String,      // SHA-256
    pub attachment_hashes: Vec<String>,
    pub timestamp: i64,
    pub minute_type: MinuteType,
}

impl MinuteRecord {
    pub fn calculate_hash(&self) -> String {
        // Generate SHA-256 of all fields
    }
    
    pub fn build_transaction(&self, wallet: &Wallet) -> Result<Transaction> {
        // Create Cardano tx with metadata
    }
}
```

**Blockchain Metadata:**
```json
{
  "674": {
    "msg": [
      "PinWout Corporate Minute",
      {
        "doc_hash": "a3f8...",
        "doc_type": "board_resolution",
        "timestamp": 1700000000,
        "company": "PinWout Venture Corp"
      }
    ]
  }
}
```

### 2. Capitalization Table

#### Data Flow: Recording Cap Table Change
```
1. Transaction Entry (Flutter)
   └→ Share transfer, issuance, cancellation, etc.
   ↓
2. Validation (Rust)
   └→ Verify percentages add up
   └→ Check share class rules
   └→ Validate transaction logic
   ↓
3. Calculate New State (Rust)
   └→ Update ownership percentages
   └→ Generate new cap table snapshot
   ↓
4. Hash New State (Rust)
   └→ SHA-256 of complete cap table
   ↓
5. Create Audit Record (Rust)
   └→ Previous hash + Transaction + New hash
   ↓
6. Blockchain Transaction (Cardano)
   └→ Record audit trail on-chain
   ↓
7. Local Storage Update (SQLite)
   └→ Transaction history + Current state
   ↓
8. UI Update (Flutter)
   └→ Updated cap table + Verification
```

#### Data Structure

**Flutter Model:**
```dart
class CapTable {
  final String id;
  final DateTime asOf;
  final List<Shareholder> shareholders;
  final List<ShareClass> shareClasses;
  final String stateHash;      // Hash of current state
  final String? txId;          // Blockchain verification
  final CapTableHistory history;
}

class Shareholder {
  final String id;
  final String name;
  final Map<String, int> holdings;  // shareClassId -> quantity
  final double ownershipPercentage;
}

class CapTableTransaction {
  final String id;
  final DateTime date;
  final TransactionType type;  // Transfer, Issue, Cancel, Split
  final String fromShareholderId;
  final String toShareholderId;
  final String shareClassId;
  final int quantity;
  final String previousStateHash;
  final String newStateHash;
  final String? blockchainTxId;
}
```

**Rust Struct:**
```rust
#[derive(Debug, Clone)]
pub struct CapTableState {
    pub timestamp: i64,
    pub shareholders: Vec<ShareholderRecord>,
    pub share_classes: Vec<ShareClass>,
    pub total_shares: HashMap<String, u64>,
}

impl CapTableState {
    pub fn calculate_hash(&self) -> Result<String> {
        // Deterministic hash of entire state
    }
    
    pub fn validate(&self) -> Result<()> {
        // Ensure percentages add up, share classes valid, etc.
    }
    
    pub fn apply_transaction(&self, tx: &CapTableTx) -> Result<Self> {
        // Create new state from transaction
    }
}

#[derive(Debug, Clone)]
pub struct CapTableTx {
    pub tx_type: TxType,
    pub from: Option<String>,
    pub to: Option<String>,
    pub share_class: String,
    pub quantity: u64,
    pub previous_state_hash: String,
}
```

**Blockchain Record:**
```json
{
  "674": {
    "msg": [
      "PinWout Cap Table Update",
      {
        "prev_hash": "f4a2...",
        "new_hash": "b8c1...",
        "tx_type": "transfer",
        "share_class": "common",
        "quantity": 1000,
        "timestamp": 1700000000
      }
    ]
  }
}
```

### 3. Document Verification System

#### Verification Process
```
1. User Provides Document
   ↓
2. Calculate Local Hash (Rust)
   ↓
3. Query Blockchain (Cardano)
   └→ Find transaction with matching hash
   ↓
4. Verify Transaction
   └→ Check signature
   └→ Check timestamp
   └→ Verify not spent/cancelled
   ↓
5. Return Result (Flutter)
   └→ ✓ Verified: Date, TX ID, Block
   └→ ✗ Not Found: No blockchain record
   └→ ⚠ Modified: Hash mismatch
```

## Storage Architecture

### Local Database (SQLite)

**Schema:**
```sql
-- Corporate Minutes
CREATE TABLE minutes (
    id TEXT PRIMARY KEY,
    title TEXT NOT NULL,
    date INTEGER NOT NULL,
    type TEXT NOT NULL,
    content TEXT NOT NULL,
    document_hash TEXT NOT NULL,
    tx_id TEXT,
    status TEXT NOT NULL,
    created_at INTEGER NOT NULL,
    updated_at INTEGER NOT NULL
);

CREATE TABLE minute_attachments (
    id TEXT PRIMARY KEY,
    minute_id TEXT NOT NULL,
    filename TEXT NOT NULL,
    file_hash TEXT NOT NULL,
    file_path TEXT NOT NULL,
    FOREIGN KEY (minute_id) REFERENCES minutes(id)
);

-- Cap Table
CREATE TABLE cap_table_states (
    id TEXT PRIMARY KEY,
    as_of_date INTEGER NOT NULL,
    state_hash TEXT NOT NULL UNIQUE,
    tx_id TEXT,
    raw_data TEXT NOT NULL,  -- JSON
    created_at INTEGER NOT NULL
);

CREATE TABLE cap_table_transactions (
    id TEXT PRIMARY KEY,
    date INTEGER NOT NULL,
    type TEXT NOT NULL,
    from_shareholder TEXT,
    to_shareholder TEXT,
    share_class TEXT NOT NULL,
    quantity INTEGER NOT NULL,
    previous_state_hash TEXT NOT NULL,
    new_state_hash TEXT NOT NULL,
    tx_id TEXT,
    created_at INTEGER NOT NULL,
    FOREIGN KEY (previous_state_hash) REFERENCES cap_table_states(state_hash),
    FOREIGN KEY (new_state_hash) REFERENCES cap_table_states(state_hash)
);

CREATE TABLE shareholders (
    id TEXT PRIMARY KEY,
    name TEXT NOT NULL,
    contact_info TEXT,
    created_at INTEGER NOT NULL,
    updated_at INTEGER NOT NULL
);

-- Blockchain Verification Cache
CREATE TABLE blockchain_verifications (
    document_hash TEXT PRIMARY KEY,
    tx_id TEXT NOT NULL,
    block_height INTEGER,
    timestamp INTEGER NOT NULL,
    verified_at INTEGER NOT NULL,
    verification_data TEXT  -- JSON
);
```

### File System Structure
```
~/Library/Application Support/PinWout Desktop/
├── database/
│   └── pinwout.db                    # SQLite database
├── documents/
│   ├── minutes/
│   │   ├── {year}/
│   │   │   └── {minute_id}/
│   │   │       ├── minute.md         # Main document
│   │   │       └── attachments/      # PDFs, images, etc.
│   └── exports/                      # Generated reports
├── keys/
│   └── company.key                   # Encrypted private key
└── logs/
    └── app.log                       # Application logs
```

## Security Model

### Key Management

**Company Private Key:**
- Generated on first run
- Encrypted with user password (AES-256)
- Stored in macOS Keychain
- Never leaves the device
- Used to sign all blockchain transactions

**Document Encryption:**
- Documents stored unencrypted locally (user's device)
- Only hashes published to blockchain
- Optional: Encrypt backups with company key

### Blockchain Privacy

**On-Chain Data:**
- ✓ Document hashes (SHA-256)
- ✓ Timestamps
- ✓ Transaction metadata
- ✗ NO document content
- ✗ NO personally identifiable information
- ✗ NO financial details

**Verification:**
- Anyone with hash can verify existence
- Only PinWout can create new records (private key required)
- Full audit trail publicly visible (if desired)

## Performance Considerations

### Blockchain Operations
- Async operations (don't block UI)
- Queue multiple transactions
- Batch when appropriate
- Cache verification results

### Local Database
- Indexed queries for fast retrieval
- Pagination for large datasets
- Lazy loading of attachments

### Memory Management
- Stream large documents
- Dispose providers properly
- Cache only recent data

## Scalability

### Current Capacity
- Unlimited local storage (disk limited)
- ~10 blockchain tx/hour (Cardano fees)
- Thousands of minutes/transactions

### Future Growth
- Multiple companies (multi-tenant)
- Portfolio company access
- Shareholder portal
- Bulk import/export

## Error Handling

### Blockchain Failures
```
Transaction Failed → Retry Logic
├─ Network Issue → Queue for retry
├─ Insufficient Funds → Alert user + suggest top-up
├─ Invalid Transaction → Log error + alert developer
└─ Timeout → Retry with exponential backoff
```

### Data Integrity
```
Hash Mismatch → Investigation Required
├─ Document Modified → Alert user
├─ Database Corruption → Restore from backup
└─ Blockchain Sync Issue → Re-verify
```

## Testing Strategy

### Unit Tests (Rust)
- Hash calculation
- Transaction building
- Validation logic
- Crypto operations

### Integration Tests (Dart)
- Provider state changes
- Database operations
- Bridge communication

### E2E Tests
- Complete minute recording flow
- Cap table update workflow
- Verification process

## Deployment

### Build Process
```bash
# 1. Build Rust backend
cd rust && cargo build --release

# 2. Generate bridge code
flutter_rust_bridge_codegen generate

# 3. Build Flutter app
flutter build macos --release

# 4. Sign app (macOS)
codesign --deep --force --verify --verbose --sign "Developer ID" app

# 5. Create installer
create-dmg ...
```

### Distribution
- Direct download from pinwout.com
- macOS App Store (future)
- Auto-update mechanism

---

**Architecture Version**: 1.0  
**Last Updated**: November 2025  
**Status**: Initial Implementation

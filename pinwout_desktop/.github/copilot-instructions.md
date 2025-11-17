# GitHub Copilot Instructions for PinWout Desktop

## Project Context

**Application**: PinWout Desktop - Blockchain Corporate Governance Application  
**Company**: PinWout Venture Corp (Micro-Angel Investment Fund)  
**Location**: Calgary, Alberta, Canada  
**Platform**: macOS (Flutter + Rust)  
**Purpose**: Blockchain-backed corporate minute book and capitalization table management

## Technical Architecture

### Frontend (Flutter/Dart)
- **Framework**: Flutter 3.x with Material Design 3
- **State Management**: Provider pattern
- **Platform**: macOS desktop (expandable to Windows/Linux)
- **UI Philosophy**: Clean, professional, investor-grade interface

### Backend (Rust)
- **Purpose**: All cryptographic operations, document hashing, blockchain transactions
- **Core Features**: Minute book records, cap table updates, ownership tracking
- **Libraries**: Pallas (Cardano), flutter_rust_bridge
- **Security**: Memory-safe crypto operations, document verification, audit trails
- **Pattern**: Functional, immutable data structures for corporate records

### Bridge
- **Tool**: flutter_rust_bridge 2.x
- **Pattern**: Async operations for blockchain, sync for utilities
- **Error Handling**: Rust Result types mapped to Dart

## Code Style & Conventions

### Flutter/Dart
```dart
// ✅ Good: Clean, readable, typed
class WalletProvider extends ChangeNotifier {
  String? _address;
  
  Future<void> createWallet() async {
    // Clear intent, proper async
  }
}

// ❌ Avoid: Untyped, unclear
var data;
void doStuff() { /* unclear purpose */ }
```

### Rust
```rust
// ✅ Good: Safe, clear error handling
pub fn validate_address(address: String) -> Result<bool> {
    // Explicit error handling
}

// ❌ Avoid: Unwraps, unclear errors
pub fn validate(a: String) -> bool {
    something.unwrap() // Can panic!
}
```

## Naming Conventions

### Flutter
- **Screens**: `*_screen.dart` (e.g., `home_screen.dart`)
- **Widgets**: `*_widget.dart` or descriptive (e.g., `wallet_card.dart`)
- **Providers**: `*_provider.dart` (e.g., `wallet_provider.dart`)
- **Models**: `*_model.dart` (e.g., `transaction_model.dart`)
- **Private methods**: Prefix with `_` (e.g., `_buildHeader()`)

### Rust
- **Modules**: Snake case (e.g., `wallet.rs`, `transaction.rs`)
- **Structs**: PascalCase (e.g., `CardanoWallet`, `Transaction`)
- **Functions**: Snake case (e.g., `create_wallet`, `sign_transaction`)
- **Public API**: Mark with `pub` and `#[frb(sync)]` or async

## Brand Guidelines

### Colors (PinWout)
```dart
static const Color primaryBlue = Color(0xFF00509E);
static const Color primaryGreen = Color(0xFF228B22);
static const Color darkPurple = Color(0xFF301934);
static const Color golden = Color(0xFFDAA520);
```

### Typography
- Use system fonts for now (Inter fonts when available)
- Headers: Bold, clear hierarchy
- Body: Regular weight, good contrast
- Code/Addresses: Monospace font

### Tone
- **Professional**: Suitable for investor presentations
- **Confident**: "Power In, Work Out"
- **Local Pride**: Reference Calgary/Alberta heritage
- **Technical**: Precise blockchain terminology

## Security Patterns

### ✅ Always Do
```rust
// Keep crypto in Rust
pub fn sign_transaction(tx: Transaction, key: PrivateKey) -> Result<SignedTx> {
    // Secure signing in Rust
}
```

### ❌ Never Do
```dart
// NEVER expose private keys to Dart
String privateKey = "..."; // NO!
```

### Key Principles
1. All private keys stay in Rust
2. All signing operations in Rust
3. Validate addresses in Rust
4. Dart layer only for UI and flow control

## Common Patterns

### State Management
```dart
// Provider pattern for app-wide state
class WalletProvider extends ChangeNotifier {
  Future<void> updateData() async {
    // Fetch from Rust
    notifyListeners(); // Update UI
  }
}

// Consumer in widgets
Consumer<WalletProvider>(
  builder: (context, wallet, _) => Text(wallet.balance),
)
```

### Rust Bridge Calls
```dart
// Async for blockchain operations
final wallet = await createWallet();

// Sync for utilities
final isValid = validateAddress(address);
```

### Error Handling
```dart
try {
  await wallet.createWallet();
} catch (e) {
  // Show user-friendly error
  showSnackBar('Failed to create wallet');
}
```

## File Organization

```
lib/src/
├── screens/          # Full screen views
├── widgets/          # Reusable UI components
├── providers/        # State management
├── models/           # Data models
├── theme/            # Theming
└── rust/             # Generated bridge code (auto)

rust/src/
├── lib.rs           # Main entry
├── api.rs           # Bridge API
├── wallet.rs        # Wallet operations
├── transaction.rs   # TX operations
└── cardano.rs       # Cardano utilities
```

## Development Workflow

### Making Changes

**Flutter UI**:
1. Edit Dart files
2. Hot reload (`r` in terminal) - instant feedback
3. Test on macOS

**Rust Backend**:
1. Edit Rust files
2. `cargo build` in rust/
3. `flutter_rust_bridge_codegen generate`
4. Hot restart (`R` in terminal)

### Adding Features

1. **Design First**: Sketch UI, plan data flow
2. **Rust API**: Define bridge functions
3. **Generate Bridge**: Run codegen
4. **Flutter UI**: Build interface
5. **Integration**: Connect Dart to Rust
6. **Test**: Verify on macOS

## Portfolio Companies

When implementing features, remember our portfolio:

- **Opper**: Productivity & prioritization app
- **Gravity**: Mountain Gravity Energy Storage

Consider future integration points for these companies.

## Blockchain Specifics

### Cardano Networks
- **Mainnet**: Production (764824073)
- **Testnet**: Development
- **Preview/Preprod**: Testing

### Address Format
- Mainnet: `addr1...`
- Testnet: `addr_test1...`
- Stake: `stake1...`

### Units
- 1 ADA = 1,000,000 Lovelace
- Always use Lovelace (u64) internally
- Display as ADA with 6 decimals

## Testing Approach

### Unit Tests
```rust
#[cfg(test)]
mod tests {
    #[test]
    fn test_address_validation() {
        // Test Rust logic
    }
}
```

### Integration Tests
```dart
testWidgets('Wallet screen displays balance', (tester) async {
  // Test Flutter UI
});
```

## Comments & Documentation

### When to Comment
- Complex crypto operations
- Business logic decisions
- Non-obvious blockchain patterns
- Security considerations

### When NOT to Comment
- Self-explanatory code
- Standard patterns
- Obvious operations

```dart
// ✅ Good comment
// Validate Shelley-era addresses using Bech32 encoding
final isValid = validateAddress(address);

// ❌ Unnecessary comment
// Create a new wallet
final wallet = createWallet();
```

## Common Tasks

### Add a Corporate Record Type
1. Define Rust struct in appropriate module (e.g., `corporate.rs`)
2. Add cryptographic hash function
3. Create blockchain transaction builder
4. Add to `api.rs` exports
5. Generate bridge code
6. Create Dart model
7. Build UI for record entry and verification

### Add a Cap Table Feature
1. Define ownership data structure in Rust
2. Add validation logic (ownership percentages, share classes)
3. Create audit trail functions
4. Add to bridge API
5. Build Flutter UI for visualization
6. Implement export/reporting functions

### Record a Corporate Minute
1. User creates minute/resolution in UI
2. Dart validates required fields
3. Call Rust to generate cryptographic hash
4. Create Cardano transaction with hash as metadata
5. Sign and submit to blockchain
6. Store document locally with transaction reference
7. Update UI with confirmation and verification link

### Update Styling
1. Modify `lib/src/theme/app_theme.dart`
2. Use PinWout brand colors
3. Maintain dark mode support
4. Test both themes

## Performance Considerations

- Keep Rust operations off main thread (async)
- Minimize bridge crossings
- Cache blockchain data appropriately
- Use `const` widgets where possible
- Profile before optimizing

## Accessibility

- Use semantic widgets
- Provide text alternatives
- Support keyboard navigation
- Ensure color contrast
- Test with VoiceOver

---

**Remember**: We're building for PinWout Venture Corp - professional, secure, and proudly Calgary-based.

*Power In, Work Out* 🚀

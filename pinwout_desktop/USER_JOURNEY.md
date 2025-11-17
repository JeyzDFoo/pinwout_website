# User Journey

## Welcome to PinWout Desktop

This guide walks you through the key workflows for managing your corporate minute book and capitalization table on the blockchain.

---

## First Launch

### Initial Setup

**1. Create Your Company Profile**
```
Welcome Screen
↓
Enter company details:
- Company name: PinWout Venture Corp
- Jurisdiction: Alberta, Canada
- Incorporation date: Select from calendar
- Business number (optional)
↓
Create secure password for company key
↓
Confirm password
↓
✓ Company wallet created & secured
```

**What Just Happened:**
- A cryptographic key pair was generated for your company
- Your private key is encrypted with your password
- Your public address is ready for blockchain transactions
- All stored securely in macOS Keychain

**2. Fund Your Wallet**
```
Dashboard shows: Wallet Balance: 0 ADA
↓
Click "Add Funds"
↓
Copy your wallet address
↓
Send ADA from exchange or another wallet
↓
Wait for confirmation (~20 seconds)
↓
✓ Ready to record on blockchain!
```

**Recommended Starting Balance:** 10 ADA (~$3-5 USD)
- Covers ~50-100 corporate records
- Can top up anytime

---

## Journey 1: Recording Your First Corporate Minute

### Scenario: Recording a Board Resolution

**Step 1: Navigate to Minute Book**
```
Home Screen
↓
Click "Minute Book" in sidebar
↓
See empty minute book (or existing minutes)
↓
Click "+ New Minute" button
```

**Step 2: Choose Minute Type**
```
Minute Type Selection:
○ Board Resolution
○ Shareholder Resolution  
○ Board Meeting Minutes
○ Shareholder Meeting Minutes
○ Notice
○ Other

Select: ● Board Resolution
↓
Click "Continue"
```

**Step 3: Enter Minute Details**
```
Title: Board Resolution #2025-001 - Approve Q4 Budget
Date: [Today's date auto-filled]
Time: 10:00 AM

Content Editor:
┌────────────────────────────────────────┐
│ RESOLVED THAT:                         │
│                                        │
│ The board approves the Q4 2025 budget │
│ in the amount of $250,000 CAD for     │
│ operational expenses and portfolio    │
│ company investments.                   │
│                                        │
│ Approved by unanimous consent.         │
└────────────────────────────────────────┘

Attachments:
[+ Add File] ← Click to attach Q4_Budget_2025.pdf

Directors Present:
☑ John Smith (Chair)
☑ Jane Doe
☑ Bob Johnson

↓
Click "Preview"
```

**Step 4: Review & Record**
```
Preview Screen shows formatted minute:
┌────────────────────────────────────────┐
│ PinWout Venture Corp                   │
│ Board Resolution #2025-001             │
│ November 16, 2025                      │
│                                        │
│ [Content displayed formatted]          │
│                                        │
│ Attachments: Q4_Budget_2025.pdf       │
│ Directors: Smith, Doe, Johnson         │
└────────────────────────────────────────┘

⚠️  Before Recording:
- This will create an immutable blockchain record
- Transaction cost: ~0.17 ADA
- Cannot be deleted (only marked as superseded)

[ Cancel ]  [ Record on Blockchain ]
                        ↓
                   Click here
```

**Step 5: Blockchain Recording**
```
Recording... [Progress indicator]

Step 1/4: Generating document hash... ✓
        Hash: a3f8d2...b4c1
        
Step 2/4: Creating Cardano transaction... ✓
        
Step 3/4: Signing transaction... ✓
        
Step 4/4: Broadcasting to blockchain... ✓
        TX ID: 8f3a...d2b9
        
🎉 Success!

Your minute has been recorded on Cardano blockchain:
- Transaction: 8f3a2b...d2b9c1
- Block: #8,234,567
- Time: 2025-11-16 10:05:23 UTC
- Status: ✓ Verified (3 confirmations)

[ View on Blockchain Explorer ]
[ Download PDF ]
[ Close ]
```

**Step 6: View Your Minute**
```
Minute Book Screen now shows:
┌────────────────────────────────────────┐
│ Board Resolution #2025-001            │
│ November 16, 2025                      │
│ ✓ Verified on blockchain              │
│                                        │
│ [View] [Export] [Verify]              │
└────────────────────────────────────────┘
```

---

## Journey 2: Managing Your Cap Table

### Scenario: Issuing Founder Shares

**Step 1: Navigate to Cap Table**
```
Home Screen
↓
Click "Cap Table" in sidebar
↓
Current state: Empty or existing table
↓
Click "+ New Transaction"
```

**Step 2: Select Transaction Type**
```
Transaction Type:
○ Issue New Shares
○ Transfer Shares
○ Cancel/Repurchase Shares
○ Stock Split
○ Other

Select: ● Issue New Shares
↓
Click "Continue"
```

**Step 3: Enter Transaction Details**
```
Issue Shares Form:

To Shareholder:
[Select existing] ▼ or [+ Add New Shareholder]
↓ Click "+ Add New"

New Shareholder:
- Name: John Smith
- Email: john@example.com
- Type: ○ Individual ● Corporation
- Address: 123 Main St, Calgary, AB

Share Details:
- Share Class: Common ▼
- Number of Shares: 1,000,000
- Price per Share: $0.001 CAD
- Total: $1,000.00 CAD

Issue Date: November 16, 2025
Certificate Number: CS-001

Exemption (Securities):
- Regulation: [NI 45-106] ▼
- Exemption: Founder shares

Attach Documents:
[+ Add] ← Subscription agreement, etc.

↓
Click "Calculate Impact"
```

**Step 4: Review Cap Table Impact**
```
Current Cap Table:
┌─────────────────────────────────────┐
│ Empty                               │
└─────────────────────────────────────┘

After This Transaction:
┌──────────────┬──────────┬──────────┐
│ Shareholder  │ Shares   │ %        │
├──────────────┼──────────┼──────────┤
│ John Smith   │1,000,000 │ 100.00%  │
└──────────────┴──────────┴──────────┘

Total Outstanding: 1,000,000
Fully Diluted: 1,000,000

✓ Validation passed
✓ Percentages add to 100%
✓ Share class rules satisfied

Transaction Cost: ~0.17 ADA

[ Cancel ]  [ Record Transaction ]
                        ↓
                   Click here
```

**Step 5: Blockchain Recording**
```
Recording Cap Table Update...

Step 1/5: Validating transaction... ✓
Step 2/5: Calculating new state hash... ✓
        Previous: [Genesis]
        New: f4a2d8...c3b1
        
Step 3/5: Creating audit record... ✓
Step 4/5: Submitting to blockchain... ✓
        TX ID: 9d4b...e8f3
        
Step 5/5: Updating local records... ✓

🎉 Cap Table Updated!

Transaction recorded on blockchain:
- TX ID: 9d4b3c...e8f3a2
- Block: #8,234,589
- Status: ✓ Verified

[ View Cap Table ] [ Download Report ]
```

**Step 6: View Updated Cap Table**
```
Cap Table Screen:

As of: November 16, 2025
✓ Verified on blockchain (TX: 9d4b...)

┌──────────────┬──────────┬──────────┬────────┐
│ Shareholder  │ Shares   │ %        │ Class  │
├──────────────┼──────────┼──────────┼────────┤
│ John Smith   │1,000,000 │ 100.00%  │ Common │
└──────────────┴──────────┴──────────┴────────┘

Total Outstanding: 1,000,000 shares

[ + New Transaction ] [ Export ] [ History ]
```

---

## Journey 3: Transferring Shares

### Scenario: Selling Shares to New Investor

**Step 1: Create Transfer Transaction**
```
Cap Table → + New Transaction
↓
Select: ● Transfer Shares
```

**Step 2: Enter Transfer Details**
```
Transfer Shares:

From Shareholder: John Smith ▼
To Shareholder: [+ Add New] → Acme Ventures Ltd.

Add New Shareholder:
- Name: Acme Ventures Ltd.
- Type: ● Corporation
- Email: invest@acmeventures.com

Share Details:
- Share Class: Common (only class Smith holds)
- Number of Shares: 200,000
- Price per Share: $1.00 CAD
- Total Value: $200,000.00 CAD

Transfer Date: November 16, 2025

Attach Documents:
[+] Share_Purchase_Agreement.pdf
[+] Acme_Due_Diligence.pdf

↓
Click "Calculate Impact"
```

**Step 3: Review New Cap Table**
```
Before:
┌──────────────┬──────────┬──────────┐
│ John Smith   │1,000,000 │ 100.00%  │
└──────────────┴──────────┴──────────┘

After:
┌──────────────────┬─────────┬─────────┐
│ John Smith       │ 800,000 │ 80.00%  │
│ Acme Ventures    │ 200,000 │ 20.00%  │
└──────────────────┴─────────┴─────────┘

✓ All validations passed
Cost: ~0.17 ADA

[ Cancel ]  [ Record Transfer ]
```

**Step 4: Transaction Recorded**
```
✓ Transfer complete!
✓ Blockchain verified
✓ Cap table updated

New ownership structure saved.
```

---

## Journey 4: Verifying a Document

### Scenario: Auditor Wants to Verify a Minute

**Step 1: Export Document**
```
Minute Book → Board Resolution #2025-001
↓
Click [Export]
↓
Choose: ● PDF with Verification
↓
Save: Resolution_2025-001.pdf
```

**Step 2: Share with Auditor**
```
Email PDF to auditor
PDF includes:
- Full minute content
- Document hash
- Blockchain TX ID
- Verification QR code
- Link to blockchain explorer
```

**Step 3: Auditor Verification (Their Side)**
```
Option 1: Use PinWout Verifier (Web)
- Visit verify.pinwout.com
- Upload PDF or enter hash
- System checks Cardano blockchain
- Returns: ✓ Verified + timestamp

Option 2: Manual Verification
- Calculate hash of document
- Search Cardano explorer for TX
- Compare hashes
- Verify signature and timestamp

Result:
✓ Document authentic
✓ Recorded on: Nov 16, 2025, 10:05 UTC
✓ Not modified since recording
✓ Signed by PinWout Venture Corp
```

---

## Journey 5: Regular Board Meeting

### Scenario: Monthly Board Meeting Minutes

**Step 1: Prepare Meeting**
```
Before Meeting:
- Minute Book → + New Minute
- Type: Board Meeting Minutes
- Date: November 20, 2025
- Save as draft
```

**Step 2: During Meeting**
```
Take notes in Content Editor:
- Attendees: Check boxes for present directors
- Agenda items: Number and describe
- Decisions: Record resolutions
- Action items: List with responsible parties
- Attach: Financial reports, presentations

Save draft (not recorded yet)
```

**Step 3: After Meeting**
```
Review minutes with board
↓
Make any corrections
↓
Get approval from Chair
↓
Click "Record on Blockchain"
↓
✓ Permanent record created
```

---

## Common Tasks

### Daily Operations

**Checking Wallet Balance**
```
Home → Wallet Card shows current balance
- Sufficient: Green indicator
- Low (<2 ADA): Yellow warning
- Empty: Red alert + "Add Funds" button
```

**Viewing Recent Activity**
```
Home → Activity Feed
Shows:
- Recent minutes recorded
- Cap table changes
- Blockchain verifications
- Pending drafts
```

**Searching Records**
```
Minute Book → Search bar
Enter: "budget" or "2025-001" or "John Smith"
↓
Filtered results appear instantly
```

### Weekly Maintenance

**Backup Your Data**
```
Settings → Backup
↓
Choose location
↓
Click "Create Encrypted Backup"
↓
Save backup file to secure location
(Recommended: External drive + cloud)
```

**Review Drafts**
```
Minute Book → Filter: "Drafts"
Shows incomplete minutes
Complete and record as needed
```

### Monthly Reports

**Generate Cap Table Report**
```
Cap Table → [Export]
↓
Choose format:
- PDF (for board)
- Excel (for analysis)
- CSV (for import)
↓
Date range: Last month
↓
Generate report with full audit trail
```

**Board Package**
```
Export → Custom Report
Select:
☑ Board meeting minutes (last month)
☑ Board resolutions (last month)
☑ Current cap table
☑ Pending matters
↓
Generate combined PDF
```

### Quarterly Tasks

**Complete Backup**
```
Settings → Backup
↓
Create full backup (includes all documents)
↓
Store in multiple secure locations:
1. External SSD
2. Encrypted cloud storage
3. Bank safety deposit box (optional)
```

**Compliance Review**
```
Reports → Compliance Checklist
Shows:
✓ All board meetings minuted
✓ All resolutions recorded
✓ Cap table current
⚠ Annual shareholder meeting due
✓ Corporate records complete
```

---

## Tips & Best Practices

### Writing Good Minutes

**Do:**
- ✓ Be clear and concise
- ✓ Include all required details
- ✓ Use professional language
- ✓ Record decisions, not discussions
- ✓ Attach relevant documents

**Don't:**
- ✗ Include confidential details in titles
- ✗ Use personal opinions
- ✗ Skip required information
- ✗ Wait too long to record

### Cap Table Management

**Keep It Current:**
- Record transactions same day
- Verify totals regularly
- Attach all agreements
- Note exemptions clearly

**Audit Trail:**
- Every change creates new blockchain record
- Complete history always available
- Can prove ownership at any point in time

### Security

**Protect Your Password:**
- Use strong, unique password
- Don't share with anyone
- Store securely (password manager)
- Change if compromised

**Physical Security:**
- Lock your Mac when away
- Don't leave app open unattended
- Use FileVault disk encryption
- Secure backup media

---

## Troubleshooting

### Common Issues

**"Insufficient Funds" Error**
```
Problem: Not enough ADA for transaction
Solution:
1. Check wallet balance (Home screen)
2. Click "Add Funds"
3. Send ADA to displayed address
4. Wait 20-30 seconds for confirmation
5. Try recording again
```

**"Blockchain Verification Failed"**
```
Problem: Can't connect to Cardano network
Solution:
1. Check internet connection
2. Wait a moment and try again
3. Transaction is queued, will submit when connected
4. Check status in Activity Feed
```

**"Invalid Cap Table" Error**
```
Problem: Percentages don't add up or other validation error
Solution:
1. Review transaction details
2. Check calculations
3. Ensure share classes match
4. Verify shareholder exists
5. Contact support if needed
```

---

## Getting Help

### In-App Support

**Help Menu:**
- Keyboard shortcuts
- Video tutorials
- FAQ
- Contact support

**Verification Status:**
- Green ✓: Verified on blockchain
- Yellow ⏳: Pending verification
- Red ✗: Verification failed (rare)

### Support Channels

**Email:** support@pinwout.com  
**Documentation:** docs.pinwout.com  
**Status:** status.pinwout.com

---

## Next Steps

Now that you know the key workflows:

1. **Record Your First Minute** - Start with a simple resolution
2. **Set Up Your Cap Table** - Enter current shareholders
3. **Establish Regular Habits** - Weekly backups, monthly reports
4. **Explore Advanced Features** - Templates, bulk operations, integrations

**Welcome to blockchain-powered corporate governance!**

---

*User Journey Guide Version 1.0*  
*Last Updated: November 2025*

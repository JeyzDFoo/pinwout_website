# Compliance

## Overview

PinWout Desktop is designed to meet corporate governance requirements for venture capital firms and private corporations in Canada, with considerations for international standards.

## Regulatory Framework

### Canadian Corporate Law

#### Business Corporations Act (Alberta)
PinWout Venture Corp, as an Alberta corporation, must comply with:

**Minute Book Requirements (Section 20):**
- ✓ Record of directors and officers
- ✓ Minutes of shareholder meetings
- ✓ Minutes of directors meetings
- ✓ Copies of special resolutions
- ✓ Records of share transfers

**How PinWout Desktop Complies:**
- All records stored with immutable timestamps
- Complete audit trail of all changes
- Cryptographic verification of authenticity
- Export capabilities for legal review
- Maintains chronological order

#### Securities Regulations
**National Instrument 45-106 (Prospectus Exemptions):**
- Accurate records of security issuances
- Documentation of exemption reliance
- Investor accreditation records

**How PinWout Desktop Complies:**
- Cap table tracks all issuances with dates and exemptions
- Blockchain verification provides proof of timing
- Document attachments for subscription agreements

### Corporate Governance Standards

#### Good Governance Practices
- Regular board meetings documented
- Clear decision-making processes
- Transparent ownership structure
- Proper authorization trails

**How PinWout Desktop Enables:**
- Templates for standard resolutions
- Automatic meeting minute structure
- Real-time cap table updates
- Multi-signature support (future)

## Legal Requirements

### Minute Book Contents (Alberta BCA)

**Required Records:**
1. **Articles and Bylaws**
   - Status: Stored as attachments
   - Verification: Blockchain hash proves authenticity

2. **Minutes of Meetings**
   - Status: Full text + cryptographic proof
   - Verification: Timestamp cannot be backdated

3. **Resolutions**
   - Status: Recorded as corporate minutes
   - Verification: Signed and blockchain-verified

4. **Share Register**
   - Status: Real-time cap table
   - Verification: Each change recorded on-chain

5. **Directors and Officers**
   - Status: Current list maintained
   - Verification: Changes timestamped and verified

### Retention Requirements

**Legal Retention Periods:**
- Corporate records: Indefinite (in Alberta)
- Tax records: 7 years (CRA requirement)
- Financial statements: Indefinite for public accountability

**PinWout Desktop Approach:**
- Blockchain: Permanent, immutable record
- Local storage: User-controlled, indefinite
- Export: Generate reports for required periods
- Backup: Recommended quarterly encrypted backups

## Audit Trail Standards

### What Gets Recorded

**For Every Corporate Minute:**
```
✓ Creation date/time (UTC)
✓ Created by (user identifier)
✓ Document content hash
✓ Attachment hashes
✓ Blockchain transaction ID
✓ Verification status
✓ Any modifications (with timestamps)
```

**For Every Cap Table Change:**
```
✓ Transaction date/time (UTC)
✓ Transaction type (issue, transfer, cancel)
✓ Parties involved
✓ Share class and quantity
✓ Previous state hash
✓ New state hash
✓ Blockchain transaction ID
✓ Authorization record
```

### Audit Requirements

**Internal Audits:**
- Complete transaction history available
- Chronological order guaranteed by blockchain
- No ability to delete or modify historical records
- Export audit reports in CSV/PDF

**External Audits (Accountants/Lawyers):**
- Export complete minute book to PDF
- Export cap table with full history
- Provide blockchain verification links
- Generate compliance reports

**Regulatory Audits:**
- Demonstrate record completeness
- Prove non-tampering via blockchain
- Show authorization chains
- Timestamp verification

## Data Privacy & Protection

### Personal Information Protection

**Canadian PIPEDA Compliance:**

**What We Collect:**
- Shareholder names and contact info
- Director/officer information
- Transaction parties

**How We Protect:**
- ✓ Stored locally (user device)
- ✓ Only hashes on blockchain (no PII)
- ✓ Encrypted backups (optional)
- ✓ No cloud storage (unless user chooses)
- ✓ User controls all data

**User Rights:**
- Access: Full export capabilities
- Correction: Edit records (new version created)
- Deletion: Local data can be deleted (blockchain hashes remain)

### Confidentiality

**Corporate Records:**
- Minute book: Confidential (local only)
- Cap table: Confidential (local only)
- Blockchain: Public hashes (no identifiable info)

**Best Practices:**
- Don't include sensitive info in titles
- Use generic descriptions in blockchain metadata
- Encrypt backups before cloud storage
- Control access to application

## Verification & Authenticity

### Proving Document Authenticity

**For Legal/Regulatory Purposes:**

1. **Produce Original Document**
   - Export from PinWout Desktop

2. **Provide Cryptographic Hash**
   - SHA-256 included in export

3. **Show Blockchain Transaction**
   - Link to Cardano explorer
   - Transaction ID and block number

4. **Demonstrate Chain of Custody**
   - Complete audit trail
   - All changes timestamped

**Verification Process for Third Parties:**
```bash
# Anyone can verify a document
1. Calculate document hash
2. Search Cardano blockchain for hash
3. Verify transaction signature
4. Confirm timestamp
5. Check transaction not reversed
```

### Dispute Resolution

**If Document Authenticity Challenged:**

1. **Provide Blockchain Proof**
   - Transaction exists on public blockchain
   - Timestamp proves document existed at specific time
   - Cryptographic signature proves origin

2. **Show Complete History**
   - All versions of document
   - Audit trail of changes
   - Authorization records

3. **Independent Verification**
   - Third party can verify blockchain record
   - Hash calculation is reproducible
   - Transaction signatures verifiable

## Tax Compliance

### Canada Revenue Agency (CRA)

**Record Keeping Requirements:**
- Supporting documents for 7 years
- Books and records in accessible format
- Organized and legible

**PinWout Desktop Capabilities:**
- Export complete records for any period
- Generate PDF reports for filing
- Maintain chronological order
- Search and filter by date range

### US IRS (If Applicable)

**For US Investors/Portfolio Companies:**
- Schedule K-1 supporting documentation
- Investment records
- Distribution records

**PinWout Desktop Support:**
- Track US vs. Canadian shareholders
- Export US-specific reports
- Maintain investor classification

## Securities Law Compliance

### Venture Capital Registration

**Exempt Market Dealer Registration:**
- Record of distributions
- Investor suitability assessments
- Know Your Client (KYC) documentation

**PinWout Desktop Features:**
- Attach KYC documents to shareholder records
- Track distribution dates and exemptions
- Maintain investor accreditation records

### Reporting Obligations

**Annual Filings:**
- Alberta Corporate Registry
- Securities commissions (if applicable)

**PinWout Desktop Exports:**
- Current director/officer list
- Share register (current state)
- Changes during reporting period

## Best Practices

### Regular Maintenance

**Recommended Schedule:**
- **Daily**: Record significant decisions
- **Weekly**: Review pending verifications
- **Monthly**: Board meeting minutes
- **Quarterly**: Cap table review and backup
- **Annually**: Complete audit and export

### Documentation Standards

**Writing Minutes:**
- Use clear, professional language
- Include all required elements (date, attendees, resolutions)
- Attach supporting documents
- Have authorized officer review before recording

**Cap Table Updates:**
- Record same day as transaction
- Include all relevant details
- Attach subscription agreements/transfer documents
- Verify totals add to 100%

### Access Control

**Who Should Have Access:**
- Corporate secretary: Full access
- Directors: Read access to minutes
- Officers: Limited access as needed
- Auditors: Read access with authorization

**Security Measures:**
- Password-protect application
- Use strong company key password
- Don't share credentials
- Log out when not in use

## Compliance Reporting

### Available Reports

1. **Complete Minute Book**
   - All minutes chronologically
   - Includes attachments
   - Blockchain verification references

2. **Cap Table Report**
   - Current ownership
   - Historical changes
   - Transaction detail

3. **Audit Trail Report**
   - All changes with timestamps
   - User actions
   - Verification status

4. **Compliance Checklist**
   - Required documents present
   - Missing items highlighted
   - Suggestions for compliance

### Export Formats

- **PDF**: For official submissions
- **CSV**: For spreadsheet analysis
- **JSON**: For system integration
- **Markdown**: For version control

## Future Compliance Features

### Planned Enhancements

1. **Regulatory Filing Integration**
   - Direct submission to Alberta Corporate Registry
   - Electronic filing capabilities

2. **Smart Contract Automation**
   - Automatic dividend distributions
   - Voting automation
   - Transfer restrictions enforcement

3. **Enhanced Audit Support**
   - Real-time auditor portal
   - Automated compliance checks
   - Exception reporting

4. **International Support**
   - Delaware C-Corp templates
   - UK Companies House format
   - Other jurisdictions as needed

## Legal Disclaimer

**Important Notice:**

PinWout Desktop is a tool to assist with corporate record-keeping. It does not:
- Provide legal advice
- Replace professional counsel
- Guarantee compliance in all jurisdictions
- Substitute for professional judgment

**Always consult with:**
- Corporate lawyer for governance matters
- Accountant for financial records
- Securities lawyer for investment activities
- Compliance professional for regulatory matters

---

## Resources

**Canadian Regulations:**
- [Business Corporations Act (Alberta)](https://www.qp.alberta.ca/Laws_Online.cfm)
- [Canada Business Corporations Act](https://laws-lois.justice.gc.ca/eng/acts/C-44/)
- [PIPEDA](https://www.priv.gc.ca/en/privacy-topics/privacy-laws-in-canada/the-personal-information-protection-and-electronic-documents-act-pipeda/)

**Guidance:**
- Alberta Securities Commission
- Canada Revenue Agency Business Records
- Canadian Institute of Chartered Secretaries & Administrators

---

**Compliance Document Version**: 1.0  
**Last Reviewed**: November 2025  
**Next Review**: November 2026

*This document should be reviewed annually or when regulations change.*

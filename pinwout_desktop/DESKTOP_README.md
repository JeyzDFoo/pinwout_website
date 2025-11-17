# PinWout Desktop - Cardano Blockchain Integration

A macOS desktop application for PinWout Venture Corp, featuring Cardano blockchain integration using Flutter and Rust.

## Overview

PinWout Desktop is a native macOS application that connects PinWout Venture Corp's investment portfolio with the Cardano blockchain. Built with Flutter for the UI and Rust for blockchain operations via flutter_rust_bridge.

## Features

- **Cardano Wallet Management**: Create, restore, and manage Cardano wallets
- **Transaction History**: View and track all Cardano transactions
- **Portfolio Overview**: Monitor PinWout's portfolio companies (Opper, Gravity)
- **Native macOS Experience**: Optimized for macOS with native window management
- **Dark Mode Support**: Full support for light and dark themes
- **Secure Blockchain Operations**: All blockchain operations handled securely in Rust

## Tech Stack

- **Frontend**: Flutter 3.x (Dart)
- **Backend**: Rust with Pallas (Cardano libraries)
- **Bridge**: flutter_rust_bridge 2.5.1
- **Platform**: macOS (with potential for Windows/Linux)
- **Blockchain**: Cardano (Mainnet/Testnet support)

## Prerequisites

Before you begin, ensure you have:

- **Flutter SDK**: >= 3.5.0 ([Installation Guide](https://docs.flutter.dev/get-started/install))
- **Rust**: Latest stable version ([Installation Guide](https://rustup.rs/))
- **Xcode**: Latest version (for macOS development)
- **Cargo**: Comes with Rust installation

## Installation

1. **Clone the repository**:
   ```bash
   cd pinwout_desktop
   ```

2. **Install Flutter dependencies**:
   ```bash
   flutter pub get
   ```

3. **Build Rust backend**:
   ```bash
   cd rust
   cargo build --release
   cd ..
   ```

4. **Generate flutter_rust_bridge bindings**:
   ```bash
   flutter_rust_bridge_codegen generate
   ```

## Running the App

### Development Mode

```bash
flutter run -d macos
```

### Release Build

```bash
chmod +x build.sh
./build.sh
```

The built app will be located at:
```
build/macos/Build/Products/Release/pinwout_desktop.app
```

## Project Structure

```
pinwout_desktop/
├── lib/
│   ├── main.dart                 # App entry point
│   └── src/
│       ├── app.dart              # Main app widget
│       ├── providers/            # State management
│       │   ├── wallet_provider.dart
│       │   └── theme_provider.dart
│       ├── screens/              # App screens
│       │   ├── home_screen.dart
│       │   ├── wallet_screen.dart
│       │   ├── transactions_screen.dart
│       │   └── settings_screen.dart
│       ├── widgets/              # Reusable widgets
│       │   ├── sidebar.dart
│       │   ├── wallet_card.dart
│       │   └── portfolio_overview.dart
│       └── theme/                # App theming
│           └── app_theme.dart
├── rust/
│   ├── src/
│   │   ├── lib.rs               # Rust bridge entry
│   │   ├── cardano.rs           # Cardano utilities
│   │   ├── wallet.rs            # Wallet operations
│   │   └── transaction.rs       # Transaction handling
│   └── Cargo.toml               # Rust dependencies
├── macos/                       # macOS platform code
├── assets/                      # Images, fonts, icons
└── pubspec.yaml                 # Flutter dependencies
```

## Cardano Integration

### Wallet Operations

- **Create Wallet**: Generate new Cardano wallet with recovery phrase
- **Restore Wallet**: Restore from 12/15/24-word recovery phrase
- **Check Balance**: Query wallet balance from blockchain
- **Validate Address**: Verify Cardano address format

### Transaction Features

- **Build Transaction**: Create unsigned transactions
- **Sign Transaction**: Sign with private keys (secure Rust implementation)
- **Submit Transaction**: Broadcast to Cardano network
- **Transaction History**: Query past transactions

### Network Support

- Mainnet (Production)
- Testnet (Development)
- Preview (Testing)
- Preprod (Pre-production)

## Development

### Flutter Hot Reload

During development, use hot reload for instant UI updates:
- Press `r` in terminal to hot reload
- Press `R` in terminal to hot restart

### Rust Changes

After modifying Rust code:
```bash
cd rust
cargo build
cd ..
flutter_rust_bridge_codegen generate
```

### Adding Dependencies

**Flutter**:
```bash
flutter pub add package_name
```

**Rust** (edit `rust/Cargo.toml`):
```toml
[dependencies]
new_package = "version"
```

## Brand Guidelines

PinWout Desktop follows the PinWout Venture Corp brand:

- **Primary Colors**: Blue (#00509E), Green (#228B22)
- **Secondary Colors**: Purple (#301934), Light Green (#90EE90)
- **Accent Colors**: Golden (#DAA520), Beige (#F5F5DC)
- **Typography**: Inter font family

## Security

- Private keys never leave the device
- All sensitive operations performed in Rust
- Recovery phrases encrypted at rest
- Secure communication with Cardano nodes

## Contributing

This is a private project for PinWout Venture Corp. Internal contributions should:

1. Follow Flutter best practices
2. Maintain Rust safety guarantees
3. Include tests for new features
4. Update documentation

## Roadmap

- [ ] Hardware wallet support (Ledger, Trezor)
- [ ] Multi-signature wallets
- [ ] NFT gallery and management
- [ ] Stake pool delegation
- [ ] DApp connector integration
- [ ] Portfolio company token integration

## Support

For internal support, contact the PinWout development team.

## License

Copyright © 2025 PinWout Venture Corp. All rights reserved.

---

**PinWout Venture Corp**  
Calgary, Alberta, Canada  
*Power In, Work Out*

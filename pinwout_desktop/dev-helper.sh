#!/bin/bash

# PinWout Desktop Development Helper Script

echo "🔍 PinWout Desktop - Development Helper"
echo "========================================"
echo ""

# Check Flutter
if command -v flutter &> /dev/null; then
    FLUTTER_VERSION=$(flutter --version | head -n 1)
    echo "✅ Flutter installed: $FLUTTER_VERSION"
else
    echo "❌ Flutter not installed"
    echo "   Install from: https://docs.flutter.dev/get-started/install"
fi

# Check Rust
if command -v cargo &> /dev/null; then
    RUST_VERSION=$(rustc --version)
    echo "✅ Rust installed: $RUST_VERSION"
else
    echo "❌ Rust not installed"
    echo "   Install from: https://rustup.rs/"
fi

# Check flutter_rust_bridge
if command -v flutter_rust_bridge_codegen &> /dev/null; then
    echo "✅ flutter_rust_bridge CLI installed"
else
    echo "⚠️  flutter_rust_bridge CLI not installed"
    echo "   Install with: cargo install flutter_rust_bridge_codegen"
fi

# Check Xcode (macOS)
if command -v xcodebuild &> /dev/null; then
    XCODE_VERSION=$(xcodebuild -version | head -n 1)
    echo "✅ Xcode installed: $XCODE_VERSION"
else
    echo "⚠️  Xcode not found (required for macOS development)"
fi

echo ""
echo "📋 Quick Commands:"
echo "==================="
echo ""
echo "Development:"
echo "  flutter run -d macos              # Run app in debug mode"
echo "  flutter run -d macos --release    # Run app in release mode"
echo ""
echo "Rust:"
echo "  cd rust && cargo build            # Build Rust backend"
echo "  cd rust && cargo test             # Run Rust tests"
echo "  cd rust && cargo clippy           # Lint Rust code"
echo ""
echo "Bridge:"
echo "  flutter_rust_bridge_codegen generate  # Generate bindings"
echo ""
echo "Build:"
echo "  ./build.sh                        # Full production build"
echo ""
echo "Clean:"
echo "  flutter clean                     # Clean Flutter build"
echo "  cd rust && cargo clean            # Clean Rust build"
echo ""

# Check if dependencies are installed
if [ -d ".dart_tool/package_config.json" ]; then
    echo "✅ Flutter dependencies installed"
else
    echo "⚠️  Flutter dependencies not installed"
    echo "   Run: flutter pub get"
fi

# Check if Rust is built
if [ -d "rust/target" ]; then
    echo "✅ Rust backend built"
else
    echo "⚠️  Rust backend not built"
    echo "   Run: cd rust && cargo build"
fi

# Check for fonts
if [ -f "assets/fonts/Inter-Regular.ttf" ]; then
    echo "✅ Inter fonts installed"
else
    echo "⚠️  Inter fonts missing"
    echo "   Download from: https://fonts.google.com/specimen/Inter"
    echo "   Place in: assets/fonts/"
fi

echo ""
echo "📚 Documentation:"
echo "==================="
echo "  README.md          - Full project documentation"
echo "  QUICKSTART.md      - Quick setup guide"
echo "  PROJECT_OVERVIEW.md - Complete project overview"
echo ""
echo "🚀 Ready to start? Run: flutter run -d macos"

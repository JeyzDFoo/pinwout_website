#!/bin/bash

# PinWout Desktop Build Script

echo "🚀 Building PinWout Desktop for macOS"

# Colors for output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# Step 1: Clean previous builds
echo -e "${BLUE}📦 Cleaning previous builds...${NC}"
flutter clean
rm -rf build/

# Step 2: Get Flutter dependencies
echo -e "${BLUE}📥 Installing Flutter dependencies...${NC}"
flutter pub get

# Step 3: Build Rust backend
echo -e "${BLUE}🦀 Building Rust backend...${NC}"
cd rust
cargo build --release
if [ $? -ne 0 ]; then
    echo -e "${RED}❌ Rust build failed${NC}"
    exit 1
fi
cd ..

# Step 4: Generate flutter_rust_bridge bindings
echo -e "${BLUE}🔗 Generating bridge bindings...${NC}"
flutter_rust_bridge_codegen generate
if [ $? -ne 0 ]; then
    echo -e "${RED}❌ Bridge generation failed${NC}"
    exit 1
fi

# Step 5: Build Flutter app for macOS
echo -e "${BLUE}🎨 Building Flutter app...${NC}"
flutter build macos --release

if [ $? -eq 0 ]; then
    echo -e "${GREEN}✅ Build successful!${NC}"
    echo -e "${GREEN}📱 App location: build/macos/Build/Products/Release/pinwout_desktop.app${NC}"
else
    echo -e "${RED}❌ Flutter build failed${NC}"
    exit 1
fi

# Step 6: Optional - Create DMG
echo -e "${BLUE}💿 Creating DMG installer...${NC}"
# Uncomment to create DMG
# create-dmg \
#   --volname "PinWout Desktop" \
#   --window-pos 200 120 \
#   --window-size 800 400 \
#   --icon-size 100 \
#   --icon "PinWout.app" 200 190 \
#   --hide-extension "PinWout.app" \
#   --app-drop-link 600 185 \
#   "PinWout-Desktop.dmg" \
#   "build/macos/Build/Products/Release/"

echo -e "${GREEN}✨ Build complete!${NC}"

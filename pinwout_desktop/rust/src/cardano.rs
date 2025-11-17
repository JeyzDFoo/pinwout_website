use flutter_rust_bridge::frb;

/// Cardano blockchain network types
#[derive(Debug, Clone)]
pub enum CardanoNetwork {
    Mainnet,
    Testnet,
    Preview,
    Preprod,
}

/// Blockchain epoch information
#[derive(Debug, Clone)]
pub struct EpochInfo {
    pub epoch: u32,
    pub slot: u64,
    pub block_height: u64,
}

/// Asset information (Native tokens)
#[derive(Debug, Clone)]
pub struct Asset {
    pub policy_id: String,
    pub asset_name: String,
    pub quantity: u64,
}

/// Get current epoch information
#[frb(sync)]
pub fn get_current_epoch() -> EpochInfo {
    // Placeholder implementation
    EpochInfo {
        epoch: 450,
        slot: 125000000,
        block_height: 10500000,
    }
}

/// Convert ADA to Lovelace
#[frb(sync)]
pub fn ada_to_lovelace(ada: f64) -> u64 {
    (ada * 1_000_000.0) as u64
}

/// Convert Lovelace to ADA
#[frb(sync)]
pub fn lovelace_to_ada(lovelace: u64) -> f64 {
    lovelace as f64 / 1_000_000.0
}

/// Get network from address
#[frb(sync)]
pub fn get_network_from_address(address: String) -> String {
    if address.starts_with("addr1") {
        "mainnet".to_string()
    } else if address.starts_with("addr_test1") {
        "testnet".to_string()
    } else {
        "unknown".to_string()
    }
}

use super::constants::MAX_FEE;
use sncast_std::{call, CallResult, declare, deploy, DeclareResult, DisplayContractAddress, DisplayClassHash};

fn main() {
    println!("running deploy");
    //println!("adding a new print output");

    let declared = declare("blobby", Option::Some(MAX_FEE), Option::None).expect('declare failed');
    let calldata: Array<felt252> = Default::default();
    let deployed = deploy(declared.class_hash, calldata, Option::Some(2), true, Option::Some(MAX_FEE), Option::None).expect('deploy failed');

    println!("Deployed at {}", deployed.contract_address);
}

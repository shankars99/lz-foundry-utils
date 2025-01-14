// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.22;

import {JsonBase, console, stdJson} from "./Base.sol";

using stdJson for string;

abstract contract JsonWriter is JsonBase {
    function writeDeployedAddress(
        string memory _chain,
        string memory _protocol,
        string memory _contractName,
        address _address
    ) public {
        vm.writeJson(
            vm.toString(_address),
            string.concat(config_path, _chain, ".json"),
            string.concat(".addresses.", _protocol, ".", _contractName)
        );

        console.log("Deployed address %s is written to %s", _address, _contractName);
    }
}

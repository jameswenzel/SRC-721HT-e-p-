// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import {ContractOffererInterface, IERC165} from "seaport-types/interfaces/ContractOffererInterface.sol";
import {ERC721HT} from "./ERC721HT.sol";
import {AbstractSRC721HT} from "./AbstractSRC721HT.sol";
import {SpentItem, ReceivedItem, Schema} from "seaport-types/lib/ConsiderationStructs.sol";
import {ItemType} from "seaport-types/lib/ConsiderationEnums.sol";
import {MinHeapMap, Heap} from "sol-heap/MinHeapMap.sol";
import {Node, NodeType} from "sol-heap/lib/NodeType.sol";

contract SRC721HT is ERC721HT, AbstractSRC721HT {
    constructor(address seaport, uint256 feeBps, address initialOwner, address payable feeRecipient)
        AbstractSRC721HT(seaport)
        ERC721HT(feeBps, initialOwner, feeRecipient)
    {}

    function supportsInterface(bytes4 interfaceId)
        public
        view
        virtual
        override(AbstractSRC721HT, ERC721HT)
        returns (bool)
    {
        return AbstractSRC721HT.supportsInterface(interfaceId);
    }
}

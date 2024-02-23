// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.20;

import "../libraries/NftLib.sol";

interface INftDB {

    function setNftMetaData(NftLib.NftMetaData calldata meta) external;
    function getNftMetaData(uint256 tokenId) external view returns(NftLib.NftMetaData memory);
    
}
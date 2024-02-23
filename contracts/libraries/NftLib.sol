// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.20;

library NftLib {

    struct NftMetaData{
        uint256 tokenId;
        uint256 healthVal;//生命值
        uint256 intelligenceVal;//智慧值
        uint256 manaVal;//神力值
        string image;// image URL
    }
    
}
// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.20;
import "@openzeppelin/contracts-upgradeable/access/AccessControlUpgradeable.sol";
import "../interfaces/INftDB.sol";
import "../libraries/NftLib.sol";
contract NftDB is AccessControlUpgradeable{

    // NFT属性
    mapping(uint256 => NftLib.NftMetaData) private nftMetaDatas;

    function initialize() public initializer {
        __AccessControl_init();
        _grantRole(DEFAULT_ADMIN_ROLE, msg.sender);

    }

    function setNftMetaData(NftLib.NftMetaData calldata meta) external {
        nftMetaDatas[meta.tokenId] = meta;
    }

    function getNftMetaData(uint256 tokenId) external view returns(NftLib.NftMetaData memory){
        return nftMetaDatas[tokenId];
    }

}
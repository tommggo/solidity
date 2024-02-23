// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
import "@openzeppelin/contracts-upgradeable/access/AccessControlUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/token/ERC721/extensions/ERC721URIStorageUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import "@openzeppelin/contracts-upgradeable/token/ERC721/utils/ERC721HolderUpgradeable.sol";
import "../interfaces/INftDB.sol";
import "../libraries/NftLib.sol";

contract MyNft is ERC721URIStorageUpgradeable, AccessControlUpgradeable, ERC721HolderUpgradeable{
    //bytes4 public constant IERC165_INTERFACE_ID = type(IERC165).interfaceId;
    INftDB private _nftDB;
    uint256 private _nextTokenId;

    function initialize(string memory _name,string memory _symbol) public initializer {
        __ERC721_init(_name, _symbol);
        __ERC721URIStorage_init();
        __AccessControl_init();
        __ERC721Holder_init();
        _grantRole(DEFAULT_ADMIN_ROLE, msg.sender);

    }

    function safeMint(string memory _tokenURI) external returns(uint256 tokenId) {
        tokenId = _nextTokenId++;
        _safeMint(msg.sender, tokenId);
        _setTokenURI(tokenId,_tokenURI);
        NftLib.NftMetaData memory meta = _nftDB.getNftMetaData(tokenId);
        meta.tokenId = tokenId;
        meta.healthVal = 1;
        meta.intelligenceVal = 2;
        meta.manaVal = 3;
        meta.image = _tokenURI;
        _nftDB.setNftMetaData(meta);
    }

    function getTokenIdCounter() external view returns (uint256) {
        return _nextTokenId;
    }

    function supportsInterface(bytes4 interfaceId) public view override(ERC721URIStorageUpgradeable, AccessControlUpgradeable) returns (bool) {
        return super.supportsInterface(interfaceId);
    }

    // The following functions are overrides required by Solidity.
    function tokenURI(uint256 tokenId) public view override(ERC721URIStorageUpgradeable) returns (string memory){
        return super.tokenURI(tokenId);
    }

    


}
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
import {IERC165} from "@openzeppelin/contracts/utils/introspection/IERC165.sol";
import {IERC721} from "@openzeppelin/contracts/token/ERC721/IERC721.sol";
import {ERC165Upgradeable} from "@openzeppelin/contracts-upgradeable/utils/introspection/ERC165Upgradeable.sol";
import {ERC721Upgradeable} from "@openzeppelin/contracts-upgradeable/token/ERC721/ERC721Upgradeable.sol";

contract EIP165 is ERC721Upgradeable{

    function ierc165() external view returns (bool){
        bytes4 interfaceId = type(IERC165).interfaceId;
        return IERC165(address(this)).supportsInterface(interfaceId);
    }

    function ierc721() external view returns (bool){
        bytes4 interfaceId = type(IERC721).interfaceId;
        return IERC165(address(this)).supportsInterface(interfaceId);
    }
}
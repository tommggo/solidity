// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// 被调用合约
contract StaticCall {
    //被调用函数
    function bar() external pure returns(uint256) {
        return 1;
    }
}

// 调用者合约
contract StaticCaller{
    //staticcall
    // 参数 contractAddress 是被调用合约的地址
    function staticCallExternal(address contractAddress) external view returns(bool, bytes memory) {
        // 对函数签名和参数进行编码
        bytes memory data = abi.encodeWithSignature("bar()");

        // 静态调用外部合约函数
        return contractAddress.staticcall(data);
    }
}
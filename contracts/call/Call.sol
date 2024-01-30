// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

//被调用合约
contract Call{
    uint256 public value;

    //部署时可以接受ETH
    constructor() payable {}

    //被调用函数
    function foo(uint256 _value) external payable {
        value = _value;
    }

    //合约账户可以接受ETH
    receive() external payable { }

}


contract Caller{

    constructor() payable {}
    // 1只调用外部合约的函数
    // 参数 contractAddress 是被调用合约的地址
    function callExternalFunc(address contractAddress) external returns(bool, bytes memory) {

        // 对函数签名和参数进行编码
        bytes memory data = abi.encodeWithSignature("foo(uint256)", 8);

        // 调用外部合约函数
        return contractAddress.call(data);
    }

    // 2只向外部合约发送ETH
    // 参数 contractAddress 是被调用合约的地址
    function callExternal(address contractAddress) external returns(bool, bytes memory) {

        // 调用外部合约函数
        return contractAddress.call{value: 1 ether}("");
    }

    // 3调用外部合约的函数及发送ETH
    // 参数 contractAddress 是被调用合约的地址
    function callExternalFuncAndETH(address contractAddress) external returns(bool, bytes memory) {

        // 对函数签名和参数进行编码
        bytes memory data = abi.encodeWithSignature("foo(uint256)", 8);

        // 调用外部合约函数
        return contractAddress.call{value: 1 ether}(data);
    }
}
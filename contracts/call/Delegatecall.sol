// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// 被调用的智能合约
contract C  {
    // 整型状态变量
    uint256 public value = 0;

    /**
     * @dev 改变状态变量 value 的值
     * @param _value 新的变量值
     */
    function setValue(uint256 _value) external {
        value = _value;
    }
}

// 使用 delegatecall 方式调用 C 合约
contract B  {
    // 整型状态变量
    uint256 public value = 0;

    /**
     * @dev 使用 delegatecall 方式调用外部合约
     * @param contractAddress 外部合约地址
     * @param _value 新的变量值
     */
    function changeValue(address contractAddress, uint256 _value) 
        external returns(bool, bytes memory){
        // 对函数签名和参数进行编码
        bytes memory data = abi.encodeWithSignature("setValue(uint256)", _value);

        // 通过 delegatecall 调用外部合约函数
        return contractAddress.delegatecall(data);
    }
}
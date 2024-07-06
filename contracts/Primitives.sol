// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;
//原始数据类型 boolean uint256 int256 address
contract Primitives {
    bool public boo = true;
    /**
        在这里，我们向您介绍一些基元duint，它代表无符号整数，意思是非负整数
        有不同尺寸可供选择
        uint8的范围从0到2*8-1
        uint16的范围从0到2*16-1
        ...
        uint256的范围从0到2**256-Solidity中提供的1个数据类型。
    */
    uint8 public u8 = 1;
    uint256 public u256 = 456;
    uint256 public u = 123; // uint is an alias for uint256


    /**
        int类型允许使用负数。
        与uint一样，可以使用从int8到int256的不同范围
        int256的范围从-2**255到2**255-1
        int128的范围从-2**127到2**127-1
    */
    int8 public i8 = -1;
    int256 public i256 = 456;
    int256 public i = -123; // int is same as int256
    //int的最小值和最大值
    int256 public minInt = type(int256).min;
    int256 public maxInt = type(int256).max;

    address public addr = 0xCA35b7d915458EF540aDe6068dFe2F44E8fa733c;


    /**
        在Solidity中，数据类型字节表示一个字节序列。
        Solidity提供两种类型的字节类型：
        -固定大小的字节数组
        -动态大小的字节数组。
            
        Solidity中的字节表示一个动态的字节数组。
        这是byte[]的简写。
    */
    bytes1 a = 0xb5; //  [10110101]
    bytes1 b = 0x56; //  [01010110]

    //默认值
    //未分配的变量具有默认值
    bool public defaultBoo; // false
    uint256 public defaultUint; // 0
    int256 public defaultInt; // 0
    address public defaultAddr; // 0x0000000000000000000000000000000000000000
}

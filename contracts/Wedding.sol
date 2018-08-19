pragma solidity ^0.4.23;

contract Wedding {

    uint public amountSum;

    address owner;
    modifier onlyOwner() { assert(msg.sender == owner); _; }

    mapping (address => uint) pendingBet;
    mapping (address => string) messages;


    constructor() public {
        owner = msg.sender;
    }

    function set() public payable returns (uint128) {

    }

    function bet() public payable returns (uint128) {
        uint nowTime = block.timestamp;
        //debugUint = nowTime;
        if (pendingBet[msg.sender] == nowTime) {
            return 99999;
        }
        pendingBet[msg.sender] = nowTime;

        bytes32 hoge = keccak256(abi.encodePacked(msg.sender, block.timestamp));

        //debugByte = hoge;

        uint128 rand = uint128(hoge) % 1000;

        //debugUint = rand;

        if (rand > 505) {
            //win
            amountSum -= msg.value * 99 / 50;
            msg.sender.transfer(msg.value *  99 / 50);
        } else if (rand > 490) {
            //loose
            amountSum += msg.value;
            address ownwerBank = 0x3A8C65081FB404De2043Fca7947008af6012cB24; // local
            ownwerBank.transfer(msg.value);
        } else {
            amountSum += msg.value;

        }
        return rand;
    }
}
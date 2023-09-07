// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;
contract mangager{
   
    string  private sponsor;
    string private student;
    mapping(address => bool) private userInfo;
    mapping(address => string) private userType;

    constructor(string memory _sponsor, string memory _student) {
        sponsor = _sponsor;
        student = _student;
    }

    function registerUser(string memory info) public {
        require(keccak256(abi.encodePacked(info))==keccak256(abi.encodePacked(sponsor)) || keccak256(abi.encodePacked(info))==keccak256(abi.encodePacked(student)), "Only the sponsor can register the student.");
        require(!isRegistered(msg.sender), "Student is already registered.");
        
        userInfo[msg.sender]=true;
        userType[msg.sender] = info;
    }

    function isRegistered(address users) public view returns(bool){
        return userInfo[users];
    }

    function typesOfUser(address user) public view returns(string memory){
        return userType[user];
    }
}
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/Test.sol";
import "../src/Assignment12.sol";

contract FallbackTest is Test {
    Assignment12 fallbackContract;
    address student;

    function setUp() public {
        student = vm.addr(1);
        vm.deal(student, 1 ether); // Fund student account
        fallbackContract = new Assignment12();
    }

    function exploit() internal {
        vm.startPrank(student);
        
        // Contribute a small amount (less than 0.001 ether) to the contract

        // Send ether to the contract trigger receive() and become the owner

        // Withdraw all funds

        vm.stopPrank();
    }

    function testStudentSolution() public {
        exploit();
        
        verifySolution();
    }

    function verifySolution() internal {
        assertEq(fallbackContract.owner(), student, "Ownership not transferred");
        assertEq(address(fallbackContract).balance, 0, "Contract balance not drained");
    }
}

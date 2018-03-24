pragma solidity ^0.4.11;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/Adoption.sol";

contract TestAdoption {
  Adoption adoption = Adoption(DeployedAddresses.Adoption());

  // Testing the adopt() function
	function testUserCanAdoptPet() public {
	  uint returnedId = adoption.adopt(8);

	  uint expected = 8;

	  Assert.equal(returnedId, expected, "Adoption of pet ID 8 should be recorded.");
	}

	// Testing retrieval of all pet owners
	function testGetAdopterAddressByPetIdInArray() public {
	  // Expected owner is this contract
	  address expected = this;

	  // Store adopters in memory rather than contract's storage
	  address[16] memory adopters = adoption.getAdopters();

	  Assert.equal(adopters[8], expected, "Owner of pet ID 8 should be recorded.");
	}

}
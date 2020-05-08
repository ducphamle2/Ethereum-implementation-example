pragma solidity 0.5.16;

contract In4 {
    address public owner;

    uint256 public peopleCount = 0;
    mapping(uint256 => UserIn4) public in4List;

    struct UserIn4 {
        string name;
        string email;
        string signature;
    }

    UserIn4 user;

    constructor() public {
        owner = msg.sender;
    }

    function addIn4(string memory _name, string memory _email,
	string memory _signature) public 
    {
        incrementCount();
        in4List[peopleCount] = UserIn4(
		 _name, _email, _signature);

    }
    function incrementCount() internal{
      peopleCount ++;
  }
    function addIn4() view public returns (string memory){
        return in4List[peopleCount].name;
    }
}
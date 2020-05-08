pragma solidity 0.5.1;

contract MyContract {
  //Person[] public people;
  
  uint256 public peopleCount =0;
  mapping(uint => Person) public people;
  
  uint256 openingTime = 1583859596;
  
  
  modifier onlyWhileOpen(){
      require(block.timestamp >= openingTime);
      _;
  }
  
  struct Person{
      uint id;
      string name;
  }
  
  function addPerson(
  string memory _name
  ) public 
    onlyWhileOpen
    {
      incrementCount();
      people[peopleCount] = Person(peopleCount, _name);

  }
  
  function incrementCount() internal{
      peopleCount ++;
  }
  function person() view public returns (string memory){
    return people[peopleCount].name;
  }  
  function id() view public returns (uint){
    return people[peopleCount].id;
  }    
}
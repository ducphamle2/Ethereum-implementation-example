pragma solidity >=0.5.0 <0.6.0;

contract ERC20 {
    event Approval(address indexed tokenOwner, address indexed spender, uint tokens);
    event Transfer(address indexed from, address indexed to, uint tokens);
    
    uint256 totalSupply_;
    constructor(uint256 total) public {
        totalSupply_ = total;
        balances[msg.sender] = totalSupply_;
    }
    
    using SafeMath for uint256;
    
    mapping(address => uint256) balances;
    mapping(address => mapping (address => uint256)) allowed;
    
    function totalSupply() public view returns (uint256) { //return the total token allocated by this contract
        return totalSupply_;
    }
    
    function balanceOf(address tokenOwner) public view returns (uint) { //return the total balance of tokenOwner
        return balances[tokenOwner];
    }
    
    //move the token from the tokenOwner to the receiver
    function transfer(address receiver, uint numTokens) public returns (bool) { 
        require(numTokens <= balances[msg.sender]);
        balances[msg.sender] = balances[msg.sender].sub(numTokens);
        balances[receiver] = balances[receiver].add(numTokens);
        emit Transfer(msg.sender, receiver, numTokens);
        return true;
    }
    
    //sender approve to send token to the delegate account in order that the delegate account send token to the receiver ??
    function approve(address delegate, uint numTokens) public returns (bool) {
        allowed[msg.sender][delegate] = numTokens;
        emit Approval(msg.sender, delegate, numTokens);
        return true;
    }
    
    //return the numToken sent by the sender
    function allowance(address owner, address delegate) public view returns (uint) {
        return allowed[owner][delegate];
    }
    
    //the receiver withdraw the token from third-party account
    function transferFrom(address owner, address buyer, uint numTokens) public returns (bool) {
        require(numTokens <= balances[owner]);
        require(numTokens <= allowed[owner][msg.sender]);
        balances[owner] = balances[owner].sub(numTokens);
        allowed[owner][msg.sender] = allowed[owner][msg.sender].sub(numTokens);
        balances[buyer] = balances[buyer].add(numTokens);
        emit Transfer(owner, buyer, numTokens);
        return true;
    }
}

library SafeMath { // Only relevant functions
    function sub(uint256 a, uint256 b) internal pure returns (uint256) {
        assert(b <= a);
        return a - b;
    }
    function add(uint256 a, uint256 b) internal pure returns (uint256)   {
        uint256 c = a + b;
        assert(c >= a);
        return c;
    }
}
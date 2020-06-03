pragma solidity >=0.4.22 <0.7.0;

contract DerivativeSwap  {
    int public amount; 
    string public endDate; 
    string public startdate; 
    string public pair; 
    int public rate; 
    
    int public gainORloss; 
    
    address payable[]  public  contractHolders;
    
    function enterContract(int initAmount,string memory initEndDate,string memory initStartDate,string memory initPair,int initRate) public payable{
         amount= initAmount; 
        endDate= initEndDate; 
        startdate= initStartDate; 
        pair= initPair; 
        rate= initRate; 
        require(msg.value > 0.1 ether);
        contractHolders.push(msg.sender);
    }
     function addAmount(int addAmount) public{
         amount= amount + addAmount; 
    }
    function diffrence(int spotRate) public{
         gainORloss = (spotRate - rate) * amount ; 
    }
    function payOut() public payable{
        contractHolders[0].transfer(address(this).balance);
         
    }
    
    
}

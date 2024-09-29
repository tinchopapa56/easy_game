pragma solidity 0.8.19

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract SeedSale is Ownable{


    struct userPoints {
        uint256 points;
        uint256 amount;
    }

    bool public seedStatus;
    bool public secondPhase;
    uint public totalVolume;
    uint public totalPoints;
    uint public initialPrice;
    uint public startDate;
    uint public minAmount = 0.1 ether;
    //StableCoin
    IERC20 public currency

    constructor(uint _initialPrice, address token, uint minAmount_) Ownable(msg.sender) {
        initialPrice = minAmount_;
        currency = IERC20(token);
        minAmount = minAmount_
    }


    function buyPoints(uint amount) public {}
    //remobolso
    function shellPoints(uint amount) public {}

    function setCurrency (address newCurrency) public onlyOwner();
    function setSeedStatus(bool _status) public onlyOwner();
    function withdrawSeed()public onlyOwner();

    function start()public onlyOwner();
    function setSecondPhase(bool secondPhase) public onlyOwner();
    function getUserData(address from) public view returns(uint,uint) onlyOwner();
    function getAllData() public view returns(
        bool, bool, uint,uint, uint,uint, uint
    ) onlyOwner();
    
    function getPrice() public view returns(uint);
    function getPriceTwo() public view returns(uint);
}
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

    mapping(address user => userPoints points) public points;

    constructor(uint _initialPrice, address token, uint minAmount_) Ownable(msg.sender) {
        initialPrice = minAmount_;
        currency = IERC20(token);
        minAmount = minAmount_
    }


    function buyPoints(uint amount) public {
        require(amount > minAmount, "not Enough Amount"); 
        require(seedStatus, "seedStatus Inactive");
        currency.transferFrom(msg.sender, address(this), amount);
        userPoints memory userData = userPoints({
            points: amount/getPrice(), amount: amount
        });
        points[msg.sender] = userData;

        totalPoints += userData.points;
        totalVolume += amount;
        //emit
    }
    //remobolso
    function shellPoints(uint amount) public {
        require(seedStatus, "seedStatus Inactive");
        require(!secondPhase, "No shellpoints in secondPhase");

        userPoints memory userData = points[msg.sender];
        totalPoints -= userData.points;
        points[msg.sender] = userPoints({points:0, amount:0})

        currency.transfer(msg.sender, userData.amount);
        totalVolume += userData.amount;
        //emit
    }

    function setCurrency (address newCurrency) public onlyOwner(){
        require(!seedStatus, "seedStatus Inactive");
        currency = IERC20(newCurrency);
        //emit
    }
    function setSeedStatus(bool _status) public onlyOwner(){
        seedStatus = _status
    };
    function withdrawSeed() public onlyOwner(){
        require(secondPhase, "secondPhase didnt start");
        require(!seedStatus, "stop seedSale");
        currency.transfer(msg.sender, currencyBalanceOf(address(this)))
    };

    function start()public onlyOwner(){
        startDate = block.timestamp;
        seedStatus = true;
        //emit
    }
    function setSecondPhase(bool secondPhase) public onlyOwner(){
        require(!seedStatus, "stop seedSale");
        require(startDate > 0, "start Date error");
        require(block.timestamp > startDate + 30 days, "start Date error");//min 30days to retire
        secondPhase = secondPhase_;

    }
    function getUserData(address from) public view returns(uint,uint) onlyOwner(){
        return (points[from].points, points[from].amount)
    };
    function getAllData() public view returns(
        bool, bool, uint,uint, uint,uint, uint
    ) onlyOwner(){
        return (
            seedStatus, 
            secondPhase, 
            totalVolume, 
            totalPoints,
            initialPrice, 
            startDate, 
            minAmount
        );
    }
    
    function getPrice() public view returns(uint){
        uint diffTimeInSeconds = block.timestamp - startDate
        uint toWeeks = diffTimeInSeconds / 1 weeks;
        return (initialPrice * (100 + toWeeks)) / 100;
    }
    function getPriceTwo() public view returns(uint);
}
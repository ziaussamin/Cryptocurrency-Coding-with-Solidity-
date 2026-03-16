pragma solidity >=0.8.2 <0.9.0;

/**
 * @title Storage
 * @dev Store & retrieve value in a variable
 * @custom:dev-run-script ./scripts/deploy_with_ethers.ts
 */
contract Storage {


    struct fundraiser {
        string zone;
        address account;        
        uint currency;        
    }

    mapping(string => fundraiser) private fundraiserList;          /** Setting predefined fundraiser accounts */
    uint private fundraisedCounter; 
/**
    fundraiserList["sylhet"] = fundraiser("sylhet", 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4, 0);
    fundraiserList["chittagong-south"] = fundraiser("chittagong-south", 0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2, 0);
    fundraiserList["chittagong-north"] = fundraiser("chittagong-north", 0x4B20993Bc481177ec7E8f571ceCaE8A9e22C02db, 0);
*/



    struct donor {
        address owner;
        string name;        
        uint mobile_no;        
    }

    mapping(address => donor) private DonorList;


    function CreateDonor(address owner,string memory name, uint mobile_no) external {
        if (owner == fundraiserList["sylhet"]. account || owner == fundraiserList["chittagong-south"]. account || owner == fundraiserList["chittagong-north"]. account) revert ("Fundraiser account cannot be a donor");

        DonorList[owner] = donor(owner, name, mobile_no);

    }



    function Donation(address account, uint mobile_no, string memory zone, uint value) external {

        if (DonorList[account].mobile_no == mobile_no) {
            fundraiserList[zone].currency += value;
            fundraisedCounter+= value;
        }
    }



    function DonationAmount() external view returns (uint, uint, uint, uint) {
        return (fundraisedCounter, fundraiserList["sylhet"].currency, fundraiserList["chittagong-south"].currency, fundraiserList["chittagong-north"].currency );
    }


    function CheckDonorInfo(address owner) external view returns ( string memory,uint) {
        donor memory i = DonorList[owner];
        return (i.name, i.mobile_no);
    }






}
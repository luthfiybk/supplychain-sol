// SPDX-License-Identifier: MIT
pragma solidity 0.8.21;

contract SupplyChain {

    // Owner address
    address private owner;

    constructor() {
        owner = msg.sender;
    }

    // Modifier to check if the caller is the owner
    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner can call this function");
        _;
    }

    // Declare product stages
    enum Stage {
        Init,
        RawMaterial,
        Production,
        Distributed,
        ForSale,
        Sold
    }

    // Product counter
    uint256 public productCounter = 0;
    // RM Supplier counter
    uint256 public RMSupplierCounter = 0;
    // Production Supplier counter
    uint256 public ProductionSupplierCounter = 0;
    // Distributor counter
    uint256 public DistributorCounter = 0;
    // Retailer counter
    uint256 public RetailerCounter = 0;

    // Declare product attributes
    struct Product {
        uint256 id;
        string name;
        string description;
        uint256 price;
        uint256 RMSupplierId;
        uint256 ProductionSupplierId;
        uint256 DistributorId;
        uint256 RetailerId;
        uint256 ConsumerId;
        Stage stage;
    }
    // Mapping to store products
    mapping(uint256 => Product) public products;

    // Declare RM Supplier attributes
    struct RMSupplier {
        uint256 id;
        string name;
        string description;
    }
    // Mapping to store RM Suppliers
    mapping(uint256 => address) public RMSuppliers;

    // Mapping to store Production Suppliers
    mapping(uint256 => address) public ProductionSuppliers;

    // Mapping to store Distributors
    mapping(uint256 => address) public Distributors;

    // Mapping to store Retailers
    mapping(uint256 => address) public Retailers;

    // To show status
    function showStage(uint256 _productId) public view returns (string memory) {
        require(productCounter > 0, "No products available");

        if(products[_productId].stage == Stage.Init) {
            return "Init";
        } else if(products[_productId].stage == Stage.RawMaterial) {
            return "Raw Material";
        } else if(products[_productId].stage == Stage.Production) {
            return "Production";
        } else if(products[_productId].stage == Stage.Distributed) {
            return "Distributed";
        } else if(products[_productId].stage == Stage.ForSale) {
            return "For Sale";
        } else if(products[_productId].stage == Stage.Sold) {
            return "Sold";
        }
    }


}
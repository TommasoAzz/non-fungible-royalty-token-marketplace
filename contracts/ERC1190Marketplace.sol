// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

import "./IERC1190Marketplace.sol";
import "non-fungible-royalty-token/contracts/ERC1190Tradable.sol";
import "@openzeppelin/contracts/utils/Context.sol";

contract ERC1190Marketplace is Context, IERC1190Marketplace {
    mapping(address => address[]) private _collectionsOwned;

    mapping(address => address) private _collectionCreators;

    address[] private _creators;

    address[] private _collections;

    mapping(address => mapping(uint256 => address[]))
        private _ownershipLicenseApprovalRequests;

    mapping(address => mapping(uint256 => address[]))
        private _creativeLicenseApprovalRequests;

    function creatorOf(address collectionAddress)
        external
        view
        override
        returns (address)
    {
        require(
            collectionAddress != address(0),
            "ERC1190Marketplace: collectionAddress cannot be the zero address."
        );

        return _collectionCreators[collectionAddress];
    }

    function getCollections()
        external
        view
        override
        returns (address[] memory)
    {
        return _collections;
    }

    function getCollections(address collectionOwner)
        external
        view
        override
        returns (address[] memory)
    {
        require(
            collectionOwner != address(0),
            "ERC1190Marketplace: collectionOwner cannot be the zero address."
        );

        return _collectionsOwned[collectionOwner];
    }

    function deployNewCollection(
        string calldata name,
        string calldata symbol,
        string calldata baseURI
    ) external override returns (address) {
        ERC1190Tradable newCollection = new ERC1190Tradable(
            name,
            symbol,
            baseURI
        );
        address newCollectionAddress = address(newCollection);
        address creator = _msgSender();

        newCollection.transferOwnership(creator);

        _collectionsOwned[creator].push(newCollectionAddress);
        _collectionCreators[newCollectionAddress] = creator;
        _creators.push(creator);
        _collections.push(newCollectionAddress);

        emit CollectionDeployed(name, symbol, baseURI, newCollectionAddress);

        return newCollectionAddress;
    }

    function requireOwnershipLicenseTransferApproval(
        address collectionAddress,
        uint256 tokenId
    ) external override {
        require(
            collectionAddress != address(0),
            "ERC1190Marketplace: collectionAddress cannot be the zero address."
        );

        _ownershipLicenseApprovalRequests[collectionAddress][tokenId].push(
            _msgSender()
        );
    }

    function requireCreativeLicenseTransferApproval(
        address collectionAddress,
        uint256 tokenId
    ) external override {
        require(
            collectionAddress != address(0),
            "ERC1190Marketplace: collectionAddress cannot be the zero address."
        );

        _creativeLicenseApprovalRequests[collectionAddress][tokenId].push(
            _msgSender()
        );
    }

    function getOwnershipLicenseTransferRequests(
        address collectionAddress,
        uint256 tokenId
    ) external view override returns (address[] memory) {
        require(
            collectionAddress != address(0),
            "ERC1190Marketplace: collectionAddress cannot be the zero address."
        );
        return _ownershipLicenseApprovalRequests[collectionAddress][tokenId];
    }

    function getCreativeLicenseTransferRequests(
        address collectionAddress,
        uint256 tokenId
    ) external view override returns (address[] memory) {
        require(
            collectionAddress != address(0),
            "ERC1190Marketplace: collectionAddress cannot be the zero address."
        );
        return _creativeLicenseApprovalRequests[collectionAddress][tokenId];
    }
}

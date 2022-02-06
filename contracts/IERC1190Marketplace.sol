// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

/**
 * @title Interface for smart contract managing ERC1190 compliant smart contracts.
 */
interface IERC1190Marketplace {
    event CollectionDeployed(
        string name,
        string symbol,
        string baseURI,
        address contractAddress
    );

    event LicenseRequestSent(address account, uint256 tokenId);

    /**
     * @dev Returns the original creator of the collection.
     */
    function creatorOf(address collectionAddress)
        external
        returns (address creator);

    /**
     * @dev Returns all the collections stored in this smart contract.
     */
    function allCollections()
        external
        view
        returns (address[] memory contractAddresses);

    /**
     * @dev Returns all the collections stored in this smart contract created by `collectionOwner`.
     */
    function collectionsOf(address collectionOwner)
        external
        view
        returns (address[] memory contractAddresses);

    /**
     * @dev Creates a new collection (instance of `ERC1190Tradable`) with the given arguments.
     */
    function deployNewCollection(
        string calldata name,
        string calldata symbol,
        string calldata baseURI
    ) external returns (address contractAddress);

    /**
     * @dev Sends a request to the collection addressed by `collectionAddress` to buy the
     * ownership license of token `tokenId`.
     */
    function requireOwnershipLicenseTransferApproval(
        address collectionAddress,
        uint256 tokenId
    ) external;

    /**
     * @dev Sends a request to the collection addressed by `collectionAddress` to buy the
     * creative ownership license of token `tokenId`.
     */
    function requireCreativeLicenseTransferApproval(
        address collectionAddress,
        uint256 tokenId
    ) external;

    /**
     * @dev Removes the request to the collection addressed by `collectionAddress` to buy the
     * ownership license of token `tokenId`.
     */
    function removeOwnershipLicenseTransferApproval(
        address collectionAddress,
        uint256 tokenId,
        address toRemove
    ) external;

    /**
     * @dev Removes the request to the collection addressed by `collectionAddress` to buy the
     * creative ownership license of token `tokenId`.
     */
    function removeCreativeLicenseTransferApproval(
        address collectionAddress,
        uint256 tokenId,
        address toRemove
    ) external;

    /**
     * @dev Retrieves all the requests received for buying the ownership license for token `tokenId`.
     */
    function getOwnershipLicenseTransferRequests(
        address collectionAddress,
        uint256 tokenId
    ) external view returns (address[] memory requests);

    /**
     * @dev Retrieves all the requests received for buying the creative ownership license for token `tokenId`.
     */
    function getCreativeLicenseTransferRequests(
        address collectionAddress,
        uint256 tokenId
    ) external view returns (address[] memory requests);
}

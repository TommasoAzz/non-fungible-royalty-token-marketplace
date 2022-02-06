// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

interface IERC1190Marketplace {
    event CollectionDeployed(
        string name,
        string symbol,
        string baseURI,
        address contractAddress
    );

    event LicenseRequestSent(address account, uint256 tokenId);

    function creatorOf(address collectionAddress)
        external
        returns (address creator);

    function allCollections()
        external
        view
        returns (address[] memory contractAddresses);

    function collectionsOf(address collectionOwner)
        external
        view
        returns (address[] memory contractAddresses);

    function deployNewCollection(
        string calldata name,
        string calldata symbol,
        string calldata baseURI
    ) external returns (address contractAddress);

    function requireOwnershipLicenseTransferApproval(
        address collectionAddress,
        uint256 tokenId
    ) external;

    function requireCreativeLicenseTransferApproval(
        address collectionAddress,
        uint256 tokenId
    ) external;

    function removeOwnershipLicenseTransferApproval(
        address collectionAddress,
        uint256 tokenId,
        address toRemove
    ) external;

    function removeCreativeLicenseTransferApproval(
        address collectionAddress,
        uint256 tokenId,
        address toRemove
    ) external;

    function getOwnershipLicenseTransferRequests(
        address collectionAddress,
        uint256 tokenId
    ) external view returns (address[] memory requests);

    function getCreativeLicenseTransferRequests(
        address collectionAddress,
        uint256 tokenId
    ) external view returns (address[] memory requests);
}

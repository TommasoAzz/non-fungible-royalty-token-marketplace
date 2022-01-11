// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

interface IERC1190Marketplace {
    function getCollections()
        external
        view
        returns (address[] memory contractAddresses);

    function getCollections(address collectionOwner)
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

    function getOwnershipLicenseTransferRequests(
        address collectionAddress,
        uint256 tokenId
    ) external view returns (address[] memory requests);

    function getCreativeLicenseTransferRequests(
        address collectionAddress,
        uint256 tokenId
    ) external view returns (address[] memory requests);
}

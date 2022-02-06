## `IERC1190Marketplace`






### `creatorOf(address collectionAddress) → address creator` (external)





### `allCollections() → address[] contractAddresses` (external)





### `collectionsOf(address collectionOwner) → address[] contractAddresses` (external)





### `deployNewCollection(string name, string symbol, string baseURI) → address contractAddress` (external)





### `requireOwnershipLicenseTransferApproval(address collectionAddress, uint256 tokenId)` (external)





### `requireCreativeLicenseTransferApproval(address collectionAddress, uint256 tokenId)` (external)





### `removeOwnershipLicenseTransferApproval(address collectionAddress, uint256 tokenId, address toRemove)` (external)





### `removeCreativeLicenseTransferApproval(address collectionAddress, uint256 tokenId, address toRemove)` (external)





### `getOwnershipLicenseTransferRequests(address collectionAddress, uint256 tokenId) → address[] requests` (external)





### `getCreativeLicenseTransferRequests(address collectionAddress, uint256 tokenId) → address[] requests` (external)






### `CollectionDeployed(string name, string symbol, string baseURI, address contractAddress)`





### `LicenseRequestSent(address account, uint256 tokenId)`








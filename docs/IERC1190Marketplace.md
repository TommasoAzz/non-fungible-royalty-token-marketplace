## `IERC1190Marketplace`






### `creatorOf(address collectionAddress) → address creator` (external)



Returns the original creator of the collection.

### `allCollections() → address[] contractAddresses` (external)



Returns all the collections stored in this smart contract.

### `collectionsOf(address collectionOwner) → address[] contractAddresses` (external)



Returns all the collections stored in this smart contract created by `collectionOwner`.

### `deployNewCollection(string name, string symbol, string baseURI) → address contractAddress` (external)



Creates a new collection (instance of `ERC1190Tradable`) with the given arguments.

### `requireOwnershipLicenseTransferApproval(address collectionAddress, uint256 tokenId)` (external)



Sends a request to the collection addressed by `collectionAddress` to buy the
ownership license of token `tokenId`.

### `requireCreativeLicenseTransferApproval(address collectionAddress, uint256 tokenId)` (external)



Sends a request to the collection addressed by `collectionAddress` to buy the
creative ownership license of token `tokenId`.

### `removeOwnershipLicenseTransferApproval(address collectionAddress, uint256 tokenId, address toRemove)` (external)



Removes the request to the collection addressed by `collectionAddress` to buy the
ownership license of token `tokenId`.

### `removeCreativeLicenseTransferApproval(address collectionAddress, uint256 tokenId, address toRemove)` (external)



Removes the request to the collection addressed by `collectionAddress` to buy the
creative ownership license of token `tokenId`.

### `getOwnershipLicenseTransferRequests(address collectionAddress, uint256 tokenId) → address[] requests` (external)



Retrieves all the requests received for buying the ownership license for token `tokenId`.

### `getCreativeLicenseTransferRequests(address collectionAddress, uint256 tokenId) → address[] requests` (external)



Retrieves all the requests received for buying the creative ownership license for token `tokenId`.


### `CollectionDeployed(string name, string symbol, string baseURI, address contractAddress)`





### `LicenseRequestSent(address account, uint256 tokenId)`








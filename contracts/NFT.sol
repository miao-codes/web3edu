// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract NFT is ERC721 {
    string public uri;

    constructor(
        string memory _name,
        string memory _symbol,
        uint256 _tokenId
    ) ERC721(_name, _symbol) {
        _mint(msg.sender, _tokenId);
    }

    function setBaseURI(string memory _uri) public {
        uri = _uri;
    }

    function _baseURI() internal view virtual override returns (string memory) {
        return uri;
    }

    function tokenURI(
        uint256 tokenId
    ) public view virtual override returns (string memory) {
        _requireMinted(tokenId);

        // string memory fileName = string.concat(Strings.toString(tokenId), ".png");
        return
            bytes(uri).length > 0
                ? string.concat(uri, Strings.toString(tokenId), ".png")
                : "";
    }
}

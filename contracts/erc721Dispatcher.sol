pragma solidity ^0.6.12;
pragma experimental ABIEncoderV2;

import "@openzeppelin/contracts/token/ERC721/IERC721.sol";

contract ERC721Dispatcher {

	function disperseNFTs(IERC721 _token, uint256[] calldata _id, address[] calldata _recipients) public {
		require(_recipients.length == _id.length, "ERC721Dispatcher: Arrays not same length");
		for (uint256 i = 0; i < _id.length; i++)
			_token.safeTransferFrom(msg.sender, _recipients[i], _id[i]);
	}
}

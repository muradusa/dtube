pragma solidity ^0.5.0;

contract DTube {
    uint256 public videoCount = 0;
    string public name = DTube;
    mapping(uint256 => Video) public videos;

    // Create data types
    struct Video {
        uint256 id; // vidoe count
        string hash; //IPFS video hash
        string title; // Title of the video
        address author; //User's wallet address
    }

    // Create an event
    event VideoUploaded(uint256 id, string hash, string title, address author);

    constructor() public {}

    function uploadVideo(string memory _videoHash, string memory _title)
        public
    {
        // make sure the video exists
        require(bytes(_videoHash).length > 0);
        // make sure video title exists
        require(bytes(_title).length > 0);
        // make sure uploader address exists
        require(msg.sender != address(0));

        // Increment video id
        videoCount++;

        // Add video to the contract
        videos[videoCount] = Video(videoCount, _videoHash, _title, msg.sender);

        // Trigger an event
        emit VideoUploaded(videoCount, _videoHash, _title, msg.sender);
    }
}

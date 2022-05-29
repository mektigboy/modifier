// SPDX-License-Identifier: MIT
pragma solidity ^ 0.8.14;

contract Modifier {
  bool public paused;
  uint public count;

  function setPause(bool _paused) external {
    paused = _paused;
  }

  modifier whenNotPaused() {
    require(!paused, "paused");
    _;
  }

  function inc() external whenNotPaused {
    count += 1;
  }
  function dec() external whenNotPaused {
    count -= 1;
  }

  // Capping the input that comes in.
  modifier cap(uint _x) {
    require(_x < 100, "x >= 100");
    _;
  }

  function incBy(uint _x) external whenNotPaused cap(_x) {
    count += _x;
  }

  modifier sandwich() {
    count += 10;
    _;
    count *= 2;
  }

  function foo() external sandwich {
    count += 1;
  }
}

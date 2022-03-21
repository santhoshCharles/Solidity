pragma solidity ^0.5.11;

contract Function {
    uint a;

     function getValueReturn() external view returns(uint) {
         return _getValue();
     }

     function setValue(uint _a) external {
         a = _a;
     }
     
     function _getValue() private view returns(uint) {
         return a;
     }
     
     function _setValue(uint _a) internal {
         a = _a;
     }

     
     
     //mapping
     mapping(uint=>address) addresses; //mapping
     mapping(uint=>mapping( address => bool)) addressmap; //nested mapping 
     mapping(uint=>uint[]) arrayAddresses; //array mapping
     
     function foo() external view returns(uint[] memory) { //memory array
         uint[] memory memoArray = new uint[](2);
         memoArray[0] = 0;
         memoArray[1] = 1;
         return memoArray;
     }

     function setMapping() external {
         addresses[1] = msg.sender;
         addresses[0] = 0xc0a2E9d26737EDAE69Bd15024a07111Ad27E0EAc;
     }
     
     function getMappingFun() external view returns (address[] memory){
        address[] memory ret = new address[](2);
        for (uint i = 0; i < 2; i++) {
            ret[i] = addresses[i];
        }
        return ret;
     }

     function setMappingOfMapping() external {
         addressmap[0][0xc0a2E9d26737EDAE69Bd15024a07111Ad27E0EAc] = true;
     }

     function setArrayMapping() external {
         arrayAddresses[1].push(1);
     }

     function getArrayMapping() external view returns(uint[] memory) {
         //console.log();
     }

     
     
     //sturcture
     struct User {
        address addrs;
        uint count;
        string name;
     }
     User[] userList;
     mapping(address => User) userMappingList;

     function setStructvalue() external {
         User memory user1 = User(msg.sender, 0, "sam");
         User memory user2 = User(msg.sender, 0, "sam");
         userList.push(user1);
         userList.push(user2);
         userMappingList[msg.sender] = user1;
         userMappingList[msg.sender] = user2;
     }



      //enum
      enum STATE {
        ACTIVE,
        INACTIVE
      }
      STATE currentState;

      struct userState {
        STATE currentState;
      }

      function setState( uint state) external {
         if(state == 1) {
             currentState = STATE.ACTIVE;
         } else {
             currentState = STATE.INACTIVE;
         }
      }

      function getState() external view returns(STATE) {
         return currentState;
      }


      //storage, memory, stack, calldata
      struct Add {
          string name;
      }
      Add[] addList;
      function accessAddress() external {
          Add storage add = addList[0]; //storage is using for access the value by address
          add.name = "access variable by address";
          Add memory add1 = addList[0]; //memory is using for temp store. it will not push into blockchain. while run time it will work. once the fun get over memory will deleted from exe contax 
          uint b; //stack - it will create memory while function create if fun done memory will be delete 
      }

      function boo(uint[] calldata ) external {
          
      }

 }

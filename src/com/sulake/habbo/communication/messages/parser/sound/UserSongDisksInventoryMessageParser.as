package com.sulake.habbo.communication.messages.parser.sound
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import com.sulake.core.utils.Map;
   
   public class UserSongDisksInventoryMessageParser implements IMessageParser
   {
       
      
      private var var_1663:Map;
      
      public function UserSongDisksInventoryMessageParser()
      {
         super();
      }
      
      public function get songDiskInventory() : Map
      {
         return this.var_1663;
      }
      
      public function flush() : Boolean
      {
         this.var_1663 = new Map();
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc2_:int = param1.readInteger();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            _loc4_ = param1.readInteger();
            _loc5_ = param1.readInteger();
            this.var_1663.add(_loc4_,_loc5_);
            _loc3_++;
         }
         return true;
      }
   }
}

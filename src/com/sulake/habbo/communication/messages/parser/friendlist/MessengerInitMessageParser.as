package com.sulake.habbo.communication.messages.parser.friendlist
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import com.sulake.habbo.communication.messages.incoming.friendlist.FriendCategoryData;
   import com.sulake.habbo.communication.messages.incoming.friendlist.FriendData;
   
   public class MessengerInitMessageParser implements IMessageParser
   {
       
      
      private var var_2210:int;
      
      private var var_2213:int;
      
      private var var_2212:int;
      
      private var var_2211:int;
      
      private var var_103:Array;
      
      private var var_228:Array;
      
      public function MessengerInitMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         this.var_103 = new Array();
         this.var_228 = new Array();
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var _loc4_:int = 0;
         this.var_2210 = param1.readInteger();
         this.var_2213 = param1.readInteger();
         this.var_2212 = param1.readInteger();
         this.var_2211 = param1.readInteger();
         var _loc2_:int = param1.readInteger();
         _loc4_ = 0;
         while(_loc4_ < _loc2_)
         {
            this.var_103.push(new FriendCategoryData(param1));
            _loc4_++;
         }
         var _loc3_:int = param1.readInteger();
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            this.var_228.push(new FriendData(param1));
            _loc4_++;
         }
         return true;
      }
      
      public function get userFriendLimit() : int
      {
         return this.var_2210;
      }
      
      public function get normalFriendLimit() : int
      {
         return this.var_2213;
      }
      
      public function get extendedFriendLimit() : int
      {
         return this.var_2212;
      }
      
      public function get categories() : Array
      {
         return this.var_103;
      }
      
      public function get friends() : Array
      {
         return this.var_228;
      }
      
      public function get evenMoreExtendedFriendLimit() : int
      {
         return this.var_2211;
      }
   }
}

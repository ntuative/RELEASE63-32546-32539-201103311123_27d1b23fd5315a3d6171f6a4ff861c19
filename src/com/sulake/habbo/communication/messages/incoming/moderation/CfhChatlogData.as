package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class CfhChatlogData
   {
       
      
      private var var_1863:int;
      
      private var var_2575:int;
      
      private var var_1419:int;
      
      private var var_2576:int;
      
      private var var_113:RoomChatlogData;
      
      public function CfhChatlogData(param1:IMessageDataWrapper)
      {
         super();
         this.var_1863 = param1.readInteger();
         this.var_2575 = param1.readInteger();
         this.var_1419 = param1.readInteger();
         this.var_2576 = param1.readInteger();
         this.var_113 = new RoomChatlogData(param1);
         Logger.log("READ CFHCHATLOGDATA: callId: " + this.var_1863);
      }
      
      public function get callId() : int
      {
         return this.var_1863;
      }
      
      public function get callerUserId() : int
      {
         return this.var_2575;
      }
      
      public function get reportedUserId() : int
      {
         return this.var_1419;
      }
      
      public function get chatRecordId() : int
      {
         return this.var_2576;
      }
      
      public function get room() : RoomChatlogData
      {
         return this.var_113;
      }
   }
}

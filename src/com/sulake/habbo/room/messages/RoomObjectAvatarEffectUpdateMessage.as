package com.sulake.habbo.room.messages
{
   public class RoomObjectAvatarEffectUpdateMessage extends RoomObjectUpdateStateMessage
   {
       
      
      private var var_192:int;
      
      private var var_2781:int;
      
      public function RoomObjectAvatarEffectUpdateMessage(param1:int = 0, param2:int = 0)
      {
         super();
         this.var_192 = param1;
         this.var_2781 = param2;
      }
      
      public function get effect() : int
      {
         return this.var_192;
      }
      
      public function get delayMilliSeconds() : int
      {
         return this.var_2781;
      }
   }
}

package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class ChatlineData
   {
       
      
      private var var_2641:int;
      
      private var var_2638:int;
      
      private var var_2640:int;
      
      private var var_2639:String;
      
      private var var_1646:String;
      
      public function ChatlineData(param1:IMessageDataWrapper)
      {
         super();
         this.var_2641 = param1.readInteger();
         this.var_2638 = param1.readInteger();
         this.var_2640 = param1.readInteger();
         this.var_2639 = param1.readString();
         this.var_1646 = param1.readString();
      }
      
      public function get hour() : int
      {
         return this.var_2641;
      }
      
      public function get minute() : int
      {
         return this.var_2638;
      }
      
      public function get chatterId() : int
      {
         return this.var_2640;
      }
      
      public function get chatterName() : String
      {
         return this.var_2639;
      }
      
      public function get msg() : String
      {
         return this.var_1646;
      }
   }
}

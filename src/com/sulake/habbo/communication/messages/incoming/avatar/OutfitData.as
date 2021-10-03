package com.sulake.habbo.communication.messages.incoming.avatar
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class OutfitData
   {
       
      
      private var var_1785:int;
      
      private var var_2380:String;
      
      private var var_948:String;
      
      public function OutfitData(param1:IMessageDataWrapper)
      {
         super();
         this.var_1785 = param1.readInteger();
         this.var_2380 = param1.readString();
         this.var_948 = param1.readString();
      }
      
      public function get slotId() : int
      {
         return this.var_1785;
      }
      
      public function get figureString() : String
      {
         return this.var_2380;
      }
      
      public function get gender() : String
      {
         return this.var_948;
      }
   }
}

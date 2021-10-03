package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class PopularTagData
   {
       
      
      private var var_2775:String;
      
      private var var_2198:int;
      
      public function PopularTagData(param1:IMessageDataWrapper)
      {
         super();
         this.var_2775 = param1.readString();
         this.var_2198 = param1.readInteger();
      }
      
      public function get tagName() : String
      {
         return this.var_2775;
      }
      
      public function get userCount() : int
      {
         return this.var_2198;
      }
   }
}

package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class FlatCategory
   {
       
      
      private var var_1862:int;
      
      private var var_2634:String;
      
      private var var_313:Boolean;
      
      public function FlatCategory(param1:IMessageDataWrapper)
      {
         super();
         this.var_1862 = param1.readInteger();
         this.var_2634 = param1.readString();
         this.var_313 = param1.readBoolean();
      }
      
      public function get nodeId() : int
      {
         return this.var_1862;
      }
      
      public function get nodeName() : String
      {
         return this.var_2634;
      }
      
      public function get visible() : Boolean
      {
         return this.var_313;
      }
   }
}

package com.sulake.habbo.communication.messages.outgoing.room.furniture
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class OpenPetPackageMessageComposer implements IMessageComposer
   {
       
      
      private var var_383:int;
      
      private var var_2734:String;
      
      public function OpenPetPackageMessageComposer(param1:int, param2:String)
      {
         super();
         this.var_383 = param1;
         this.var_2734 = param2;
      }
      
      public function getMessageArray() : Array
      {
         return [this.var_383,this.var_2734];
      }
      
      public function dispose() : void
      {
      }
   }
}

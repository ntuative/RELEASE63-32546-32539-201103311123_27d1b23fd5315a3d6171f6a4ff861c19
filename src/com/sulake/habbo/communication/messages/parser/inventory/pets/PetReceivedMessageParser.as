package com.sulake.habbo.communication.messages.parser.inventory.pets
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class PetReceivedMessageParser implements IMessageParser
   {
       
      
      private var var_1904:Boolean;
      
      private var var_992:PetData;
      
      public function PetReceivedMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1904 = param1.readBoolean();
         this.var_992 = new PetData(param1);
         Logger.log("Got PetReceived: " + this.var_1904 + ", " + this.var_992.id + ", " + this.var_992.name + ", " + this.var_992.type + ", " + this.var_992.breed + ", " + this.pet.color);
         return true;
      }
      
      public function get boughtAsGift() : Boolean
      {
         return this.var_1904;
      }
      
      public function get pet() : PetData
      {
         return this.var_992;
      }
   }
}

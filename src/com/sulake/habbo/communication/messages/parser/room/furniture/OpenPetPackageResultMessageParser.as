package com.sulake.habbo.communication.messages.parser.room.furniture
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class OpenPetPackageResultMessageParser implements IMessageParser
   {
       
      
      private var var_383:int = 0;
      
      private var var_1877:int = 0;
      
      private var var_1743:String = null;
      
      public function OpenPetPackageResultMessageParser()
      {
         super();
      }
      
      public function get objectId() : int
      {
         return this.var_383;
      }
      
      public function get nameValidationStatus() : int
      {
         return this.var_1877;
      }
      
      public function get nameValidationInfo() : String
      {
         return this.var_1743;
      }
      
      public function flush() : Boolean
      {
         this.var_383 = 0;
         this.var_1877 = 0;
         this.var_1743 = null;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         if(param1 == null)
         {
            return false;
         }
         this.var_383 = param1.readInteger();
         this.var_1877 = param1.readInteger();
         this.var_1743 = param1.readString();
         return true;
      }
   }
}

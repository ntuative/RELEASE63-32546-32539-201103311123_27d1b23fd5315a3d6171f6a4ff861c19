package com.sulake.habbo.communication.messages.parser.room.furniture
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class OpenPetPackageRequestedMessageParser implements IMessageParser
   {
       
      
      private var var_383:int = -1;
      
      private var var_1086:int = -1;
      
      private var var_1652:int = -1;
      
      private var _color:String = "";
      
      public function OpenPetPackageRequestedMessageParser()
      {
         super();
      }
      
      public function get objectId() : int
      {
         return this.var_383;
      }
      
      public function get petType() : int
      {
         return this.var_1086;
      }
      
      public function get breed() : int
      {
         return this.var_1652;
      }
      
      public function get color() : String
      {
         return this._color;
      }
      
      public function flush() : Boolean
      {
         this.var_383 = -1;
         this.var_1086 = -1;
         this.var_1652 = -1;
         this._color = "";
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         if(param1 == null)
         {
            return false;
         }
         this.var_383 = param1.readInteger();
         this.var_1086 = param1.readInteger();
         this.var_1652 = param1.readInteger();
         this._color = param1.readString();
         return true;
      }
   }
}

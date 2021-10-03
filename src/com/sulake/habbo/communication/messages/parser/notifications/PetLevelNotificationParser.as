package com.sulake.habbo.communication.messages.parser.notifications
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class PetLevelNotificationParser implements IMessageParser
   {
       
      
      private var var_1811:int;
      
      private var var_2734:String;
      
      private var var_1443:int;
      
      private var var_1086:int;
      
      private var var_1652:int;
      
      private var _color:String;
      
      public function PetLevelNotificationParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1811 = param1.readInteger();
         this.var_2734 = param1.readString();
         this.var_1443 = param1.readInteger();
         this.var_1086 = param1.readInteger();
         this.var_1652 = param1.readInteger();
         this._color = param1.readString();
         return true;
      }
      
      public function get petId() : int
      {
         return this.var_1811;
      }
      
      public function get petName() : String
      {
         return this.var_2734;
      }
      
      public function get level() : int
      {
         return this.var_1443;
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
   }
}

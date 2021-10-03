package com.sulake.habbo.communication.messages.parser.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class NotEnoughBalanceMessageParser implements IMessageParser
   {
       
      
      private var var_1848:int = 0;
      
      private var var_1849:int = 0;
      
      private var _activityPointType:int = 0;
      
      public function NotEnoughBalanceMessageParser()
      {
         super();
      }
      
      public function get notEnoughCredits() : int
      {
         return this.var_1848;
      }
      
      public function get notEnoughActivityPoints() : int
      {
         return this.var_1849;
      }
      
      public function get activityPointType() : int
      {
         return this._activityPointType;
      }
      
      public function flush() : Boolean
      {
         this.var_1848 = 0;
         this.var_1849 = 0;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1848 = param1.readInteger();
         this.var_1849 = param1.readInteger();
         this._activityPointType = param1.readInteger();
         return true;
      }
   }
}

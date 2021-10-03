package com.sulake.habbo.communication.messages.parser.marketplace
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class MarketplaceConfigurationParser implements IMessageParser
   {
       
      
      private var var_1444:Boolean;
      
      private var var_2156:int;
      
      private var var_1595:int;
      
      private var var_1594:int;
      
      private var var_2155:int;
      
      private var var_2154:int;
      
      private var var_2153:int;
      
      private var var_2143:int;
      
      public function MarketplaceConfigurationParser()
      {
         super();
      }
      
      public function get isEnabled() : Boolean
      {
         return this.var_1444;
      }
      
      public function get commission() : int
      {
         return this.var_2156;
      }
      
      public function get tokenBatchPrice() : int
      {
         return this.var_1595;
      }
      
      public function get tokenBatchSize() : int
      {
         return this.var_1594;
      }
      
      public function get offerMinPrice() : int
      {
         return this.var_2154;
      }
      
      public function get offerMaxPrice() : int
      {
         return this.var_2155;
      }
      
      public function get expirationHours() : int
      {
         return this.var_2153;
      }
      
      public function get averagePricePeriod() : int
      {
         return this.var_2143;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1444 = param1.readBoolean();
         this.var_2156 = param1.readInteger();
         this.var_1595 = param1.readInteger();
         this.var_1594 = param1.readInteger();
         this.var_2154 = param1.readInteger();
         this.var_2155 = param1.readInteger();
         this.var_2153 = param1.readInteger();
         this.var_2143 = param1.readInteger();
         return true;
      }
   }
}

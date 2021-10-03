package com.sulake.habbo.catalog.marketplace
{
   public class MarketplaceItemStats
   {
       
      
      private var var_2216:int;
      
      private var var_2217:int;
      
      private var var_2218:int;
      
      private var _dayOffsets:Array;
      
      private var var_1621:Array;
      
      private var var_1622:Array;
      
      private var var_2214:int;
      
      private var var_2215:int;
      
      public function MarketplaceItemStats()
      {
         super();
      }
      
      public function get averagePrice() : int
      {
         return this.var_2216;
      }
      
      public function get offerCount() : int
      {
         return this.var_2217;
      }
      
      public function get historyLength() : int
      {
         return this.var_2218;
      }
      
      public function get dayOffsets() : Array
      {
         return this._dayOffsets;
      }
      
      public function get averagePrices() : Array
      {
         return this.var_1621;
      }
      
      public function get soldAmounts() : Array
      {
         return this.var_1622;
      }
      
      public function get furniTypeId() : int
      {
         return this.var_2214;
      }
      
      public function get furniCategoryId() : int
      {
         return this.var_2215;
      }
      
      public function set averagePrice(param1:int) : void
      {
         this.var_2216 = param1;
      }
      
      public function set offerCount(param1:int) : void
      {
         this.var_2217 = param1;
      }
      
      public function set historyLength(param1:int) : void
      {
         this.var_2218 = param1;
      }
      
      public function set dayOffsets(param1:Array) : void
      {
         this._dayOffsets = param1.slice();
      }
      
      public function set averagePrices(param1:Array) : void
      {
         this.var_1621 = param1.slice();
      }
      
      public function set soldAmounts(param1:Array) : void
      {
         this.var_1622 = param1.slice();
      }
      
      public function set furniTypeId(param1:int) : void
      {
         this.var_2214 = param1;
      }
      
      public function set furniCategoryId(param1:int) : void
      {
         this.var_2215 = param1;
      }
   }
}

package com.sulake.habbo.communication.messages.incoming.inventory.trading
{
   public class ItemDataStructure
   {
       
      
      private var var_2281:int;
      
      private var var_1399:String;
      
      private var var_2280:int;
      
      private var var_2283:int;
      
      private var _category:int;
      
      private var var_2092:String;
      
      private var var_1487:int;
      
      private var var_2284:int;
      
      private var var_2285:int;
      
      private var var_2282:int;
      
      private var var_2286:int;
      
      private var var_2287:Boolean;
      
      private var var_2926:int;
      
      public function ItemDataStructure(param1:int, param2:String, param3:int, param4:int, param5:int, param6:String, param7:int, param8:int, param9:int, param10:int, param11:int, param12:Boolean)
      {
         super();
         this.var_2281 = param1;
         this.var_1399 = param2;
         this.var_2280 = param3;
         this.var_2283 = param4;
         this._category = param5;
         this.var_2092 = param6;
         this.var_1487 = param7;
         this.var_2284 = param8;
         this.var_2285 = param9;
         this.var_2282 = param10;
         this.var_2286 = param11;
         this.var_2287 = param12;
      }
      
      public function get itemID() : int
      {
         return this.var_2281;
      }
      
      public function get itemType() : String
      {
         return this.var_1399;
      }
      
      public function get roomItemID() : int
      {
         return this.var_2280;
      }
      
      public function get itemTypeID() : int
      {
         return this.var_2283;
      }
      
      public function get category() : int
      {
         return this._category;
      }
      
      public function get stuffData() : String
      {
         return this.var_2092;
      }
      
      public function get extra() : int
      {
         return this.var_1487;
      }
      
      public function get timeToExpiration() : int
      {
         return this.var_2284;
      }
      
      public function get creationDay() : int
      {
         return this.var_2285;
      }
      
      public function get creationMonth() : int
      {
         return this.var_2282;
      }
      
      public function get creationYear() : int
      {
         return this.var_2286;
      }
      
      public function get groupable() : Boolean
      {
         return this.var_2287;
      }
      
      public function get songID() : int
      {
         return this.var_1487;
      }
   }
}

package com.sulake.habbo.communication.messages.incoming.marketplace
{
   public class MarketPlaceOffer
   {
       
      
      private var _offerId:int;
      
      private var _furniId:int;
      
      private var var_2240:int;
      
      private var var_2092:String;
      
      private var var_2004:int;
      
      private var var_404:int;
      
      private var var_2239:int = -1;
      
      private var var_2216:int;
      
      private var var_2003:int;
      
      public function MarketPlaceOffer(param1:int, param2:int, param3:int, param4:String, param5:int, param6:int, param7:int, param8:int, param9:int = -1)
      {
         super();
         this._offerId = param1;
         this._furniId = param2;
         this.var_2240 = param3;
         this.var_2092 = param4;
         this.var_2004 = param5;
         this.var_404 = param6;
         this.var_2239 = param7;
         this.var_2216 = param8;
         this.var_2003 = param9;
      }
      
      public function get offerId() : int
      {
         return this._offerId;
      }
      
      public function get furniId() : int
      {
         return this._furniId;
      }
      
      public function get furniType() : int
      {
         return this.var_2240;
      }
      
      public function get stuffData() : String
      {
         return this.var_2092;
      }
      
      public function get price() : int
      {
         return this.var_2004;
      }
      
      public function get status() : int
      {
         return this.var_404;
      }
      
      public function get timeLeftMinutes() : int
      {
         return this.var_2239;
      }
      
      public function get averagePrice() : int
      {
         return this.var_2216;
      }
      
      public function get offerCount() : int
      {
         return this.var_2003;
      }
   }
}

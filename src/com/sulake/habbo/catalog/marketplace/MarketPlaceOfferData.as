package com.sulake.habbo.catalog.marketplace
{
   import flash.display.BitmapData;
   
   public class MarketPlaceOfferData implements IMarketPlaceOfferData
   {
       
      
      private var _offerId:int;
      
      private var _furniId:int;
      
      private var var_2240:int;
      
      private var var_2092:String;
      
      private var var_2004:int;
      
      private var var_2216:int;
      
      private var var_2790:int;
      
      private var var_404:int;
      
      private var var_2239:int = -1;
      
      private var var_2003:int;
      
      private var var_45:BitmapData;
      
      public function MarketPlaceOfferData(param1:int, param2:int, param3:int, param4:String, param5:int, param6:int, param7:int, param8:int = -1)
      {
         super();
         this._offerId = param1;
         this._furniId = param2;
         this.var_2240 = param3;
         this.var_2092 = param4;
         this.var_2004 = param5;
         this.var_404 = param6;
         this.var_2216 = param7;
         this.var_2003 = param8;
      }
      
      public function dispose() : void
      {
         if(this.var_45)
         {
            this.var_45.dispose();
            this.var_45 = null;
         }
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
      
      public function get averagePrice() : int
      {
         return this.var_2216;
      }
      
      public function get image() : BitmapData
      {
         return this.var_45;
      }
      
      public function set image(param1:BitmapData) : void
      {
         if(this.var_45 != null)
         {
            this.var_45.dispose();
         }
         this.var_45 = param1;
      }
      
      public function set imageCallback(param1:int) : void
      {
         this.var_2790 = param1;
      }
      
      public function get imageCallback() : int
      {
         return this.var_2790;
      }
      
      public function get status() : int
      {
         return this.var_404;
      }
      
      public function get timeLeftMinutes() : int
      {
         return this.var_2239;
      }
      
      public function set timeLeftMinutes(param1:int) : void
      {
         this.var_2239 = param1;
      }
      
      public function set price(param1:int) : void
      {
         this.var_2004 = param1;
      }
      
      public function set offerId(param1:int) : void
      {
         this._offerId = param1;
      }
      
      public function get offerCount() : int
      {
         return this.var_2003;
      }
      
      public function set offerCount(param1:int) : void
      {
         this.var_2003 = param1;
      }
   }
}

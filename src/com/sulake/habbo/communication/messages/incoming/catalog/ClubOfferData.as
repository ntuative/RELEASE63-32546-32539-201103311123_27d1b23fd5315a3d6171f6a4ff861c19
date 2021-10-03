package com.sulake.habbo.communication.messages.incoming.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class ClubOfferData
   {
       
      
      private var _offerId:int;
      
      private var var_1630:String;
      
      private var var_2004:int;
      
      private var var_2227:Boolean;
      
      private var var_2223:Boolean;
      
      private var var_2224:int;
      
      private var var_2225:int;
      
      private var var_2222:int;
      
      private var var_2221:int;
      
      private var var_2226:int;
      
      public function ClubOfferData(param1:IMessageDataWrapper)
      {
         super();
         this._offerId = param1.readInteger();
         this.var_1630 = param1.readString();
         this.var_2004 = param1.readInteger();
         this.var_2227 = param1.readBoolean();
         this.var_2223 = param1.readBoolean();
         this.var_2224 = param1.readInteger();
         this.var_2225 = param1.readInteger();
         this.var_2222 = param1.readInteger();
         this.var_2221 = param1.readInteger();
         this.var_2226 = param1.readInteger();
      }
      
      public function get offerId() : int
      {
         return this._offerId;
      }
      
      public function get productCode() : String
      {
         return this.var_1630;
      }
      
      public function get price() : int
      {
         return this.var_2004;
      }
      
      public function get upgrade() : Boolean
      {
         return this.var_2227;
      }
      
      public function get vip() : Boolean
      {
         return this.var_2223;
      }
      
      public function get periods() : int
      {
         return this.var_2224;
      }
      
      public function get daysLeftAfterPurchase() : int
      {
         return this.var_2225;
      }
      
      public function get year() : int
      {
         return this.var_2222;
      }
      
      public function get month() : int
      {
         return this.var_2221;
      }
      
      public function get day() : int
      {
         return this.var_2226;
      }
   }
}

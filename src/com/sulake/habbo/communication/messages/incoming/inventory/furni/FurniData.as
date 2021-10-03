package com.sulake.habbo.communication.messages.incoming.inventory.furni
{
   public class FurniData
   {
       
      
      private var var_2233:int;
      
      private var var_1399:String;
      
      private var _objId:int;
      
      private var var_2005:int;
      
      private var _category:int;
      
      private var var_2092:String;
      
      private var var_2350:Boolean;
      
      private var var_2348:Boolean;
      
      private var var_2351:Boolean;
      
      private var var_2352:Boolean;
      
      private var var_2349:int;
      
      private var var_1487:int;
      
      private var var_1785:String = "";
      
      private var var_2085:int = -1;
      
      public function FurniData(param1:int, param2:String, param3:int, param4:int, param5:int, param6:String, param7:Boolean, param8:Boolean, param9:Boolean, param10:Boolean, param11:int)
      {
         super();
         this.var_2233 = param1;
         this.var_1399 = param2;
         this._objId = param3;
         this.var_2005 = param4;
         this._category = param5;
         this.var_2092 = param6;
         this.var_2350 = param7;
         this.var_2348 = param8;
         this.var_2351 = param9;
         this.var_2352 = param10;
         this.var_2349 = param11;
      }
      
      public function setExtraData(param1:String, param2:int) : void
      {
         this.var_1785 = param1;
         this.var_1487 = param2;
      }
      
      public function get stripId() : int
      {
         return this.var_2233;
      }
      
      public function get itemType() : String
      {
         return this.var_1399;
      }
      
      public function get objId() : int
      {
         return this._objId;
      }
      
      public function get classId() : int
      {
         return this.var_2005;
      }
      
      public function get category() : int
      {
         return this._category;
      }
      
      public function get stuffData() : String
      {
         return this.var_2092;
      }
      
      public function get isGroupable() : Boolean
      {
         return this.var_2350;
      }
      
      public function get isRecyclable() : Boolean
      {
         return this.var_2348;
      }
      
      public function get isTradeable() : Boolean
      {
         return this.var_2351;
      }
      
      public function get isSellable() : Boolean
      {
         return this.var_2352;
      }
      
      public function get expiryTime() : int
      {
         return this.var_2349;
      }
      
      public function get slotId() : String
      {
         return this.var_1785;
      }
      
      public function get songId() : int
      {
         return this.var_2085;
      }
      
      public function get extra() : int
      {
         return this.var_1487;
      }
   }
}

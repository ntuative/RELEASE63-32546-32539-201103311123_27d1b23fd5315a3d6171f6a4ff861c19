package com.sulake.habbo.widget.events
{
   public class RoomWidgetTeaserDataUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_492:String = "RWTDUE_TEASER_DATA";
      
      public static const const_863:String = "RWTDUE_GIFT_DATA";
      
      public static const const_749:String = "RWTDUE_GIFT_RECEIVED";
       
      
      private var var_383:int;
      
      private var _data:String;
      
      private var var_404:int;
      
      private var var_191:String;
      
      private var var_2189:String;
      
      private var var_2191:Boolean;
      
      private var var_1508:int = 0;
      
      private var var_2190:String;
      
      public function RoomWidgetTeaserDataUpdateEvent(param1:String, param2:Boolean = false, param3:Boolean = false)
      {
         super(param1,param2,param3);
      }
      
      public function get objectId() : int
      {
         return this.var_383;
      }
      
      public function get data() : String
      {
         return this._data;
      }
      
      public function get status() : int
      {
         return this.var_404;
      }
      
      public function get firstClickUserName() : String
      {
         return this.var_2189;
      }
      
      public function get giftWasReceived() : Boolean
      {
         return this.var_2191;
      }
      
      public function get ownRealName() : String
      {
         return this.var_2190;
      }
      
      public function get itemCategory() : int
      {
         return this.var_1508;
      }
      
      public function set status(param1:int) : void
      {
         this.var_404 = param1;
      }
      
      public function set data(param1:String) : void
      {
         this._data = param1;
      }
      
      public function set firstClickUserName(param1:String) : void
      {
         this.var_2189 = param1;
      }
      
      public function set giftWasReceived(param1:Boolean) : void
      {
         this.var_2191 = param1;
      }
      
      public function set ownRealName(param1:String) : void
      {
         this.var_2190 = param1;
      }
      
      public function set objectId(param1:int) : void
      {
         this.var_383 = param1;
      }
      
      public function get campaignID() : String
      {
         return this.var_191;
      }
      
      public function set campaignID(param1:String) : void
      {
         this.var_191 = param1;
      }
      
      public function set itemCategory(param1:int) : void
      {
         this.var_1508 = param1;
      }
   }
}

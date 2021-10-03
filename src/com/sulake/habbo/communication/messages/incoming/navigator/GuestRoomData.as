package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class GuestRoomData implements IDisposable
   {
       
      
      private var var_351:int;
      
      private var var_836:Boolean;
      
      private var var_914:String;
      
      private var _ownerName:String;
      
      private var var_2312:int;
      
      private var var_2198:int;
      
      private var var_2540:int;
      
      private var var_1633:String;
      
      private var var_2541:int;
      
      private var var_2453:Boolean;
      
      private var var_744:int;
      
      private var var_1565:int;
      
      private var var_2538:String;
      
      private var var_852:Array;
      
      private var var_2539:RoomThumbnailData;
      
      private var var_2310:Boolean;
      
      private var _disposed:Boolean;
      
      public function GuestRoomData(param1:IMessageDataWrapper)
      {
         var _loc4_:* = null;
         this.var_852 = new Array();
         super();
         this.var_351 = param1.readInteger();
         this.var_836 = param1.readBoolean();
         this.var_914 = param1.readString();
         this._ownerName = param1.readString();
         this.var_2312 = param1.readInteger();
         this.var_2198 = param1.readInteger();
         this.var_2540 = param1.readInteger();
         this.var_1633 = param1.readString();
         this.var_2541 = param1.readInteger();
         this.var_2453 = param1.readBoolean();
         this.var_744 = param1.readInteger();
         this.var_1565 = param1.readInteger();
         this.var_2538 = param1.readString();
         var _loc2_:int = param1.readInteger();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            _loc4_ = param1.readString();
            this.var_852.push(_loc4_);
            _loc3_++;
         }
         this.var_2539 = new RoomThumbnailData(param1);
         this.var_2310 = param1.readBoolean();
      }
      
      public function dispose() : void
      {
         if(this._disposed)
         {
            return;
         }
         this._disposed = true;
         this.var_852 = null;
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function get flatId() : int
      {
         return this.var_351;
      }
      
      public function get event() : Boolean
      {
         return this.var_836;
      }
      
      public function get roomName() : String
      {
         return this.var_914;
      }
      
      public function get ownerName() : String
      {
         return this._ownerName;
      }
      
      public function get doorMode() : int
      {
         return this.var_2312;
      }
      
      public function get userCount() : int
      {
         return this.var_2198;
      }
      
      public function get maxUserCount() : int
      {
         return this.var_2540;
      }
      
      public function get description() : String
      {
         return this.var_1633;
      }
      
      public function get srchSpecPrm() : int
      {
         return this.var_2541;
      }
      
      public function get allowTrading() : Boolean
      {
         return this.var_2453;
      }
      
      public function get score() : int
      {
         return this.var_744;
      }
      
      public function get categoryId() : int
      {
         return this.var_1565;
      }
      
      public function get eventCreationTime() : String
      {
         return this.var_2538;
      }
      
      public function get tags() : Array
      {
         return this.var_852;
      }
      
      public function get thumbnail() : RoomThumbnailData
      {
         return this.var_2539;
      }
      
      public function get allowPets() : Boolean
      {
         return this.var_2310;
      }
   }
}

package com.sulake.habbo.communication.messages.incoming.room.engine
{
   public class ItemMessageData
   {
       
      
      private var _id:int = 0;
      
      private var var_2609:Boolean = false;
      
      private var var_2608:int = 0;
      
      private var var_2610:int = 0;
      
      private var var_2389:int = 0;
      
      private var var_2388:int = 0;
      
      private var var_169:Number = 0;
      
      private var var_168:Number = 0;
      
      private var var_390:String = "";
      
      private var _type:int = 0;
      
      private var var_2937:String = "";
      
      private var var_1487:int = 0;
      
      private var _state:int = 0;
      
      private var _data:String = "";
      
      private var var_179:Boolean = false;
      
      public function ItemMessageData(param1:int, param2:int, param3:Boolean)
      {
         super();
         this._id = param1;
         this._type = param2;
         this.var_2609 = param3;
      }
      
      public function setReadOnly() : void
      {
         this.var_179 = true;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get isOldFormat() : Boolean
      {
         return this.var_2609;
      }
      
      public function get wallX() : Number
      {
         return this.var_2608;
      }
      
      public function set wallX(param1:Number) : void
      {
         if(!this.var_179)
         {
            this.var_2608 = param1;
         }
      }
      
      public function get wallY() : Number
      {
         return this.var_2610;
      }
      
      public function set wallY(param1:Number) : void
      {
         if(!this.var_179)
         {
            this.var_2610 = param1;
         }
      }
      
      public function get localX() : Number
      {
         return this.var_2389;
      }
      
      public function set localX(param1:Number) : void
      {
         if(!this.var_179)
         {
            this.var_2389 = param1;
         }
      }
      
      public function get localY() : Number
      {
         return this.var_2388;
      }
      
      public function set localY(param1:Number) : void
      {
         if(!this.var_179)
         {
            this.var_2388 = param1;
         }
      }
      
      public function get y() : Number
      {
         return this.var_169;
      }
      
      public function set y(param1:Number) : void
      {
         if(!this.var_179)
         {
            this.var_169 = param1;
         }
      }
      
      public function get z() : Number
      {
         return this.var_168;
      }
      
      public function set z(param1:Number) : void
      {
         if(!this.var_179)
         {
            this.var_168 = param1;
         }
      }
      
      public function get dir() : String
      {
         return this.var_390;
      }
      
      public function set dir(param1:String) : void
      {
         if(!this.var_179)
         {
            this.var_390 = param1;
         }
      }
      
      public function get type() : int
      {
         return this._type;
      }
      
      public function set type(param1:int) : void
      {
         if(!this.var_179)
         {
            this._type = param1;
         }
      }
      
      public function get state() : int
      {
         return this._state;
      }
      
      public function set state(param1:int) : void
      {
         if(!this.var_179)
         {
            this._state = param1;
         }
      }
      
      public function get data() : String
      {
         return this._data;
      }
      
      public function set data(param1:String) : void
      {
         if(!this.var_179)
         {
            this._data = param1;
         }
      }
   }
}

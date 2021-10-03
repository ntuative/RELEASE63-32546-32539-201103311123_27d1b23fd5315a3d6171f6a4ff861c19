package com.sulake.habbo.communication.messages.outgoing.roomsettings
{
   public class SaveableRoomSettingsData
   {
       
      
      private var _roomId:int;
      
      private var _name:String;
      
      private var var_1633:String;
      
      private var var_2312:int;
      
      private var _password:String;
      
      private var var_1565:int;
      
      private var var_2314:int;
      
      private var var_852:Array;
      
      private var var_2313:Array;
      
      private var var_2310:Boolean;
      
      private var var_2315:Boolean;
      
      private var var_2309:Boolean;
      
      private var var_2311:Boolean;
      
      public function SaveableRoomSettingsData()
      {
         super();
      }
      
      public function get allowPets() : Boolean
      {
         return this.var_2310;
      }
      
      public function set allowPets(param1:Boolean) : void
      {
         this.var_2310 = param1;
      }
      
      public function get allowFoodConsume() : Boolean
      {
         return this.var_2315;
      }
      
      public function set allowFoodConsume(param1:Boolean) : void
      {
         this.var_2315 = param1;
      }
      
      public function get allowWalkThrough() : Boolean
      {
         return this.var_2309;
      }
      
      public function set allowWalkThrough(param1:Boolean) : void
      {
         this.var_2309 = param1;
      }
      
      public function get hideWalls() : Boolean
      {
         return this.var_2311;
      }
      
      public function set hideWalls(param1:Boolean) : void
      {
         this.var_2311 = param1;
      }
      
      public function get roomId() : int
      {
         return this._roomId;
      }
      
      public function set roomId(param1:int) : void
      {
         this._roomId = param1;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function set name(param1:String) : void
      {
         this._name = param1;
      }
      
      public function get description() : String
      {
         return this.var_1633;
      }
      
      public function set description(param1:String) : void
      {
         this.var_1633 = param1;
      }
      
      public function get doorMode() : int
      {
         return this.var_2312;
      }
      
      public function set doorMode(param1:int) : void
      {
         this.var_2312 = param1;
      }
      
      public function get password() : String
      {
         return this._password;
      }
      
      public function set password(param1:String) : void
      {
         this._password = param1;
      }
      
      public function get categoryId() : int
      {
         return this.var_1565;
      }
      
      public function set categoryId(param1:int) : void
      {
         this.var_1565 = param1;
      }
      
      public function get maximumVisitors() : int
      {
         return this.var_2314;
      }
      
      public function set maximumVisitors(param1:int) : void
      {
         this.var_2314 = param1;
      }
      
      public function get tags() : Array
      {
         return this.var_852;
      }
      
      public function set tags(param1:Array) : void
      {
         this.var_852 = param1;
      }
      
      public function get controllers() : Array
      {
         return this.var_2313;
      }
      
      public function set controllers(param1:Array) : void
      {
         this.var_2313 = param1;
      }
   }
}

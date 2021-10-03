package com.sulake.habbo.session
{
   public class PetInfo implements IPetInfo
   {
       
      
      private var var_1811:int;
      
      private var var_1443:int;
      
      private var var_2522:int;
      
      private var var_2525:int;
      
      private var var_2526:int;
      
      private var _energy:int;
      
      private var var_2524:int;
      
      private var _nutrition:int;
      
      private var var_2523:int;
      
      private var var_2481:int;
      
      private var _ownerName:String;
      
      private var var_2168:int;
      
      private var var_548:int;
      
      public function PetInfo()
      {
         super();
      }
      
      public function get petId() : int
      {
         return this.var_1811;
      }
      
      public function get level() : int
      {
         return this.var_1443;
      }
      
      public function get levelMax() : int
      {
         return this.var_2522;
      }
      
      public function get experience() : int
      {
         return this.var_2525;
      }
      
      public function get experienceMax() : int
      {
         return this.var_2526;
      }
      
      public function get energy() : int
      {
         return this._energy;
      }
      
      public function get energyMax() : int
      {
         return this.var_2524;
      }
      
      public function get nutrition() : int
      {
         return this._nutrition;
      }
      
      public function get nutritionMax() : int
      {
         return this.var_2523;
      }
      
      public function get ownerId() : int
      {
         return this.var_2481;
      }
      
      public function get ownerName() : String
      {
         return this._ownerName;
      }
      
      public function get respect() : int
      {
         return this.var_2168;
      }
      
      public function get age() : int
      {
         return this.var_548;
      }
      
      public function set petId(param1:int) : void
      {
         this.var_1811 = param1;
      }
      
      public function set level(param1:int) : void
      {
         this.var_1443 = param1;
      }
      
      public function set levelMax(param1:int) : void
      {
         this.var_2522 = param1;
      }
      
      public function set experience(param1:int) : void
      {
         this.var_2525 = param1;
      }
      
      public function set experienceMax(param1:int) : void
      {
         this.var_2526 = param1;
      }
      
      public function set energy(param1:int) : void
      {
         this._energy = param1;
      }
      
      public function set energyMax(param1:int) : void
      {
         this.var_2524 = param1;
      }
      
      public function set nutrition(param1:int) : void
      {
         this._nutrition = param1;
      }
      
      public function set nutritionMax(param1:int) : void
      {
         this.var_2523 = param1;
      }
      
      public function set ownerId(param1:int) : void
      {
         this.var_2481 = param1;
      }
      
      public function set ownerName(param1:String) : void
      {
         this._ownerName = param1;
      }
      
      public function set respect(param1:int) : void
      {
         this.var_2168 = param1;
      }
      
      public function set age(param1:int) : void
      {
         this.var_548 = param1;
      }
   }
}

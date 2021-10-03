package com.sulake.habbo.communication.messages.parser.room.pets
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class PetInfoMessageParser implements IMessageParser
   {
       
      
      private var var_1811:int;
      
      private var _name:String;
      
      private var var_1443:int;
      
      private var var_2533:int;
      
      private var var_2525:int;
      
      private var _energy:int;
      
      private var _nutrition:int;
      
      private var var_617:String;
      
      private var var_2531:int;
      
      private var var_2532:int;
      
      private var var_2534:int;
      
      private var var_2168:int;
      
      private var var_2481:int;
      
      private var _ownerName:String;
      
      private var var_548:int;
      
      public function PetInfoMessageParser()
      {
         super();
      }
      
      public function get petId() : int
      {
         return this.var_1811;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get level() : int
      {
         return this.var_1443;
      }
      
      public function get maxLevel() : int
      {
         return this.var_2533;
      }
      
      public function get experience() : int
      {
         return this.var_2525;
      }
      
      public function get energy() : int
      {
         return this._energy;
      }
      
      public function get nutrition() : int
      {
         return this._nutrition;
      }
      
      public function get figure() : String
      {
         return this.var_617;
      }
      
      public function get experienceRequiredToLevel() : int
      {
         return this.var_2531;
      }
      
      public function get maxEnergy() : int
      {
         return this.var_2532;
      }
      
      public function get maxNutrition() : int
      {
         return this.var_2534;
      }
      
      public function get respect() : int
      {
         return this.var_2168;
      }
      
      public function get ownerId() : int
      {
         return this.var_2481;
      }
      
      public function get ownerName() : String
      {
         return this._ownerName;
      }
      
      public function get age() : int
      {
         return this.var_548;
      }
      
      public function flush() : Boolean
      {
         this.var_1811 = -1;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         if(param1 == null)
         {
            return false;
         }
         this.var_1811 = param1.readInteger();
         this._name = param1.readString();
         this.var_1443 = param1.readInteger();
         this.var_2533 = param1.readInteger();
         this.var_2525 = param1.readInteger();
         this.var_2531 = param1.readInteger();
         this._energy = param1.readInteger();
         this.var_2532 = param1.readInteger();
         this._nutrition = param1.readInteger();
         this.var_2534 = param1.readInteger();
         this.var_617 = param1.readString();
         this.var_2168 = param1.readInteger();
         this.var_2481 = param1.readInteger();
         this.var_548 = param1.readInteger();
         this._ownerName = param1.readString();
         return true;
      }
   }
}

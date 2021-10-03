package com.sulake.habbo.avatar.structure.parts
{
   public class PartDefinition
   {
       
      
      private var var_2262:String;
      
      private var var_1644:String;
      
      private var var_2263:String;
      
      private var var_1643:Boolean;
      
      private var var_1645:int = -1;
      
      public function PartDefinition(param1:XML)
      {
         super();
         this.var_2262 = String(param1["set-type"]);
         this.var_1644 = String(param1["flipped-set-type"]);
         this.var_2263 = String(param1["remove-set-type"]);
         this.var_1643 = false;
      }
      
      public function hasStaticId() : Boolean
      {
         return this.var_1645 >= 0;
      }
      
      public function get staticId() : int
      {
         return this.var_1645;
      }
      
      public function set staticId(param1:int) : void
      {
         this.var_1645 = param1;
      }
      
      public function get setType() : String
      {
         return this.var_2262;
      }
      
      public function get flippedSetType() : String
      {
         return this.var_1644;
      }
      
      public function get removeSetType() : String
      {
         return this.var_2263;
      }
      
      public function get appendToFigure() : Boolean
      {
         return this.var_1643;
      }
      
      public function set appendToFigure(param1:Boolean) : void
      {
         this.var_1643 = param1;
      }
      
      public function set flippedSetType(param1:String) : void
      {
         this.var_1644 = param1;
      }
   }
}

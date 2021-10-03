package com.sulake.habbo.avatar.structure.figure
{
   import flash.geom.ColorTransform;
   
   public class PartColor implements IPartColor
   {
       
      
      private var _id:int;
      
      private var _index:int;
      
      private var var_2245:int;
      
      private var var_2170:Boolean = false;
      
      private var _rgb:uint;
      
      private var var_1822:uint;
      
      private var var_1821:uint;
      
      private var _b:uint;
      
      private var var_1820:Number;
      
      private var var_1819:Number;
      
      private var var_1823:Number;
      
      private var var_1020:ColorTransform;
      
      public function PartColor(param1:XML)
      {
         super();
         this._id = parseInt(param1.@id);
         this._index = parseInt(param1.@index);
         this.var_2245 = parseInt(param1.@club);
         this.var_2170 = Boolean(parseInt(param1.@selectable));
         var _loc2_:String = param1.text();
         this._rgb = parseInt(_loc2_,16);
         this.var_1822 = this._rgb >> 16 & 255;
         this.var_1821 = this._rgb >> 8 & 255;
         this._b = this._rgb >> 0 & 255;
         this.var_1820 = this.var_1822 / 255 * 1;
         this.var_1819 = this.var_1821 / 255 * 1;
         this.var_1823 = this._b / 255 * 1;
         this.var_1020 = new ColorTransform(this.var_1820,this.var_1819,this.var_1823);
      }
      
      public function get colorTransform() : ColorTransform
      {
         return this.var_1020;
      }
      
      public function get redMultiplier() : Number
      {
         return this.var_1820;
      }
      
      public function get greenMultiplier() : Number
      {
         return this.var_1819;
      }
      
      public function get blueMultiplier() : Number
      {
         return this.var_1823;
      }
      
      public function get rgb() : uint
      {
         return this._rgb;
      }
      
      public function get r() : uint
      {
         return this.var_1822;
      }
      
      public function get g() : uint
      {
         return this.var_1821;
      }
      
      public function get b() : uint
      {
         return this._b;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get index() : int
      {
         return this._index;
      }
      
      public function get clubLevel() : int
      {
         return this.var_2245;
      }
      
      public function get isSelectable() : Boolean
      {
         return this.var_2170;
      }
   }
}

package com.sulake.habbo.room.object.visualization.data
{
   public class LayerData
   {
      
      public static const const_746:String = "";
      
      public static const const_364:int = 0;
      
      public static const const_461:int = 255;
      
      public static const const_837:Boolean = false;
      
      public static const const_549:int = 0;
      
      public static const const_441:int = 0;
      
      public static const const_418:int = 0;
      
      public static const const_1041:int = 1;
      
      public static const const_1047:int = 2;
      
      public static const INK_DARKEN:int = 3;
       
      
      private var var_2163:String = "";
      
      private var var_1976:int = 0;
      
      private var var_2200:int = 255;
      
      private var var_2544:Boolean = false;
      
      private var var_2546:int = 0;
      
      private var var_2545:int = 0;
      
      private var var_2547:Number = 0;
      
      public function LayerData()
      {
         super();
      }
      
      public function set tag(param1:String) : void
      {
         this.var_2163 = param1;
      }
      
      public function get tag() : String
      {
         return this.var_2163;
      }
      
      public function set ink(param1:int) : void
      {
         this.var_1976 = param1;
      }
      
      public function get ink() : int
      {
         return this.var_1976;
      }
      
      public function set alpha(param1:int) : void
      {
         this.var_2200 = param1;
      }
      
      public function get alpha() : int
      {
         return this.var_2200;
      }
      
      public function set ignoreMouse(param1:Boolean) : void
      {
         this.var_2544 = param1;
      }
      
      public function get ignoreMouse() : Boolean
      {
         return this.var_2544;
      }
      
      public function set xOffset(param1:int) : void
      {
         this.var_2546 = param1;
      }
      
      public function get xOffset() : int
      {
         return this.var_2546;
      }
      
      public function set yOffset(param1:int) : void
      {
         this.var_2545 = param1;
      }
      
      public function get yOffset() : int
      {
         return this.var_2545;
      }
      
      public function set zOffset(param1:Number) : void
      {
         this.var_2547 = param1;
      }
      
      public function get zOffset() : Number
      {
         return this.var_2547;
      }
      
      public function copyValues(param1:LayerData) : void
      {
         if(param1 != null)
         {
            this.tag = param1.tag;
            this.ink = param1.ink;
            this.alpha = param1.alpha;
            this.ignoreMouse = param1.ignoreMouse;
            this.xOffset = param1.xOffset;
            this.yOffset = param1.yOffset;
            this.zOffset = param1.zOffset;
         }
      }
   }
}

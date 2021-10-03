package com.sulake.habbo.catalog.viewer.widgets.events
{
   import flash.events.Event;
   
   public class CatalogWidgetColoursEvent extends Event
   {
       
      
      private var var_953:Array;
      
      private var var_2693:String;
      
      private var var_2694:String;
      
      private var var_2695:String;
      
      public function CatalogWidgetColoursEvent(param1:Array, param2:String, param3:String, param4:String, param5:Boolean = false, param6:Boolean = false)
      {
         super(WidgetEvent.CWE_COLOUR_ARRAY,param5,param6);
         this.var_953 = param1;
         this.var_2693 = param2;
         this.var_2694 = param3;
         this.var_2695 = param4;
      }
      
      public function get colours() : Array
      {
         return this.var_953;
      }
      
      public function get backgroundAssetName() : String
      {
         return this.var_2693;
      }
      
      public function get colourAssetName() : String
      {
         return this.var_2694;
      }
      
      public function get chosenColourAssetName() : String
      {
         return this.var_2695;
      }
   }
}

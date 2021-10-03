package com.sulake.habbo.widget.messages
{
   public class RoomWidgetSelectOutfitMessage extends RoomWidgetMessage
   {
      
      public static const const_1248:String = "select_outfit";
       
      
      private var var_2321:int;
      
      public function RoomWidgetSelectOutfitMessage(param1:int)
      {
         super(const_1248);
         this.var_2321 = param1;
      }
      
      public function get outfitId() : int
      {
         return this.var_2321;
      }
   }
}

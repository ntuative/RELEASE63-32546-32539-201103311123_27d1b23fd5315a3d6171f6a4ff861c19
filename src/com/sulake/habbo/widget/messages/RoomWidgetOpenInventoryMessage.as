package com.sulake.habbo.widget.messages
{
   public class RoomWidgetOpenInventoryMessage extends RoomWidgetMessage
   {
      
      public static const const_849:String = "RWGOI_MESSAGE_OPEN_INVENTORY";
      
      public static const const_1079:String = "inventory_effects";
      
      public static const const_1038:String = "inventory_badges";
      
      public static const const_1585:String = "inventory_clothes";
      
      public static const const_1535:String = "inventory_furniture";
       
      
      private var var_2805:String;
      
      public function RoomWidgetOpenInventoryMessage(param1:String)
      {
         super(const_849);
         this.var_2805 = param1;
      }
      
      public function get inventoryType() : String
      {
         return this.var_2805;
      }
   }
}

package com.sulake.habbo.widget.messages
{
   public class RoomWidgetOpenCatalogMessage extends RoomWidgetMessage
   {
      
      public static const const_415:String = "RWGOI_MESSAGE_OPEN_CATALOG";
      
      public static const const_1181:String = "RWOCM_CLUB_MAIN";
      
      public static const const_1118:String = "RWOCM_PIXELS";
      
      public static const const_1123:String = "RWOCM_CREDITS";
       
      
      private var var_2783:String = "";
      
      public function RoomWidgetOpenCatalogMessage(param1:String)
      {
         super(const_415);
         this.var_2783 = param1;
      }
      
      public function get pageKey() : String
      {
         return this.var_2783;
      }
   }
}

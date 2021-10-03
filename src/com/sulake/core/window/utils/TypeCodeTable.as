package com.sulake.core.window.utils
{
   import com.sulake.core.window.enum.WindowType;
   import flash.utils.Dictionary;
   
   public class TypeCodeTable extends WindowType
   {
       
      
      public function TypeCodeTable()
      {
         super();
      }
      
      public static function fillTables(param1:Dictionary, param2:Dictionary = null) : void
      {
         var _loc3_:* = null;
         param1["background"] = const_691;
         param1["bitmap"] = const_804;
         param1["border"] = const_876;
         param1["border_notify"] = const_1646;
         param1["button"] = const_476;
         param1["button_thick"] = const_941;
         param1["button_icon"] = const_1603;
         param1["button_group_left"] = const_747;
         param1["button_group_center"] = const_808;
         param1["button_group_right"] = const_901;
         param1["canvas"] = const_823;
         param1["checkbox"] = const_859;
         param1["closebutton"] = const_1226;
         param1["container"] = const_387;
         param1["container_button"] = const_656;
         param1["display_object_wrapper"] = const_689;
         param1["dropmenu"] = const_498;
         param1["dropmenu_item"] = const_526;
         param1["frame"] = const_386;
         param1["frame_notify"] = const_1568;
         param1["header"] = const_742;
         param1["html"] = const_1231;
         param1["icon"] = const_1155;
         param1["itemgrid"] = const_1259;
         param1["itemgrid_horizontal"] = const_480;
         param1["itemgrid_vertical"] = const_682;
         param1["itemlist"] = const_1089;
         param1["itemlist_horizontal"] = const_400;
         param1["itemlist_vertical"] = const_367;
         param1["label"] = WINDOW_TYPE_LABEL;
         param1["maximizebox"] = const_1491;
         param1["menu"] = const_1660;
         param1["menu_item"] = const_1611;
         param1["submenu"] = const_1243;
         param1["minimizebox"] = const_1543;
         param1["notify"] = const_1457;
         param1["null"] = const_935;
         param1["password"] = const_760;
         param1["radiobutton"] = const_686;
         param1["region"] = const_567;
         param1["restorebox"] = const_1675;
         param1["scaler"] = const_860;
         param1["scaler_horizontal"] = const_1548;
         param1["scaler_vertical"] = const_1738;
         param1["scrollbar_horizontal"] = const_548;
         param1["scrollbar_vertical"] = const_711;
         param1["scrollbar_slider_button_up"] = const_1090;
         param1["scrollbar_slider_button_down"] = const_1161;
         param1["scrollbar_slider_button_left"] = const_1217;
         param1["scrollbar_slider_button_right"] = const_1070;
         param1["scrollbar_slider_bar_horizontal"] = const_1168;
         param1["scrollbar_slider_bar_vertical"] = const_1124;
         param1["scrollbar_slider_track_horizontal"] = const_1130;
         param1["scrollbar_slider_track_vertical"] = const_1035;
         param1["scrollable_itemlist"] = const_1678;
         param1["scrollable_itemlist_vertical"] = const_588;
         param1["scrollable_itemlist_horizontal"] = const_1199;
         param1["selector"] = const_666;
         param1["selector_list"] = const_884;
         param1["submenu"] = const_1243;
         param1["tab_button"] = const_564;
         param1["tab_container_button"] = const_1166;
         param1["tab_context"] = const_556;
         param1["tab_content"] = const_1229;
         param1["tab_selector"] = const_662;
         param1["text"] = const_497;
         param1["input"] = const_924;
         param1["toolbar"] = const_1674;
         param1["tooltip"] = const_412;
         if(param2 != null)
         {
            for(param2[param1[_loc3_]] in param1)
            {
            }
         }
      }
   }
}

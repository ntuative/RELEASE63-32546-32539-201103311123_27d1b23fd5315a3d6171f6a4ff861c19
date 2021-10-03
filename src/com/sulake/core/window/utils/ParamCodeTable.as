package com.sulake.core.window.utils
{
   import com.sulake.core.window.enum.WindowParam;
   import flash.utils.Dictionary;
   
   public class ParamCodeTable extends WindowParam
   {
       
      
      public function ParamCodeTable()
      {
         super();
      }
      
      public static function fillTables(param1:Dictionary, param2:Dictionary = null) : void
      {
         var _loc3_:* = null;
         param1["null"] = const_201;
         param1["bound_to_parent_rect"] = const_98;
         param1["child_window"] = const_1245;
         param1["embedded_controller"] = const_1049;
         param1["resize_to_accommodate_children"] = const_64;
         param1["input_event_processor"] = const_30;
         param1["internal_event_handling"] = const_922;
         param1["mouse_dragging_target"] = const_238;
         param1["mouse_dragging_trigger"] = const_373;
         param1["mouse_scaling_target"] = const_312;
         param1["mouse_scaling_trigger"] = const_468;
         param1["horizontal_mouse_scaling_trigger"] = const_258;
         param1["vertical_mouse_scaling_trigger"] = const_270;
         param1["observe_parent_input_events"] = const_1215;
         param1["optimize_region_to_layout_size"] = const_591;
         param1["parent_window"] = const_1206;
         param1["relative_horizontal_scale_center"] = const_194;
         param1["relative_horizontal_scale_fixed"] = const_138;
         param1["relative_horizontal_scale_move"] = const_356;
         param1["relative_horizontal_scale_strech"] = const_401;
         param1["relative_scale_center"] = const_1086;
         param1["relative_scale_fixed"] = const_809;
         param1["relative_scale_move"] = const_1151;
         param1["relative_scale_strech"] = const_1105;
         param1["relative_vertical_scale_center"] = const_206;
         param1["relative_vertical_scale_fixed"] = const_150;
         param1["relative_vertical_scale_move"] = const_249;
         param1["relative_vertical_scale_strech"] = const_296;
         param1["on_resize_align_left"] = const_910;
         param1["on_resize_align_right"] = const_529;
         param1["on_resize_align_center"] = const_603;
         param1["on_resize_align_top"] = const_646;
         param1["on_resize_align_bottom"] = const_598;
         param1["on_resize_align_middle"] = const_578;
         param1["on_accommodate_align_left"] = const_1207;
         param1["on_accommodate_align_right"] = const_448;
         param1["on_accommodate_align_center"] = const_699;
         param1["on_accommodate_align_top"] = const_1257;
         param1["on_accommodate_align_bottom"] = const_570;
         param1["on_accommodate_align_middle"] = const_814;
         param1["route_input_events_to_parent"] = const_449;
         param1["use_parent_graphic_context"] = const_33;
         param1["draggable_with_mouse"] = const_1053;
         param1["scalable_with_mouse"] = const_1182;
         param1["reflect_horizontal_resize_to_parent"] = const_527;
         param1["reflect_vertical_resize_to_parent"] = const_469;
         param1["reflect_resize_to_parent"] = const_293;
         param1["force_clipping"] = WINDOW_PARAM_FORCE_CLIPPING;
         param1["inherit_caption"] = const_1125;
         if(param2 != null)
         {
            for(param2[param1[_loc3_]] in param1)
            {
            }
         }
      }
   }
}

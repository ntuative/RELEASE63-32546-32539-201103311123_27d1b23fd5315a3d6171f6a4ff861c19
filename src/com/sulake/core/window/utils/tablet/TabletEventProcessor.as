package com.sulake.core.window.utils.tablet
{
   import com.sulake.core.window.WindowController;
   import com.sulake.core.window.utils.EventProcessorState;
   import com.sulake.core.window.utils.IEventQueue;
   import com.sulake.core.window.utils.MouseEventProcessor;
   
   public class TabletEventProcessor extends MouseEventProcessor
   {
       
      
      private var var_2946:String = "";
      
      public function TabletEventProcessor()
      {
         super();
      }
      
      override public function process(param1:EventProcessorState, param2:IEventQueue) : void
      {
         if(param2.length == 0)
         {
            return;
         }
         var_150 = param1.desktop;
         var_74 = param1.var_1302 as WindowController;
         var_178 = param1.var_1300 as WindowController;
         var_159 = param1.renderer;
         var_861 = param1.var_1301;
         param2.begin();
         param2.end();
         param1.desktop = var_150;
         param1.var_1302 = var_74;
         param1.var_1300 = var_178;
         param1.renderer = var_159;
         param1.var_1301 = var_861;
      }
   }
}

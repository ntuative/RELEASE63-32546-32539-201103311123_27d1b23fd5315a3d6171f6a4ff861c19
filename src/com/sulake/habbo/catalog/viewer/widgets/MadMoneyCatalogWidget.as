package com.sulake.habbo.catalog.viewer.widgets
{
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IButtonWindow;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.window.utils.IAlertDialog;
   import flash.events.Event;
   
   public class MadMoneyCatalogWidget extends CatalogWidget implements ICatalogWidget
   {
       
      
      private var var_1124:IButtonWindow;
      
      public function MadMoneyCatalogWidget(param1:IWindowContainer)
      {
         super(param1);
      }
      
      override public function dispose() : void
      {
         super.dispose();
         if(this.var_1124 != null)
         {
            this.var_1124.removeEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,this.eventProc);
            this.var_1124 = null;
         }
      }
      
      override public function init() : Boolean
      {
         if(!super.init())
         {
            return false;
         }
         this.var_1124 = _window.findChildByName("ctlg_madmoney_button") as IButtonWindow;
         if(this.var_1124 != null)
         {
         }
         return true;
      }
      
      private function eventProc(param1:WindowMouseEvent) : void
      {
         var event:WindowMouseEvent = param1;
         page.viewer.catalog.windowManager.alert("TODO","Fix in MadMoneyCatalogWidget.as",0,function(param1:IAlertDialog, param2:Event):void
         {
            param1.dispose();
         });
      }
   }
}

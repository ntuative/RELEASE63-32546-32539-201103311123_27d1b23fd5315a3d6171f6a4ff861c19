package com.sulake.habbo.notifications
{
   public class HabboNotificationItem
   {
       
      
      private var var_83:HabboNotificationItemStyle;
      
      private var var_195:String;
      
      private var var_22:HabboNotifications;
      
      public function HabboNotificationItem(param1:String, param2:HabboNotificationItemStyle, param3:HabboNotifications)
      {
         super();
         this.var_195 = param1;
         this.var_83 = param2;
         this.var_22 = param3;
      }
      
      public function get style() : HabboNotificationItemStyle
      {
         return this.var_83;
      }
      
      public function get content() : String
      {
         return this.var_195;
      }
      
      public function dispose() : void
      {
         this.var_195 = null;
         if(this.var_83 != null)
         {
            this.var_83.dispose();
            this.var_83 = null;
         }
         this.var_22 = null;
      }
      
      public function ExecuteUiLinks() : void
      {
         var _loc2_:* = null;
         var _loc1_:Array = this.var_83.method_7;
         for each(_loc2_ in _loc1_)
         {
            if(this.var_22 != null)
            {
               this.var_22.onExecuteLink(_loc2_);
            }
         }
      }
   }
}

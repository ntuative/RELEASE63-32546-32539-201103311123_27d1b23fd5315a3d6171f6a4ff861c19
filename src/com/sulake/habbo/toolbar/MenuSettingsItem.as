package com.sulake.habbo.toolbar
{
   public class MenuSettingsItem
   {
       
      
      private var var_2219:String;
      
      private var var_2558:Array;
      
      private var var_2559:Boolean;
      
      public function MenuSettingsItem(param1:String, param2:Array = null, param3:Boolean = false)
      {
         super();
         this.var_2219 = param1;
         this.var_2558 = param2;
         this.var_2559 = param3;
      }
      
      public function get menuId() : String
      {
         return this.var_2219;
      }
      
      public function get yieldList() : Array
      {
         return this.var_2558;
      }
      
      public function get lockToIcon() : Boolean
      {
         return this.var_2559;
      }
   }
}

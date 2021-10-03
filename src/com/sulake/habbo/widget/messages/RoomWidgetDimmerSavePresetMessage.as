package com.sulake.habbo.widget.messages
{
   public class RoomWidgetDimmerSavePresetMessage extends RoomWidgetMessage
   {
      
      public static const const_777:String = "RWSDPM_SAVE_PRESET";
       
      
      private var var_2712:int;
      
      private var var_2714:int;
      
      private var _color:uint;
      
      private var var_1242:int;
      
      private var var_2713:Boolean;
      
      public function RoomWidgetDimmerSavePresetMessage(param1:int, param2:int, param3:uint, param4:int, param5:Boolean)
      {
         super(const_777);
         this.var_2712 = param1;
         this.var_2714 = param2;
         this._color = param3;
         this.var_1242 = param4;
         this.var_2713 = param5;
      }
      
      public function get presetNumber() : int
      {
         return this.var_2712;
      }
      
      public function get effectTypeId() : int
      {
         return this.var_2714;
      }
      
      public function get color() : uint
      {
         return this._color;
      }
      
      public function get brightness() : int
      {
         return this.var_1242;
      }
      
      public function get apply() : Boolean
      {
         return this.var_2713;
      }
   }
}

package com.sulake.habbo.communication.messages.outgoing.room.furniture
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class RoomDimmerSavePresetMessageComposer implements IMessageComposer
   {
       
      
      private var _roomId:int = 0;
      
      private var _roomCategory:int = 0;
      
      private var var_2712:int;
      
      private var var_2714:int;
      
      private var var_2788:String;
      
      private var var_2787:int;
      
      private var var_2789:Boolean;
      
      public function RoomDimmerSavePresetMessageComposer(param1:int, param2:int, param3:String, param4:int, param5:Boolean, param6:int = 0, param7:int = 0)
      {
         super();
         this._roomId = param6;
         this._roomCategory = param7;
         this.var_2712 = param1;
         this.var_2714 = param2;
         this.var_2788 = param3;
         this.var_2787 = param4;
         this.var_2789 = param5;
      }
      
      public function getMessageArray() : Array
      {
         return [this.var_2712,this.var_2714,this.var_2788,this.var_2787,int(this.var_2789)];
      }
      
      public function dispose() : void
      {
      }
   }
}

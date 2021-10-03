package com.sulake.habbo.room.messages
{
   public class RoomObjectAvatarFigureUpdateMessage extends RoomObjectUpdateStateMessage
   {
       
      
      private var var_617:String;
      
      private var var_2257:String;
      
      private var var_948:String;
      
      public function RoomObjectAvatarFigureUpdateMessage(param1:String, param2:String = null, param3:String = null)
      {
         super();
         this.var_617 = param1;
         this.var_948 = param2;
         this.var_2257 = param3;
      }
      
      public function get figure() : String
      {
         return this.var_617;
      }
      
      public function get race() : String
      {
         return this.var_2257;
      }
      
      public function get gender() : String
      {
         return this.var_948;
      }
   }
}

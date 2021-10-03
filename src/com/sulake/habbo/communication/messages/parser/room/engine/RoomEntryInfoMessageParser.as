package com.sulake.habbo.communication.messages.parser.room.engine
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import com.sulake.habbo.communication.messages.incoming.navigator.PublicRoomShortData;
   
   public class RoomEntryInfoMessageParser implements IMessageParser
   {
       
      
      private var var_2039:Boolean;
      
      private var var_2839:int;
      
      private var var_430:Boolean;
      
      private var var_1293:PublicRoomShortData;
      
      public function RoomEntryInfoMessageParser()
      {
         super();
      }
      
      public function get guestRoom() : Boolean
      {
         return this.var_2039;
      }
      
      public function get guestRoomId() : int
      {
         return this.var_2839;
      }
      
      public function get publicSpace() : PublicRoomShortData
      {
         return this.var_1293;
      }
      
      public function get owner() : Boolean
      {
         return this.var_430;
      }
      
      public function flush() : Boolean
      {
         if(this.var_1293 != null)
         {
            this.var_1293.dispose();
            this.var_1293 = null;
         }
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_2039 = param1.readBoolean();
         if(this.var_2039)
         {
            this.var_2839 = param1.readInteger();
            this.var_430 = param1.readBoolean();
         }
         else
         {
            this.var_1293 = new PublicRoomShortData(param1);
         }
         return true;
      }
   }
}

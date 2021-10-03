package com.sulake.habbo.session.events
{
   import com.sulake.habbo.session.IRoomSession;
   import flash.events.Event;
   
   public class RoomSessionEvent extends Event
   {
      
      public static const const_231:String = "RSE_CREATED";
      
      public static const const_85:String = "RSE_STARTED";
      
      public static const const_92:String = "RSE_ENDED";
       
      
      private var var_31:IRoomSession;
      
      public function RoomSessionEvent(param1:String, param2:IRoomSession, param3:Boolean = false, param4:Boolean = false)
      {
         super(param1,param3,param4);
         this.var_31 = param2;
      }
      
      public function get session() : IRoomSession
      {
         return this.var_31;
      }
   }
}

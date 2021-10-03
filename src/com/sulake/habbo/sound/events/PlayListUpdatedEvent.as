package com.sulake.habbo.sound.events
{
   import flash.events.Event;
   
   public class PlayListUpdatedEvent extends Event
   {
      
      public static const const_515:String = "PLUE_PLAY_LIST_UPDATED";
       
      
      public function PlayListUpdatedEvent(param1:String, param2:Boolean = false, param3:Boolean = false)
      {
         super(param1,param2,param3);
      }
   }
}

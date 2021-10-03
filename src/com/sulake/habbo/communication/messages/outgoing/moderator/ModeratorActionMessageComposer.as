package com.sulake.habbo.communication.messages.outgoing.moderator
{
   import com.sulake.core.communication.messages.IMessageComposer;
   import com.sulake.core.runtime.IDisposable;
   
   public class ModeratorActionMessageComposer implements IMessageComposer, IDisposable
   {
      
      public static const const_1866:int = 0;
      
      public static const const_1511:int = 1;
      
      public static const const_1590:int = 0;
      
      public static const const_1522:int = 1;
      
      public static const const_1975:int = 2;
      
      public static const const_1706:int = 3;
      
      public static const const_1588:int = 4;
       
      
      private var var_32:Array;
      
      public function ModeratorActionMessageComposer(param1:int, param2:int, param3:String, param4:String, param5:String, param6:int = 0)
      {
         this.var_32 = new Array();
         super();
         this.var_32.push(param1);
         this.var_32.push(param2);
         this.var_32.push(param3);
         this.var_32.push(param4);
         this.var_32.push(param5);
         this.var_32.push(param6);
         this.var_32.push(false);
         this.var_32.push(false);
      }
      
      public function getMessageArray() : Array
      {
         return this.var_32;
      }
      
      public function dispose() : void
      {
         this.var_32 = null;
      }
      
      public function get disposed() : Boolean
      {
         return false;
      }
   }
}

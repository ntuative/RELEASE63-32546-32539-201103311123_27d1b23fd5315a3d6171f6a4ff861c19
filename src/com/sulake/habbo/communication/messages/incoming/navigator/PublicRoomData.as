package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class PublicRoomData implements IDisposable
   {
       
      
      private var var_2565:String;
      
      private var var_2601:int;
      
      private var var_2370:int;
      
      private var var_2600:String;
      
      private var var_2686:int;
      
      private var var_1862:int;
      
      private var _disposed:Boolean;
      
      public function PublicRoomData(param1:IMessageDataWrapper)
      {
         super();
         this.var_2565 = param1.readString();
         this.var_2601 = param1.readInteger();
         this.var_2370 = param1.readInteger();
         this.var_2600 = param1.readString();
         this.var_2686 = param1.readInteger();
         this.var_1862 = param1.readInteger();
      }
      
      public function dispose() : void
      {
         if(this._disposed)
         {
            return;
         }
         this._disposed = true;
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function get unitPropertySet() : String
      {
         return this.var_2565;
      }
      
      public function get unitPort() : int
      {
         return this.var_2601;
      }
      
      public function get worldId() : int
      {
         return this.var_2370;
      }
      
      public function get castLibs() : String
      {
         return this.var_2600;
      }
      
      public function get maxUsers() : int
      {
         return this.var_2686;
      }
      
      public function get nodeId() : int
      {
         return this.var_1862;
      }
   }
}

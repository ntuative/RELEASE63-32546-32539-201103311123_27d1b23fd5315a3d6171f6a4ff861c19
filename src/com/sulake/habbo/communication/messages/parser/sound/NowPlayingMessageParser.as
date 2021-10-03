package com.sulake.habbo.communication.messages.parser.sound
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class NowPlayingMessageParser implements IMessageParser
   {
       
      
      private var var_1844:int;
      
      private var _currentPosition:int;
      
      private var var_1842:int;
      
      private var var_1845:int;
      
      private var var_1843:int;
      
      public function NowPlayingMessageParser()
      {
         super();
      }
      
      public function get currentSongId() : int
      {
         return this.var_1844;
      }
      
      public function get currentPosition() : int
      {
         return this._currentPosition;
      }
      
      public function get nextSongId() : int
      {
         return this.var_1842;
      }
      
      public function get nextPosition() : int
      {
         return this.var_1845;
      }
      
      public function get syncCount() : int
      {
         return this.var_1843;
      }
      
      public function flush() : Boolean
      {
         this.var_1844 = -1;
         this._currentPosition = -1;
         this.var_1842 = -1;
         this.var_1845 = -1;
         this.var_1843 = -1;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1844 = param1.readInteger();
         this._currentPosition = param1.readInteger();
         this.var_1842 = param1.readInteger();
         this.var_1845 = param1.readInteger();
         this.var_1843 = param1.readInteger();
         return true;
      }
   }
}

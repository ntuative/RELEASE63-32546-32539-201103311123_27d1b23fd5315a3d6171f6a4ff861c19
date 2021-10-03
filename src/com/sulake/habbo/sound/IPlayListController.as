package com.sulake.habbo.sound
{
   import com.sulake.core.runtime.IDisposable;
   
   public interface IPlayListController extends IDisposable
   {
       
      
      function get priority() : int;
      
      function get length() : int;
      
      function get playPosition() : int;
      
      function get nowPlayingSongId() : int;
      
      function get isPlaying() : Boolean;
      
      function set playPosition(param1:int) : void;
      
      function addItem(param1:ISongInfo, param2:int = -1) : int;
      
      function getEntry(param1:int) : ISongInfo;
      
      function moveItem(param1:int, param2:int) : void;
      
      function removeItem(param1:int) : void;
      
      function startPlaying() : void;
      
      function stopPlaying() : void;
      
      function requestPlayList() : void;
   }
}

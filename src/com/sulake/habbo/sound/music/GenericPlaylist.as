package com.sulake.habbo.sound.music
{
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.habbo.sound.IHabboMusicController;
   import com.sulake.habbo.sound.IPlayListController;
   import com.sulake.habbo.sound.ISongInfo;
   import com.sulake.habbo.sound.events.SoundCompleteEvent;
   import flash.events.IEventDispatcher;
   
   public class GenericPlaylist implements IPlayListController, IDisposable
   {
       
      
      protected var _disposed:Boolean = false;
      
      protected var var_89:Array;
      
      protected var var_238:IHabboMusicController;
      
      protected var _events:IEventDispatcher;
      
      protected var _priority:int = 1;
      
      protected var var_688:int = 0;
      
      protected var _isPlaying:Boolean = false;
      
      public function GenericPlaylist(param1:IHabboMusicController, param2:IEventDispatcher)
      {
         this.var_89 = new Array();
         super();
         this.var_238 = param1;
         this._events = param2;
         this._events.addEventListener(SoundCompleteEvent.const_291,this.onSongFinishedPlayingEvent);
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function get priority() : int
      {
         return this._priority;
      }
      
      public function get playPosition() : int
      {
         return this.var_688;
      }
      
      public function get isPlaying() : Boolean
      {
         return this._isPlaying;
      }
      
      public function get nowPlayingSongId() : int
      {
         var _loc1_:SongDataEntry = this.var_89[this.var_688];
         return _loc1_.id;
      }
      
      public function get length() : int
      {
         if(this.var_89 == null)
         {
            return 0;
         }
         return this.var_89.length;
      }
      
      public function set priority(param1:int) : void
      {
         this._priority = param1;
      }
      
      public function set playPosition(param1:int) : void
      {
         this.var_688 = param1;
      }
      
      public function dispose() : void
      {
         if(!this._disposed)
         {
            this.stopPlaying();
            this.var_89 = null;
            this.var_238 = null;
            if(this._events)
            {
               this._events.removeEventListener(SoundCompleteEvent.const_291,this.onSongFinishedPlayingEvent);
               this._events = null;
            }
            this._disposed = true;
         }
      }
      
      public function addItem(param1:ISongInfo, param2:int = -1) : int
      {
         var _loc3_:SongDataEntry = param1 as SongDataEntry;
         if(_loc3_ == null)
         {
            Logger.log("WARNING could not convert added playlist item to SongDataEntry");
            return -1;
         }
         if(param2 == -1)
         {
            return this.var_89.push(_loc3_) - 1;
         }
         this.var_89.splice(param2,0,_loc3_);
         return param2;
      }
      
      public function getEntry(param1:int) : ISongInfo
      {
         if(param1 < 0 || param1 >= this.var_89.length)
         {
            return null;
         }
         return this.var_89[param1];
      }
      
      public function moveItem(param1:int, param2:int) : void
      {
         if(param1 < 0 || param1 >= this.var_89.length)
         {
            return;
         }
         if(param2 < 0 || param2 >= this.var_89.length)
         {
            return;
         }
         var _loc3_:Array = this.var_89.splice(param1,1);
         this.var_89.splice(param2,0,_loc3_[0]);
      }
      
      public function removeItem(param1:int) : void
      {
         if(param1 < 0 || param1 >= this.var_89.length)
         {
            return;
         }
         this.var_89.splice(param1,1);
      }
      
      public function startPlaying() : void
      {
         var _loc1_:SongDataEntry = this.getEntry(this.var_688) as SongDataEntry;
         this.var_238.playSong(_loc1_.id,this._priority);
         this._isPlaying = true;
      }
      
      public function stopPlaying() : void
      {
         this.var_238.stop(this._priority);
         this._isPlaying = false;
      }
      
      public function requestPlayList() : void
      {
         Logger.log("WARNING: Unimplemented method \'requestPlayList\' of GenericPlayList base class called!");
      }
      
      public function copyRoomItemPlaylist(param1:SoundMachinePlayListController) : void
      {
      }
      
      protected function onSongFinishedPlayingEvent(param1:SoundCompleteEvent) : void
      {
         var _loc2_:SongDataEntry = this.getEntry(this.var_688) as SongDataEntry;
         if(param1.id == _loc2_.id)
         {
            this.playNextItem();
         }
      }
      
      protected function playNextItem() : void
      {
         var _loc1_:SongDataEntry = this.getEntry(this.getNextIndex()) as SongDataEntry;
         this.var_238.playSong(_loc1_.id,this._priority);
         this.var_688 = this.getNextIndex();
      }
      
      protected function getNextIndex() : int
      {
         return this.var_688 + 1 >= this.var_89.length ? 0 : int(this.var_688 + 1);
      }
   }
}

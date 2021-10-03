package com.sulake.habbo.sound.music
{
   import com.sulake.core.communication.connection.IConnection;
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.utils.Map;
   import com.sulake.habbo.communication.messages.incoming.sound.SongInfoEntry;
   import com.sulake.habbo.communication.messages.incoming.sound.TraxSongInfoMessageEvent;
   import com.sulake.habbo.communication.messages.incoming.sound.UserSongDisksInventoryMessageEvent;
   import com.sulake.habbo.communication.messages.outgoing.sound.GetSongInfoMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.sound.GetUserSongDisksMessageComposer;
   import com.sulake.habbo.communication.messages.parser.sound.TraxSongInfoMessageParser;
   import com.sulake.habbo.communication.messages.parser.sound.UserSongDisksInventoryMessageParser;
   import com.sulake.habbo.room.events.RoomObjectSoundMachineStateUpdateEvent;
   import com.sulake.habbo.sound.HabboMusicPrioritiesEnum;
   import com.sulake.habbo.sound.HabboSoundManagerFlash10;
   import com.sulake.habbo.sound.IHabboMusicController;
   import com.sulake.habbo.sound.IHabboSound;
   import com.sulake.habbo.sound.IPlayListController;
   import com.sulake.habbo.sound.ISongInfo;
   import com.sulake.habbo.sound.events.NowPlayingEvent;
   import com.sulake.habbo.sound.events.SongDiskInventoryReceivedEvent;
   import com.sulake.habbo.sound.events.SongInfoReceivedEvent;
   import com.sulake.habbo.sound.events.SoundCompleteEvent;
   import flash.events.Event;
   import flash.events.IEventDispatcher;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   import flash.utils.getTimer;
   
   public class HabboMusicController implements IHabboMusicController, IDisposable
   {
      
      public static const const_1099:int = -1;
       
      
      private var var_493:HabboSoundManagerFlash10;
      
      private var _connection:IConnection;
      
      private var _events:IEventDispatcher;
      
      private var var_81:IEventDispatcher;
      
      private var var_527:Map;
      
      private var var_646:Map;
      
      private var var_790:Array;
      
      private var var_451:IPlayListController = null;
      
      private var _disposed:Boolean = false;
      
      private var var_526:Array;
      
      private var var_1213:Array;
      
      private var var_376:int = -1;
      
      private var var_1212:Timer;
      
      private var var_1663:Map = null;
      
      private var var_789:Array;
      
      private var var_2614:int = -1;
      
      private var var_2613:int = -1;
      
      public function HabboMusicController(param1:HabboSoundManagerFlash10, param2:IEventDispatcher, param3:IEventDispatcher, param4:IConnection)
      {
         this.var_527 = new Map();
         this.var_646 = new Map();
         this.var_790 = new Array();
         this.var_526 = [];
         this.var_1213 = [];
         this.var_789 = new Array();
         super();
         this.var_493 = param1;
         this._events = param2;
         this.var_81 = param3;
         this._connection = param4;
         this._connection.addMessageEvent(new TraxSongInfoMessageEvent(this.onSongInfoMessage));
         this._connection.addMessageEvent(new UserSongDisksInventoryMessageEvent(this.onSongDiskInventoryMessage));
         this.var_81.addEventListener(RoomObjectSoundMachineStateUpdateEvent.const_675,this.onJukeboxInit);
         this.var_81.addEventListener(RoomObjectSoundMachineStateUpdateEvent.const_779,this.onJukeboxDispose);
         this.var_81.addEventListener(RoomObjectSoundMachineStateUpdateEvent.const_845,this.onSoundMachineInit);
         this.var_81.addEventListener(RoomObjectSoundMachineStateUpdateEvent.const_920,this.onSoundMachineDispose);
         this.var_1212 = new Timer(1000);
         this.var_1212.start();
         this.var_1212.addEventListener(TimerEvent.TIMER,this.sendNextSongRequestMessage);
         this._events.addEventListener(SoundCompleteEvent.const_291,this.onSongFinishedPlayingEvent);
         var _loc5_:int = 0;
         while(_loc5_ < HabboMusicPrioritiesEnum.PRIORITY_COUNT)
         {
            this.var_1213[_loc5_] = -1;
            this.var_526[_loc5_] = null;
            _loc5_++;
         }
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function get events() : IEventDispatcher
      {
         return this._events;
      }
      
      protected function onSongFinishedPlayingEvent(param1:SoundCompleteEvent) : void
      {
         if(this.getSongIdPlayingAtPriority(this.var_376) == param1.id)
         {
            this.resetSongIdPlayingAtPriority(this.var_376);
            this.resetSongStartRequest(this.var_376);
            this.playSongWithHighestPriority();
         }
      }
      
      public function dispose() : void
      {
         var _loc1_:int = 0;
         var _loc2_:* = null;
         var _loc3_:* = null;
         if(!this._disposed)
         {
            this.var_493 = null;
            this._connection = null;
            this.var_790 = null;
            if(this.var_451)
            {
               this.var_451.dispose();
               this.var_451 = null;
            }
            if(this.var_527)
            {
               _loc1_ = 0;
               while(_loc1_ < this.var_527.length)
               {
                  _loc2_ = this.var_527.getWithIndex(_loc1_) as SongDataEntry;
                  _loc3_ = _loc2_.soundObject as IHabboSound;
                  if(_loc3_ != null)
                  {
                     _loc3_.stop();
                  }
                  _loc2_.soundObject = null;
                  _loc1_++;
               }
               this.var_527.dispose();
               this.var_527 = null;
            }
            if(this.var_646 != null)
            {
               this.var_646.dispose();
               this.var_646 = null;
            }
            this.var_1212.stop();
            this.var_1212 = null;
            if(this.var_81)
            {
               this.var_81.removeEventListener(RoomObjectSoundMachineStateUpdateEvent.const_675,this.onJukeboxInit);
               this.var_81.removeEventListener(RoomObjectSoundMachineStateUpdateEvent.const_779,this.onJukeboxDispose);
               this.var_81.removeEventListener(RoomObjectSoundMachineStateUpdateEvent.const_845,this.onSoundMachineInit);
               this.var_81.removeEventListener(RoomObjectSoundMachineStateUpdateEvent.const_920,this.onSoundMachineDispose);
            }
            this._disposed = true;
         }
      }
      
      public function getRoomItemPlaylist(param1:int = -1) : IPlayListController
      {
         return this.var_451;
      }
      
      private function addSongStartRequest(param1:int, param2:int, param3:Number, param4:Number) : Boolean
      {
         if(param1 < 0 || param1 >= HabboMusicPrioritiesEnum.PRIORITY_COUNT)
         {
            return false;
         }
         var _loc5_:SongStartRequestData = new SongStartRequestData(param2,param3,param4);
         this.var_526[param1] = _loc5_;
         return true;
      }
      
      private function getSongStartRequest(param1:int) : SongStartRequestData
      {
         return this.var_526[param1];
      }
      
      private function resetSongStartRequest(param1:int) : void
      {
         if(param1 >= 0 && param1 < HabboMusicPrioritiesEnum.PRIORITY_COUNT)
         {
            this.var_526[param1] = null;
         }
      }
      
      private function processSongEntryForPlaying(param1:int, param2:Boolean = true) : Boolean
      {
         var _loc3_:SongDataEntry = this.getSongDataEntry(param1);
         if(_loc3_ == null)
         {
            this.addSongInfoRequest(param1);
            return false;
         }
         if(_loc3_.soundObject == null)
         {
            _loc3_.soundObject = this.var_493.loadTraxSong(_loc3_.id,_loc3_.songData);
         }
         var _loc4_:IHabboSound = _loc3_.soundObject;
         if(!_loc4_.ready)
         {
            return false;
         }
         return true;
      }
      
      public function playSong(param1:int, param2:int, param3:Number = 0, param4:Number = 0.0) : Boolean
      {
         if(!this.addSongStartRequest(param2,param1,param3,param4))
         {
            return false;
         }
         if(!this.processSongEntryForPlaying(param1))
         {
            return false;
         }
         if(param2 >= this.var_376)
         {
            this.playSongObject(param2,param1);
         }
         else
         {
            Logger.log("Higher priority song blocked playing. Stored song " + param1 + " for priority " + param2);
         }
         return true;
      }
      
      private function playSongWithHighestPriority() : void
      {
         var _loc3_:int = 0;
         var _loc1_:int = this.getTopRequestPriority();
         var _loc2_:int = _loc1_;
         while(_loc2_ >= 0)
         {
            _loc3_ = this.getSongIdRequestedAtPriority(_loc2_);
            if(_loc3_ >= 0 && this.playSongObject(_loc2_,_loc3_))
            {
               return;
            }
            _loc2_--;
         }
         this.var_376 = -1;
      }
      
      public function stop(param1:int) : void
      {
         var _loc2_:* = param1 == this.var_376;
         this.stopSongAtPriority(param1);
         this.resetSongIdPlayingAtPriority(param1);
         if(_loc2_)
         {
            this.resetSongStartRequest(param1);
            this.playSongWithHighestPriority();
         }
         if(param1 > HabboMusicPrioritiesEnum.const_196)
         {
            this._events.dispatchEvent(new NowPlayingEvent(NowPlayingEvent.const_1649,param1,-1,-1));
         }
      }
      
      private function stopSongAtPriority(param1:int) : void
      {
         var _loc2_:int = 0;
         var _loc3_:* = null;
         if(param1 == this.var_376 && this.var_376 >= 0)
         {
            _loc2_ = this.getSongIdPlayingAtPriority(param1);
            _loc3_ = this.getSongDataEntry(_loc2_);
            this.stopSongDataEntry(_loc3_);
            this.var_376 = -1;
         }
      }
      
      private function stopSongDataEntry(param1:SongDataEntry) : void
      {
         var _loc2_:* = null;
         if(param1 != null)
         {
            _loc2_ = param1.soundObject;
            if(_loc2_ != null)
            {
               _loc2_.stop();
            }
         }
      }
      
      private function getSongDataEntry(param1:int) : SongDataEntry
      {
         return this.var_527.getValue(param1) as SongDataEntry;
      }
      
      public function updateVolume(param1:Number) : void
      {
         var _loc3_:int = 0;
         var _loc4_:* = null;
         var _loc2_:int = 0;
         while(_loc2_ < HabboMusicPrioritiesEnum.PRIORITY_COUNT)
         {
            _loc3_ = this.getSongIdPlayingAtPriority(_loc2_);
            if(_loc3_ >= 0)
            {
               _loc4_ = this.getSongDataEntry(_loc3_) as SongDataEntry;
               if(_loc4_ != null)
               {
                  _loc4_.soundObject.volume = param1;
               }
            }
            _loc2_++;
         }
      }
      
      public function onSongLoaded(param1:int) : void
      {
         var _loc3_:int = 0;
         Logger.log("Song loaded : " + param1);
         var _loc2_:int = this.getTopRequestPriority();
         if(_loc2_ >= 0)
         {
            _loc3_ = this.getSongIdRequestedAtPriority(_loc2_);
            if(param1 == _loc3_)
            {
               this.playSongObject(_loc2_,param1);
            }
         }
      }
      
      public function addSongInfoRequest(param1:int) : void
      {
         this.requestSong(param1,true);
      }
      
      public function requestSongInfoWithoutSamples(param1:int) : void
      {
         this.requestSong(param1,false);
      }
      
      private function requestSong(param1:int, param2:Boolean) : void
      {
         if(this.var_646.getValue(param1) == null)
         {
            this.var_646.add(param1,param2);
            this.var_790.push(param1);
         }
      }
      
      public function getSongInfo(param1:int) : ISongInfo
      {
         var _loc2_:SongDataEntry = this.getSongDataEntry(param1);
         if(_loc2_ == null)
         {
            this.requestSongInfoWithoutSamples(param1);
         }
         return _loc2_;
      }
      
      public function requestUserSongDisks() : void
      {
         if(this._connection == null)
         {
            return;
         }
         this._connection.send(new GetUserSongDisksMessageComposer());
      }
      
      public function getSongDiskInventory() : Map
      {
         return this.var_1663;
      }
      
      public function getSongIdPlayingAtPriority(param1:int) : int
      {
         if(param1 < 0 || param1 >= HabboMusicPrioritiesEnum.PRIORITY_COUNT)
         {
            return -1;
         }
         return this.var_1213[param1];
      }
      
      private function resetSongIdPlayingAtPriority(param1:int) : void
      {
         if(param1 >= 0 && param1 < HabboMusicPrioritiesEnum.PRIORITY_COUNT)
         {
            this.var_1213[param1] = -1;
         }
      }
      
      private function getSongIdRequestedAtPriority(param1:int) : int
      {
         if(param1 < 0 || param1 >= HabboMusicPrioritiesEnum.PRIORITY_COUNT)
         {
            return -1;
         }
         if(this.var_526[param1] == null)
         {
            return -1;
         }
         var _loc2_:SongStartRequestData = this.var_526[param1];
         return _loc2_.songId;
      }
      
      private function sendNextSongRequestMessage(param1:TimerEvent) : void
      {
         if(this.var_790.length < 1)
         {
            return;
         }
         if(this._connection == null)
         {
            return;
         }
         this._connection.send(new GetSongInfoMessageComposer(this.var_790));
         Logger.log("Requested song info\'s : " + this.var_790);
         this.var_790 = new Array();
      }
      
      private function onSongInfoMessage(param1:IMessageEvent) : void
      {
         var _loc6_:* = null;
         var _loc7_:* = false;
         var _loc8_:Boolean = false;
         var _loc9_:* = null;
         var _loc10_:* = null;
         var _loc11_:int = 0;
         var _loc12_:int = 0;
         var _loc2_:TraxSongInfoMessageEvent = param1 as TraxSongInfoMessageEvent;
         var _loc3_:TraxSongInfoMessageParser = _loc2_.getParser() as TraxSongInfoMessageParser;
         var _loc4_:Array = _loc3_.songs;
         var _loc5_:int = 0;
         while(_loc5_ < _loc4_.length)
         {
            _loc6_ = _loc4_[_loc5_];
            _loc7_ = this.getSongDataEntry(_loc6_.id) == null;
            _loc8_ = this.areSamplesRequested(_loc6_.id);
            if(_loc7_)
            {
               _loc9_ = null;
               if(_loc8_)
               {
                  _loc9_ = this.var_493.loadTraxSong(_loc6_.id,_loc6_.data);
               }
               _loc10_ = new SongDataEntry(_loc6_.id,_loc6_.length,_loc6_.name,_loc6_.creator,_loc9_);
               _loc10_.songData = _loc6_.data;
               this.var_527.add(_loc6_.id,_loc10_);
               _loc11_ = this.getTopRequestPriority();
               _loc12_ = this.getSongIdRequestedAtPriority(_loc11_);
               if(_loc9_ != null && _loc9_.ready && _loc6_.id == _loc12_)
               {
                  this.playSongObject(_loc11_,_loc12_);
               }
               this._events.dispatchEvent(new SongInfoReceivedEvent(SongInfoReceivedEvent.TRAX_SONG_INFO_RECEIVED,_loc6_.id));
               while(this.var_789.indexOf(_loc6_.id) != -1)
               {
                  this.var_789.splice(this.var_789.indexOf(_loc6_.id),1);
               }
               if(this.var_789.length == 0)
               {
                  this._events.dispatchEvent(new SongDiskInventoryReceivedEvent(SongDiskInventoryReceivedEvent.const_1180));
               }
               Logger.log("Received song info : " + _loc6_.id);
            }
            _loc5_++;
         }
      }
      
      private function playSongObject(param1:int, param2:int) : Boolean
      {
         if(param2 == -1 || param1 < 0 || param1 >= HabboMusicPrioritiesEnum.PRIORITY_COUNT)
         {
            return false;
         }
         this.stopSongAtPriority(this.var_376);
         var _loc3_:SongDataEntry = this.getSongDataEntry(param2);
         if(_loc3_ == null)
         {
            Logger.log("WARNING: Unable to find song entry id " + param2 + " that was supposed to be loaded.");
            return false;
         }
         var _loc4_:IHabboSound = _loc3_.soundObject;
         if(_loc4_ == null || !_loc4_.ready)
         {
            return false;
         }
         _loc4_.volume = this.var_493.volume;
         var _loc5_:* = Number(const_1099);
         var _loc6_:* = 0;
         var _loc7_:SongStartRequestData = this.getSongStartRequest(param1);
         if(_loc7_ != null)
         {
            _loc5_ = Number(_loc7_.startPos);
            _loc6_ = Number(_loc7_.playLength);
         }
         if(_loc5_ >= _loc3_.length / 1000)
         {
            return false;
         }
         if(_loc5_ == const_1099)
         {
            _loc5_ = 0;
         }
         _loc4_.position = _loc5_;
         _loc4_.play(_loc6_);
         this.var_376 = param1;
         this.var_1213[param1] = param2;
         this.notifySongPlaying(_loc3_);
         if(param1 > HabboMusicPrioritiesEnum.const_196)
         {
            this._events.dispatchEvent(new NowPlayingEvent(NowPlayingEvent.const_1467,param1,_loc3_.id,-1));
         }
         Logger.log("Started playing song " + param2 + " at position " + _loc5_ + " (length " + _loc3_.length / 1000 + ") with priority " + param1);
         return true;
      }
      
      private function notifySongPlaying(param1:SongDataEntry) : void
      {
         var _loc3_:int = getTimer();
         if(param1.length >= 8000 && (this.var_2614 != param1.id || _loc3_ > this.var_2613 + 8000))
         {
            this.var_493.notifyPlayedSong(param1.name,param1.creator);
            this.var_2614 = param1.id;
            this.var_2613 = _loc3_;
         }
      }
      
      private function getTopRequestPriority() : int
      {
         var _loc1_:int = this.var_526.length - 1;
         while(_loc1_ >= 0)
         {
            if(this.var_526[_loc1_] != null)
            {
               return _loc1_;
            }
            _loc1_--;
         }
         return -1;
      }
      
      private function areSamplesRequested(param1:int) : Boolean
      {
         if(this.var_646.getValue(param1) == null)
         {
            return false;
         }
         return this.var_646.getValue(param1);
      }
      
      private function onSongDiskInventoryMessage(param1:IMessageEvent) : void
      {
         var _loc4_:int = 0;
         var _loc2_:UserSongDisksInventoryMessageEvent = param1 as UserSongDisksInventoryMessageEvent;
         var _loc3_:UserSongDisksInventoryMessageParser = _loc2_.getParser() as UserSongDisksInventoryMessageParser;
         this.var_1663 = _loc3_.songDiskInventory;
         for each(_loc4_ in this.var_1663.getValues())
         {
            if(this.var_527.getKeys().indexOf(_loc4_) == -1)
            {
               this.var_789.push(_loc4_);
               this.requestSongInfoWithoutSamples(_loc4_);
            }
         }
         if(this.var_789.length == 0)
         {
            this._events.dispatchEvent(new SongDiskInventoryReceivedEvent(SongDiskInventoryReceivedEvent.const_1180));
         }
      }
      
      private function onSoundMachineInit(param1:Event) : void
      {
         this.var_451 = new SoundMachinePlayListController(this.var_493,this,this._events,this.var_81,this._connection) as IPlayListController;
      }
      
      private function onSoundMachineDispose(param1:Event) : void
      {
         this.var_451.dispose();
         this.var_451 = null;
      }
      
      private function onJukeboxInit(param1:Event) : void
      {
         this.var_451 = new JukeboxPlayListController(this.var_493,this,this._events,this.var_81,this._connection) as IPlayListController;
      }
      
      private function onJukeboxDispose(param1:Event) : void
      {
         this.var_451.dispose();
         this.var_451 = null;
      }
   }
}

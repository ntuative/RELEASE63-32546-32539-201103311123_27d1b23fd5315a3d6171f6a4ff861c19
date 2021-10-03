package com.sulake.habbo.sound.music
{
   import com.sulake.core.communication.connection.IConnection;
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.habbo.communication.messages.incoming.sound.JukeboxSongDisksMessageEvent;
   import com.sulake.habbo.communication.messages.incoming.sound.NowPlayingMessageEvent;
   import com.sulake.habbo.communication.messages.outgoing.sound.GetJukeboxPlayListMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.sound.GetNowPlayingMessageComposer;
   import com.sulake.habbo.communication.messages.parser.sound.JukeboxSongDisksMessageParser;
   import com.sulake.habbo.communication.messages.parser.sound.NowPlayingMessageParser;
   import com.sulake.habbo.room.events.RoomObjectSoundMachineStateUpdateEvent;
   import com.sulake.habbo.sound.HabboMusicPrioritiesEnum;
   import com.sulake.habbo.sound.HabboSoundManagerFlash10;
   import com.sulake.habbo.sound.IPlayListController;
   import com.sulake.habbo.sound.events.NowPlayingEvent;
   import com.sulake.habbo.sound.events.PlayListUpdatedEvent;
   import com.sulake.habbo.sound.events.SongInfoReceivedEvent;
   import com.sulake.habbo.sound.events.SoundCompleteEvent;
   import flash.events.IEventDispatcher;
   
   public class JukeboxPlayListController extends GenericPlaylist implements IPlayListController
   {
       
      
      private var _connection:IConnection;
      
      private var var_493:HabboSoundManagerFlash10;
      
      private var var_529:int = -1;
      
      private var var_835:Array;
      
      private var var_704:Array;
      
      private var var_81:IEventDispatcher;
      
      private var var_2023:int = -1;
      
      public function JukeboxPlayListController(param1:HabboSoundManagerFlash10, param2:HabboMusicController, param3:IEventDispatcher, param4:IEventDispatcher, param5:IConnection)
      {
         var _loc6_:* = null;
         this.var_835 = new Array();
         super(param2,param3);
         this._connection = param5;
         this.var_493 = param1;
         this.var_81 = param4;
         this.var_704 = [];
         this.var_704.push(new NowPlayingMessageEvent(this.onNowPlayingMessage));
         this.var_704.push(new JukeboxSongDisksMessageEvent(this.onJukeboxSongDisksMessage));
         for each(_loc6_ in this.var_704)
         {
            this._connection.addMessageEvent(_loc6_);
         }
         var_238.events.addEventListener(SongInfoReceivedEvent.TRAX_SONG_INFO_RECEIVED,this.onSongInfoReceivedEvent);
         this.var_81.addEventListener(RoomObjectSoundMachineStateUpdateEvent.const_893,this.onFurnitureStateOnEvent);
         this.var_81.addEventListener(RoomObjectSoundMachineStateUpdateEvent.const_890,this.onFurnitureStateOffEvent);
      }
      
      override public function get nowPlayingSongId() : int
      {
         return this.var_529;
      }
      
      override public function get playPosition() : int
      {
         return this.var_2023;
      }
      
      override public function dispose() : void
      {
         var _loc1_:* = null;
         if(!_disposed)
         {
            this.stopPlaying();
            if(false)
            {
               var_238.events.removeEventListener(SongInfoReceivedEvent.TRAX_SONG_INFO_RECEIVED,this.onSongInfoReceivedEvent);
            }
            if(this.var_81)
            {
               this.var_81.removeEventListener(RoomObjectSoundMachineStateUpdateEvent.const_893,this.onFurnitureStateOnEvent);
               this.var_81.removeEventListener(RoomObjectSoundMachineStateUpdateEvent.const_890,this.onFurnitureStateOffEvent);
               this.var_81 = null;
            }
            super.dispose();
            this.var_493 = null;
            if(this._connection)
            {
               for each(_loc1_ in this.var_704)
               {
                  this._connection.removeMessageEvent(_loc1_);
                  _loc1_.dispose();
               }
               this.var_704 = null;
               this._connection = null;
            }
         }
      }
      
      override public function stopPlaying() : void
      {
         var_238.stop(HabboMusicPrioritiesEnum.const_196);
         this.var_529 = -1;
         this.var_2023 = -1;
         _isPlaying = false;
      }
      
      override public function requestPlayList() : void
      {
         if(this._connection == null)
         {
            return;
         }
         this._connection.send(new GetJukeboxPlayListMessageComposer());
      }
      
      override protected function onSongFinishedPlayingEvent(param1:SoundCompleteEvent) : void
      {
      }
      
      private function onFurnitureStateOnEvent(param1:RoomObjectSoundMachineStateUpdateEvent) : void
      {
         this._connection.send(new GetNowPlayingMessageComposer());
      }
      
      private function onFurnitureStateOffEvent(param1:RoomObjectSoundMachineStateUpdateEvent) : void
      {
         this.stopPlaying();
      }
      
      private function onNowPlayingMessage(param1:IMessageEvent) : void
      {
         var _loc3_:* = null;
         var _loc2_:NowPlayingMessageEvent = param1 as NowPlayingMessageEvent;
         _loc3_ = _loc2_.getParser() as NowPlayingMessageParser;
         Logger.log("Received Now Playing message with: " + _loc3_.currentSongId + ", " + _loc3_.nextSongId + ", " + _loc3_.syncCount);
         _isPlaying = _loc3_.currentSongId != -1;
         if(_loc3_.currentSongId >= 0)
         {
            var_238.playSong(_loc3_.currentSongId,HabboMusicPrioritiesEnum.const_196,_loc3_.syncCount / 1000);
            this.var_529 = _loc3_.currentSongId;
         }
         if(_loc3_.nextSongId >= 0)
         {
            var_238.addSongInfoRequest(_loc3_.nextSongId);
         }
         this.var_2023 = _loc3_.currentPosition;
         this.var_493.events.dispatchEvent(new NowPlayingEvent(NowPlayingEvent.NOW_PLAYING_SONG_CHANGED,HabboMusicPrioritiesEnum.const_196,_loc3_.currentSongId,_loc3_.currentPosition));
      }
      
      private function onJukeboxSongDisksMessage(param1:IMessageEvent) : void
      {
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:* = null;
         var _loc2_:JukeboxSongDisksMessageEvent = param1 as JukeboxSongDisksMessageEvent;
         var _loc3_:JukeboxSongDisksMessageParser = _loc2_.getParser() as JukeboxSongDisksMessageParser;
         Logger.log("Received Jukebox song disks (=playlist) message, length of playlist: " + _loc3_.songDisks.length);
         var_89 = new Array();
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_.songDisks.length)
         {
            _loc5_ = _loc3_.songDisks.getValues()[_loc4_];
            _loc6_ = _loc3_.songDisks.getKeys()[_loc4_];
            _loc7_ = var_238.getSongInfo(_loc5_) as SongDataEntry;
            if(_loc7_ == null)
            {
               _loc7_ = new SongDataEntry(_loc5_,-1,null,null,null);
               this.var_835.push(_loc5_);
               var_238.requestSongInfoWithoutSamples(_loc5_);
            }
            _loc7_.diskId = _loc6_;
            var_89.push(_loc7_);
            _loc4_++;
         }
         if(this.var_835.length == 0)
         {
            _events.dispatchEvent(new PlayListUpdatedEvent(PlayListUpdatedEvent.const_515));
         }
      }
      
      private function onSongInfoReceivedEvent(param1:SongInfoReceivedEvent) : void
      {
         var _loc3_:* = null;
         var _loc4_:int = 0;
         var _loc2_:int = 0;
         while(_loc2_ < var_89.length)
         {
            _loc3_ = var_89[_loc2_] as SongDataEntry;
            if(_loc3_.id == param1.id)
            {
               _loc4_ = _loc3_.diskId;
               var_89[_loc2_] = var_238.getSongInfo(param1.id) as SongDataEntry;
               var_89[_loc2_].diskId = _loc4_;
               break;
            }
            _loc2_++;
         }
         while(this.var_835.indexOf(param1.id) != -1)
         {
            this.var_835.splice(this.var_835.indexOf(param1.id),1);
         }
         if(this.var_835.length == 0)
         {
            _events.dispatchEvent(new PlayListUpdatedEvent(PlayListUpdatedEvent.const_515));
         }
      }
   }
}

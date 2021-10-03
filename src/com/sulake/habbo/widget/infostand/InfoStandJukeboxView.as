package com.sulake.habbo.widget.infostand
{
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.components.IBorderWindow;
   import com.sulake.core.window.components.IItemListWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.catalog.IHabboCatalog;
   import com.sulake.habbo.sound.IHabboSoundManager;
   import com.sulake.habbo.sound.IPlayListController;
   import com.sulake.habbo.sound.ISongInfo;
   import com.sulake.habbo.sound.events.NowPlayingEvent;
   import com.sulake.habbo.widget.events.RoomWidgetFurniInfoUpdateEvent;
   
   public class InfoStandJukeboxView extends InfoStandFurniView
   {
       
      
      private var var_493:IHabboSoundManager;
      
      public function InfoStandJukeboxView(param1:InfostandWidget, param2:String, param3:IHabboCatalog, param4:IHabboSoundManager)
      {
         super(param1,param2,param3);
         this.var_493 = param4;
         this.var_493.events.addEventListener(NowPlayingEvent.NOW_PLAYING_SONG_CHANGED,this.onNowPlayingChanged);
      }
      
      override public function dispose() : void
      {
         super.dispose();
         if(this.var_493)
         {
            this.var_493.events.removeEventListener(NowPlayingEvent.NOW_PLAYING_SONG_CHANGED,this.onNowPlayingChanged);
         }
      }
      
      override protected function createWindow(param1:String) : void
      {
         var _loc4_:* = null;
         var _loc5_:int = 0;
         var _loc2_:XmlAsset = _widget.assets.getAssetByName("jukebox_view") as XmlAsset;
         _window = _widget.windowManager.buildFromXML(_loc2_.content as XML) as IItemListWindow;
         if(_window == null)
         {
            throw new Error("Failed to construct window from XML!");
         }
         var_102 = _window.getListItemByName("info_border") as IBorderWindow;
         var_68 = _window.getListItemByName("button_list") as IItemListWindow;
         if(var_102 != null)
         {
            var_53 = var_102.findChildByName("infostand_element_list") as IItemListWindow;
         }
         _window.name = param1;
         _widget.mainContainer.addChild(_window);
         var _loc3_:IWindow = var_102.findChildByTag("close");
         if(_loc3_ != null)
         {
            _loc3_.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,onClose);
         }
         if(var_68 != null)
         {
            _loc5_ = 0;
            while(_loc5_ < var_68.numListItems)
            {
               _loc4_ = var_68.getListItemAt(_loc5_);
               _loc4_.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,onButtonClicked);
               _loc5_++;
            }
         }
         var_467 = var_102.findChildByTag("catalog");
         if(var_467 != null)
         {
            var_467.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,onCatalogButtonClicked);
         }
      }
      
      private function set nowPlayingTrackName(param1:String) : void
      {
         var _loc2_:ITextWindow = var_53.getListItemByName("track_name_text") as ITextWindow;
         if(_loc2_ == null)
         {
            return;
         }
         _loc2_.text = param1;
         _loc2_.visible = true;
         _loc2_.height = _loc2_.textHeight + 5;
         updateWindow();
      }
      
      private function set nowPlayingAuthorName(param1:String) : void
      {
         var _loc2_:ITextWindow = var_53.getListItemByName("track_creator_text") as ITextWindow;
         if(_loc2_ == null)
         {
            return;
         }
         _loc2_.text = param1;
         _loc2_.visible = true;
         _loc2_.height = _loc2_.textHeight + 5;
         updateWindow();
      }
      
      override public function update(param1:RoomWidgetFurniInfoUpdateEvent) : void
      {
         var _loc3_:int = 0;
         var _loc4_:* = null;
         var _loc2_:IPlayListController = this.var_493.musicController.getRoomItemPlaylist();
         if(_loc2_ == null)
         {
            this.nowPlayingTrackName = "";
            this.nowPlayingAuthorName = "";
         }
         else
         {
            _loc3_ = _loc2_.nowPlayingSongId;
            if(_loc3_ != -1)
            {
               _loc4_ = this.var_493.musicController.getSongInfo(_loc3_);
               if(_loc4_ != null)
               {
                  this.nowPlayingTrackName = _loc4_.name;
                  this.nowPlayingAuthorName = _loc4_.creator;
               }
            }
            else
            {
               this.nowPlayingTrackName = "";
               this.nowPlayingAuthorName = "";
            }
         }
         super.update(param1);
      }
      
      private function onNowPlayingChanged(param1:NowPlayingEvent) : void
      {
         var _loc2_:* = null;
         if(_widget.mainContainer.visible && false)
         {
            if(param1.id != -1)
            {
               _loc2_ = this.var_493.musicController.getSongInfo(param1.id);
               if(_loc2_ != null)
               {
                  this.nowPlayingTrackName = _loc2_.name;
                  this.nowPlayingAuthorName = _loc2_.creator;
                  return;
               }
               this.nowPlayingTrackName = "";
               this.nowPlayingAuthorName = "";
            }
         }
      }
   }
}

package com.sulake.habbo.widget.memenu
{
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   import com.sulake.habbo.localization.IHabboLocalizationManager;
   import com.sulake.habbo.widget.RoomWidgetBase;
   import com.sulake.habbo.widget.events.RoomWidgetAvatarActionUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetAvatarEditorUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetDanceUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetHabboClubUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetPurseUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetRoomEngineUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetRoomObjectUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetSettingsUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetToolbarClickedUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetTutorialEvent;
   import com.sulake.habbo.widget.events.RoomWidgetUpdateEffectsUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetUserInfoUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetWaveUpdateEvent;
   import com.sulake.habbo.widget.memenu.enum.HabboMeMenuTrackingEvent;
   import com.sulake.habbo.widget.messages.RoomWidgetRequestWidgetMessage;
   import com.sulake.habbo.widget.messages.RoomWidgetSelectOutfitMessage;
   import com.sulake.habbo.widget.messages.RoomWidgetToolbarMessage;
   import com.sulake.habbo.window.IHabboWindowManager;
   import com.sulake.habbo.window.enum.HabboWindowParam;
   import com.sulake.habbo.window.enum.HabboWindowStyle;
   import com.sulake.habbo.window.enum.HabboWindowType;
   import flash.events.Event;
   import flash.events.IEventDispatcher;
   import flash.external.ExternalInterface;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.utils.getTimer;
   
   public class MeMenuWidget extends RoomWidgetBase
   {
      
      public static const const_114:String = "me_menu_top_view";
      
      public static const const_1599:String = "me_menu_rooms_view";
      
      public static const const_322:String = "me_menu_my_clothes_view";
      
      public static const const_1239:String = "me_menu_dance_moves_view";
      
      public static const const_785:String = "me_menu_effects_view";
      
      public static const const_853:String = "me_menu_settings_view";
      
      public static const const_733:String = "me_menu_sound_settings";
      
      private static const const_1338:int = 5000;
       
      
      private var var_43:IMeMenuView;
      
      private var _mainContainer:IWindowContainer;
      
      private var _eventDispatcher:IEventDispatcher;
      
      private var var_1170:Point;
      
      private var var_1450:int = 0;
      
      private var var_2499:int = 0;
      
      private var var_2503:int = 0;
      
      private var var_2498:Boolean = false;
      
      private var var_1792:int = 0;
      
      private var var_1169:Boolean = false;
      
      private var var_2500:Boolean = false;
      
      private var var_440:Boolean = false;
      
      private var var_2502:int = 0;
      
      private var var_2501:Boolean = false;
      
      private var var_1791:int = 0;
      
      private var var_1776:Boolean = false;
      
      private var _config:IHabboConfigurationManager;
      
      public function MeMenuWidget(param1:IHabboWindowManager, param2:IAssetLibrary, param3:IHabboLocalizationManager, param4:IEventDispatcher, param5:IHabboConfigurationManager)
      {
         super(param1,param2,param3);
         this._config = param5;
         this.var_1170 = new Point(0,0);
         this._eventDispatcher = param4;
         if(param5 != null && false)
         {
            this.var_2501 = param5.getKey("client.news.embed.enabled","false") == "com.sulake.room.object.logic";
         }
         this.changeView(const_114);
         this.hide();
      }
      
      override public function dispose() : void
      {
         if(disposed)
         {
            return;
         }
         this.hide();
         this._eventDispatcher = null;
         if(this.var_43 != null)
         {
            this.var_43.dispose();
            this.var_43 = null;
         }
         super.dispose();
      }
      
      override public function get mainWindow() : IWindow
      {
         return this._mainContainer;
      }
      
      override public function registerUpdateEvents(param1:IEventDispatcher) : void
      {
         if(param1 == null)
         {
            return;
         }
         param1.addEventListener(RoomWidgetWaveUpdateEvent.const_710,this.onWaveEvent);
         param1.addEventListener(RoomWidgetDanceUpdateEvent.const_798,this.onDanceEvent);
         param1.addEventListener(RoomWidgetUpdateEffectsUpdateEvent.const_763,this.onUpdateEffects);
         param1.addEventListener(RoomWidgetToolbarClickedUpdateEvent.const_728,this.onToolbarClicked);
         param1.addEventListener(RoomWidgetAvatarEditorUpdateEvent.const_706,this.onAvatarEditorClosed);
         param1.addEventListener(RoomWidgetAvatarEditorUpdateEvent.const_847,this.onHideAvatarEditor);
         param1.addEventListener(RoomWidgetRoomObjectUpdateEvent.const_155,this.onAvatarDeselected);
         param1.addEventListener(RoomWidgetHabboClubUpdateEvent.const_255,this.onHabboClubEvent);
         param1.addEventListener(RoomWidgetAvatarActionUpdateEvent.const_719,this.onAvatarActionEvent);
         param1.addEventListener(RoomWidgetUserInfoUpdateEvent.const_118,this.onUserInfo);
         param1.addEventListener(RoomWidgetSettingsUpdateEvent.const_391,this.onSettingsUpdate);
         param1.addEventListener(RoomWidgetTutorialEvent.const_116,this.onTutorialEvent);
         param1.addEventListener(RoomWidgetTutorialEvent.const_517,this.onTutorialEvent);
         param1.addEventListener(RoomWidgetPurseUpdateEvent.const_71,this.onCreditBalance);
         param1.addEventListener(RoomWidgetRoomEngineUpdateEvent.const_91,this.onNormalMode);
         param1.addEventListener(RoomWidgetRoomEngineUpdateEvent.const_350,this.onGameMode);
         super.registerUpdateEvents(param1);
      }
      
      override public function unregisterUpdateEvents(param1:IEventDispatcher) : void
      {
         if(param1 == null)
         {
            return;
         }
         param1.removeEventListener(RoomWidgetWaveUpdateEvent.const_710,this.onWaveEvent);
         param1.removeEventListener(RoomWidgetDanceUpdateEvent.const_798,this.onDanceEvent);
         param1.removeEventListener(RoomWidgetUpdateEffectsUpdateEvent.const_763,this.onUpdateEffects);
         param1.removeEventListener(RoomWidgetToolbarClickedUpdateEvent.const_728,this.onToolbarClicked);
         param1.removeEventListener(RoomWidgetRoomObjectUpdateEvent.const_155,this.onAvatarDeselected);
         param1.removeEventListener(RoomWidgetHabboClubUpdateEvent.const_255,this.onHabboClubEvent);
         param1.removeEventListener(RoomWidgetAvatarActionUpdateEvent.const_719,this.onAvatarActionEvent);
         param1.removeEventListener(RoomWidgetAvatarEditorUpdateEvent.const_706,this.onHideAvatarEditor);
         param1.removeEventListener(RoomWidgetAvatarEditorUpdateEvent.const_847,this.onAvatarEditorClosed);
         param1.removeEventListener(RoomWidgetUserInfoUpdateEvent.const_118,this.onUserInfo);
         param1.removeEventListener(RoomWidgetSettingsUpdateEvent.const_391,this.onSettingsUpdate);
         param1.removeEventListener(RoomWidgetTutorialEvent.const_517,this.onTutorialEvent);
         param1.removeEventListener(RoomWidgetTutorialEvent.const_116,this.onTutorialEvent);
         param1.removeEventListener(RoomWidgetPurseUpdateEvent.const_71,this.onCreditBalance);
         param1.removeEventListener(RoomWidgetRoomEngineUpdateEvent.const_91,this.onNormalMode);
         param1.removeEventListener(RoomWidgetRoomEngineUpdateEvent.const_91,this.onGameMode);
      }
      
      public function hide(param1:RoomWidgetRoomObjectUpdateEvent = null) : void
      {
         var _loc2_:RoomWidgetToolbarMessage = new RoomWidgetToolbarMessage(RoomWidgetToolbarMessage.const_748);
         _loc2_.window = this._mainContainer.parent as IWindowContainer;
         if(messageListener != null)
         {
            messageListener.processWidgetMessage(_loc2_);
         }
         if(this.var_43 != null)
         {
            this._mainContainer.removeChild(this.var_43.window);
            this.var_43.dispose();
            this.var_43 = null;
         }
         this.var_440 = false;
         this._eventDispatcher.dispatchEvent(new Event(HabboMeMenuTrackingEvent.HABBO_MEMENU_TRACKING_EVENT_CLOSE));
      }
      
      private function show() : void
      {
         if(!this._mainContainer || !this._mainContainer.parent)
         {
            return;
         }
         this.changeView(const_114);
         var _loc1_:RoomWidgetToolbarMessage = new RoomWidgetToolbarMessage(RoomWidgetToolbarMessage.const_740);
         _loc1_.window = this._mainContainer.parent as IWindowContainer;
         if(messageListener != null)
         {
            messageListener.processWidgetMessage(_loc1_);
         }
         this.var_440 = true;
      }
      
      private function onUserInfo(param1:RoomWidgetUserInfoUpdateEvent) : void
      {
         var _loc2_:* = null;
         if(!(this.var_440 && this.var_43.window.name == const_322))
         {
            _loc2_ = new RoomWidgetRequestWidgetMessage(RoomWidgetRequestWidgetMessage.const_933);
            if(messageListener != null)
            {
               if(!this.var_1776)
               {
                  messageListener.processWidgetMessage(_loc2_);
               }
            }
         }
      }
      
      private function onSettingsUpdate(param1:RoomWidgetSettingsUpdateEvent) : void
      {
         if(!this.var_440)
         {
            return;
         }
         if(this.var_43.window.name == const_733)
         {
            (this.var_43 as MeMenuSoundSettingsView).updateSettings(param1);
         }
      }
      
      private function onTutorialEvent(param1:RoomWidgetTutorialEvent) : void
      {
         switch(param1.type)
         {
            case RoomWidgetTutorialEvent.const_517:
               Logger.log("* MeMenuWidget: onHighlightClothesIcon " + this.var_440 + " view: " + this.var_43.window.name);
               if(this.var_440 != true || this.var_43.window.name != const_114)
               {
                  return;
               }
               (this.var_43 as MeMenuMainView).setIconAssets("clothes_icon",const_114,"clothes_highlighter_blue");
               break;
            case RoomWidgetTutorialEvent.const_116:
               this.hide();
         }
      }
      
      private function onToolbarClicked(param1:RoomWidgetToolbarClickedUpdateEvent) : void
      {
         switch(param1.iconType)
         {
            case RoomWidgetToolbarClickedUpdateEvent.ICON_TYPE_ME_MENU:
               this.var_440 = !this.var_440;
               break;
            case RoomWidgetToolbarClickedUpdateEvent.ICON_TYPE_ROOM_INFO:
               this.var_440 = false;
               break;
            default:
               return;
         }
         if(this.var_440)
         {
            this.show();
         }
         else
         {
            this.hide();
         }
      }
      
      private function onUpdateEffects(param1:RoomWidgetUpdateEffectsUpdateEvent) : void
      {
         var _loc2_:* = null;
         this.var_1169 = false;
         for each(_loc2_ in param1.effects)
         {
            if(_loc2_.isInUse)
            {
               this.var_1169 = true;
            }
         }
         if(this.var_43 != null && this.var_43.window.name == const_785)
         {
            (this.var_43 as MeMenuEffectsView).updateEffects(param1.effects);
         }
      }
      
      private function onAvatarDeselected(param1:Event) : void
      {
         if(this.var_43 != null && this.var_43.window.name != const_322)
         {
            this.hide();
         }
      }
      
      private function onAvatarEditorClosed(param1:RoomWidgetAvatarEditorUpdateEvent) : void
      {
         if(this.var_43 != null && this.var_43.window.name == const_322)
         {
            this.changeView(const_114);
         }
      }
      
      private function onHideAvatarEditor(param1:RoomWidgetAvatarEditorUpdateEvent) : void
      {
         if(this.var_43 != null && this.var_43.window.name == const_322)
         {
            this.changeView(const_114);
         }
      }
      
      private function onWaveEvent(param1:RoomWidgetWaveUpdateEvent) : void
      {
         Logger.log("[MeMenuWidget] Wave Event received");
      }
      
      private function onDanceEvent(param1:RoomWidgetDanceUpdateEvent) : void
      {
         Logger.log("[MeMenuWidget] Dance Event received, style: " + param1.style);
      }
      
      private function onHabboClubEvent(param1:RoomWidgetHabboClubUpdateEvent) : void
      {
         var _loc2_:* = param1.daysLeft != this.var_1450;
         this.var_1450 = param1.daysLeft;
         this.var_2499 = param1.periodsLeft;
         this.var_2503 = param1.pastPeriods;
         this.var_2498 = param1.allowClubDances;
         _loc2_ = Boolean(_loc2_ || param1.clubLevel != this.var_1792);
         this.var_1792 = param1.clubLevel;
         if(_loc2_)
         {
            if(this.var_43 != null)
            {
               this.changeView(this.var_43.window.name);
            }
         }
      }
      
      private function onAvatarActionEvent(param1:RoomWidgetAvatarActionUpdateEvent) : void
      {
         switch(param1.actionType)
         {
            case RoomWidgetAvatarActionUpdateEvent.EFFECT_ACTIVE:
               this.var_1169 = true;
               break;
            case RoomWidgetAvatarActionUpdateEvent.EFFECT_INACTIVE:
               this.var_1169 = false;
         }
      }
      
      private function onCreditBalance(param1:RoomWidgetPurseUpdateEvent) : void
      {
         if(param1 == null)
         {
            return;
         }
         this.var_1791 = param1.balance;
         localizations.registerParameter("widget.memenu.credits","credits",this.var_1791.toString());
      }
      
      private function onNormalMode(param1:RoomWidgetRoomEngineUpdateEvent) : void
      {
         this.var_1776 = false;
      }
      
      private function onGameMode(param1:RoomWidgetRoomEngineUpdateEvent) : void
      {
         this.var_1776 = true;
      }
      
      public function get mainContainer() : IWindowContainer
      {
         if(this._mainContainer == null)
         {
            this._mainContainer = windowManager.createWindow("me_menu_main_container","",HabboWindowType.const_1719,HabboWindowStyle.const_1197,HabboWindowParam.const_43,new Rectangle(0,0,170,260)) as IWindowContainer;
            this._mainContainer.tags.push("room_widget_me_menu");
         }
         return this._mainContainer;
      }
      
      public function changeView(param1:String) : void
      {
         var _loc2_:* = null;
         switch(param1)
         {
            case const_114:
               _loc2_ = new MeMenuMainView();
               this._eventDispatcher.dispatchEvent(new Event(HabboMeMenuTrackingEvent.HABBO_MEMENU_TRACKING_EVENT_DEFAULT));
               break;
            case const_785:
               _loc2_ = new MeMenuEffectsView();
               this._eventDispatcher.dispatchEvent(new Event(HabboMeMenuTrackingEvent.HABBO_MEMENU_TRACKING_EVENT_EFFECTS));
               break;
            case const_1239:
               _loc2_ = new MeMenuDanceView();
               this._eventDispatcher.dispatchEvent(new Event(HabboMeMenuTrackingEvent.HABBO_MEMENU_TRACKING_EVENT_DANCE));
               break;
            case const_322:
               _loc2_ = new MeMenuClothesView();
               break;
            case const_1599:
               _loc2_ = new MeMenuRoomsView();
               break;
            case const_853:
               _loc2_ = new MeMenuSettingsMenuView();
               break;
            case const_733:
               _loc2_ = new MeMenuSoundSettingsView();
               break;
            default:
               Logger.log("Me Menu Change view: unknown view: " + param1);
         }
         if(_loc2_ != null)
         {
            if(this.var_43 != null)
            {
               this._mainContainer.removeChild(this.var_43.window);
               this.var_43.dispose();
               this.var_43 = null;
            }
            this.var_43 = _loc2_;
            this.var_43.init(this,param1);
         }
         this.updateSize();
      }
      
      public function updateSize() : void
      {
         if(this.var_43 != null)
         {
            this.var_1170.x = this.var_43.window.width + 10;
            this.var_1170.y = this.var_43.window.height;
            this.var_43.window.x = 5;
            this.var_43.window.y = 0;
            this._mainContainer.width = this.var_1170.x;
            this._mainContainer.height = this.var_1170.y;
         }
      }
      
      public function get allowHabboClubDances() : Boolean
      {
         return this.var_2498;
      }
      
      public function get isHabboClubActive() : Boolean
      {
         return this.var_1450 > 0;
      }
      
      public function get habboClubDays() : int
      {
         return this.var_1450;
      }
      
      public function get habboClubPeriods() : int
      {
         return this.var_2499;
      }
      
      public function get habboClubPastPeriods() : int
      {
         return this.var_2503;
      }
      
      public function get habboClubLevel() : int
      {
         return this.var_1792;
      }
      
      public function get isNewsEnabled() : Boolean
      {
         return this.var_2501;
      }
      
      public function get creditBalance() : int
      {
         return this.var_1791;
      }
      
      public function get config() : IHabboConfigurationManager
      {
         return this._config;
      }
      
      public function changeToOutfit(param1:int) : void
      {
         this.var_2502 = getTimer();
         this.messageListener.processWidgetMessage(new RoomWidgetSelectOutfitMessage(param1));
      }
      
      public function canChangeOutfit() : Boolean
      {
         var _loc1_:Number = getTimer();
         return _loc1_ - this.var_2502 > const_1338;
      }
      
      public function get hasEffectOn() : Boolean
      {
         return this.var_1169;
      }
      
      public function get isDancing() : Boolean
      {
         return this.var_2500;
      }
      
      public function set isDancing(param1:Boolean) : void
      {
         this.var_2500 = param1;
      }
   }
}

package com.sulake.habbo.help
{
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.communication.messages.IMessageComposer;
   import com.sulake.core.runtime.Component;
   import com.sulake.core.runtime.IContext;
   import com.sulake.core.runtime.IID;
   import com.sulake.core.runtime.IUnknown;
   import com.sulake.habbo.communication.IHabboCommunicationManager;
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   import com.sulake.habbo.help.cfh.data.CallForHelpData;
   import com.sulake.habbo.help.cfh.data.UserRegistry;
   import com.sulake.habbo.help.enum.HabboHelpViewEnum;
   import com.sulake.habbo.help.help.HelpUI;
   import com.sulake.habbo.help.help.data.FaqIndex;
   import com.sulake.habbo.help.hotelmerge.HotelMergeUI;
   import com.sulake.habbo.help.tutorial.TutorialUI;
   import com.sulake.habbo.localization.IHabboLocalizationManager;
   import com.sulake.habbo.session.IRoomSessionManager;
   import com.sulake.habbo.session.ISessionDataManager;
   import com.sulake.habbo.session.events.RoomSessionEvent;
   import com.sulake.habbo.toolbar.HabboToolbarIconEnum;
   import com.sulake.habbo.toolbar.IHabboToolbar;
   import com.sulake.habbo.toolbar.events.HabboToolbarEvent;
   import com.sulake.habbo.toolbar.events.HabboToolbarSetIconEvent;
   import com.sulake.habbo.window.IHabboWindowManager;
   import com.sulake.iid.IIDHabboCommunicationManager;
   import com.sulake.iid.IIDHabboConfigurationManager;
   import com.sulake.iid.IIDHabboLocalizationManager;
   import com.sulake.iid.IIDHabboRoomSessionManager;
   import com.sulake.iid.IIDHabboToolbar;
   import com.sulake.iid.IIDSessionDataManager;
   import flash.utils.Dictionary;
   import iid.IIDHabboWindowManager;
   
   public class HabboHelp extends Component implements IHabboHelp
   {
       
      
      private var var_181:IHabboToolbar;
      
      private var _assetLibrary:IAssetLibrary;
      
      private var _windowManager:IHabboWindowManager;
      
      private var var_316:IHabboCommunicationManager;
      
      private var var_1044:IHabboLocalizationManager;
      
      private var var_840:IHabboConfigurationManager;
      
      private var var_289:ISessionDataManager;
      
      private var var_1290:FaqIndex;
      
      private var var_1366:IncomingMessages;
      
      private var var_66:HelpUI;
      
      private var var_110:TutorialUI;
      
      private var var_841:HotelMergeUI;
      
      private var var_1563:CallForHelpData;
      
      private var var_2837:UserRegistry;
      
      private var var_2838:String = "";
      
      private var var_681:WelcomeScreenController;
      
      public function HabboHelp(param1:IContext, param2:uint = 0, param3:IAssetLibrary = null)
      {
         this.var_1563 = new CallForHelpData();
         this.var_2837 = new UserRegistry();
         super(param1,param2,param3);
         this._assetLibrary = param3;
         this.var_1290 = new FaqIndex();
         queueInterface(new IIDHabboWindowManager(),this.onWindowManagerReady);
         queueInterface(new IIDSessionDataManager(),this.onSessionDataManagerReady);
      }
      
      public function set ownUserName(param1:String) : void
      {
         this.var_2838 = param1;
      }
      
      public function get ownUserName() : String
      {
         return this.var_2838;
      }
      
      public function get callForHelpData() : CallForHelpData
      {
         return this.var_1563;
      }
      
      public function get userRegistry() : UserRegistry
      {
         return this.var_2837;
      }
      
      public function get localization() : IHabboLocalizationManager
      {
         return this.var_1044;
      }
      
      public function get windowManager() : IHabboWindowManager
      {
         return this._windowManager;
      }
      
      public function get toolbar() : IHabboToolbar
      {
         return this.var_181;
      }
      
      public function get sessionDataManager() : ISessionDataManager
      {
         return this.var_289;
      }
      
      public function get tutorialUI() : TutorialUI
      {
         return this.var_110;
      }
      
      public function get hotelMergeUI() : HotelMergeUI
      {
         return this.var_841;
      }
      
      public function hasChangedName() : Boolean
      {
         if(this.var_110)
         {
            return this.var_110.hasChangedName;
         }
         return true;
      }
      
      override public function dispose() : void
      {
         if(this.var_66 != null)
         {
            this.var_66.dispose();
            this.var_66 = null;
         }
         if(this.var_110 != null)
         {
            this.var_110.dispose();
            this.var_110 = null;
         }
         if(this.var_841)
         {
            this.var_841.dispose();
            this.var_841 = null;
         }
         if(this.var_1290 != null)
         {
            this.var_1290.dispose();
            this.var_1290 = null;
         }
         this.var_1366 = null;
         if(this.var_181)
         {
            this.var_181.release(new IIDHabboToolbar());
            this.var_181 = null;
         }
         if(this.var_1044)
         {
            this.var_1044.release(new IIDHabboLocalizationManager());
            this.var_1044 = null;
         }
         if(this.var_316)
         {
            this.var_316.release(new IIDHabboCommunicationManager());
            this.var_316 = null;
         }
         if(this.var_840)
         {
            this.var_840.release(new IIDHabboConfigurationManager());
            this.var_840 = null;
         }
         if(this._windowManager)
         {
            this._windowManager.release(new IIDHabboWindowManager());
            this._windowManager = null;
         }
         if(this.var_289 != null)
         {
            this.var_289.release(new IIDSessionDataManager());
            this.var_289 = null;
         }
         if(this.var_681 != null)
         {
            this.var_681.dispose();
            this.var_681 = null;
         }
         super.dispose();
      }
      
      public function showUI(param1:String = null) : void
      {
         if(this.var_66 != null)
         {
            this.var_66.showUI(param1);
         }
      }
      
      public function hideUI() : void
      {
         if(this.var_66 != null)
         {
            this.var_66.hideUI();
         }
      }
      
      public function tellUI(param1:String, param2:* = null) : void
      {
         if(this.var_66 != null)
         {
            this.var_66.tellUI(param1,param2);
         }
      }
      
      public function enableCallForGuideBotUI() : void
      {
         if(this.var_66 != null)
         {
            this.var_66.updateCallForGuideBotUI(true);
         }
      }
      
      public function disableCallForGuideBotUI() : void
      {
         if(this.var_66 != null)
         {
            this.var_66.updateCallForGuideBotUI(false);
         }
      }
      
      public function getFaq() : FaqIndex
      {
         return this.var_1290;
      }
      
      public function sendMessage(param1:IMessageComposer) : void
      {
         if(this.var_316 != null && param1 != null)
         {
            this.var_316.getHabboMainConnection(null).send(param1);
         }
      }
      
      public function getConfigurationKey(param1:String, param2:String = null, param3:Dictionary = null) : String
      {
         if(this.var_840 == null)
         {
            return param1;
         }
         return this.var_840.getKey(param1,param2,param3);
      }
      
      public function showCallForHelpReply(param1:String) : void
      {
         if(this.var_66 != null)
         {
            this.var_66.showCallForHelpReply(param1);
         }
      }
      
      public function showCallForHelpResult(param1:String) : void
      {
         if(this.var_66 != null)
         {
            this.var_66.showCallForHelpResult(param1);
         }
      }
      
      public function reportUser(param1:int, param2:String) : void
      {
         this.var_1563.reportedUserId = param1;
         this.var_1563.reportedUserName = param2;
         this.var_66.showUI(HabboHelpViewEnum.const_376);
      }
      
      private function toggleHelpUI() : void
      {
         if(this.var_66 == null)
         {
            if(!this.createHelpUI())
            {
               return;
            }
         }
         this.var_66.toggleUI();
      }
      
      private function createHelpUI() : Boolean
      {
         if(this.var_66 == null && this._assetLibrary != null && this._windowManager != null)
         {
            this.var_66 = new HelpUI(this,this._assetLibrary,this._windowManager,this.var_1044,this.var_181);
         }
         return this.var_66 != null;
      }
      
      private function createTutorialUI() : Boolean
      {
         var _loc1_:* = false;
         if(this.var_110 == null && this._assetLibrary != null && this._windowManager != null)
         {
            _loc1_ = this.getConfigurationKey("avatar.widget.enabled","0") == "0";
            this.var_110 = new TutorialUI(this,_loc1_);
         }
         return this.var_110 != null;
      }
      
      public function removeTutorialUI() : void
      {
         if(this.var_110 != null)
         {
            this.var_110.dispose();
            this.var_110 = null;
         }
      }
      
      public function initHotelMergeUI() : void
      {
         if(!this.var_841)
         {
            this.var_841 = new HotelMergeUI(this);
         }
         this.var_841.startNameChange();
      }
      
      public function updateTutorial(param1:Boolean, param2:Boolean, param3:Boolean) : void
      {
         if(param1 && param2 && param3)
         {
            this.removeTutorialUI();
            return;
         }
         if(this.var_110 == null)
         {
            if(!this.createTutorialUI())
            {
               return;
            }
         }
         this.var_110.update(param1,param2,param3);
      }
      
      public function startNameChange() : void
      {
         if(this.var_110)
         {
            this.var_110.showView(TutorialUI.const_292);
         }
      }
      
      private function onWindowManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         this._windowManager = IHabboWindowManager(param2);
         queueInterface(new IIDHabboCommunicationManager(),this.onCommunicationManagerReady);
      }
      
      private function onCommunicationManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         this.var_316 = IHabboCommunicationManager(param2);
         this.var_1366 = new IncomingMessages(this,this.var_316);
         queueInterface(new IIDHabboToolbar(),this.onToolbarReady);
      }
      
      private function onToolbarReady(param1:IID = null, param2:IUnknown = null) : void
      {
         this.var_181 = IHabboToolbar(param2);
         queueInterface(new IIDHabboLocalizationManager(),this.onLocalizationManagerReady);
      }
      
      private function onLocalizationManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         this.var_1044 = IHabboLocalizationManager(param2);
         queueInterface(new IIDHabboConfigurationManager(),this.onConfigurationManagerReady);
      }
      
      private function onConfigurationManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         this.var_840 = IHabboConfigurationManager(param2);
         queueInterface(new IIDHabboRoomSessionManager(),this.onRoomSessionManagerReady);
      }
      
      private function onRoomSessionManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         var _loc3_:IRoomSessionManager = IRoomSessionManager(param2);
         _loc3_.events.addEventListener(RoomSessionEvent.const_85,this.onRoomSessionEvent);
         _loc3_.events.addEventListener(RoomSessionEvent.const_92,this.onRoomSessionEvent);
         this.var_181.events.addEventListener(HabboToolbarEvent.const_69,this.onHabboToolbarEvent);
         this.var_181.events.addEventListener(HabboToolbarEvent.const_39,this.onHabboToolbarEvent);
         this.createHelpUI();
         this.setHabboToolbarIcon();
      }
      
      private function onSessionDataManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(disposed)
         {
            return;
         }
         this.var_289 = param2 as ISessionDataManager;
      }
      
      private function onRoomSessionEvent(param1:RoomSessionEvent) : void
      {
         switch(param1.type)
         {
            case RoomSessionEvent.const_85:
               if(this.var_66 != null)
               {
                  this.var_66.setRoomSessionStatus(true);
               }
               if(this.var_110 != null)
               {
                  this.var_110.setRoomSessionStatus(true);
               }
               this.showWelcomeScreen(true);
               break;
            case RoomSessionEvent.const_92:
               if(this.var_66 != null)
               {
                  this.var_66.setRoomSessionStatus(false);
               }
               if(this.var_110 != null)
               {
                  this.var_110.setRoomSessionStatus(false);
               }
               this.userRegistry.unregisterRoom();
               this.showWelcomeScreen(false);
         }
      }
      
      private function showWelcomeScreen(param1:Boolean) : void
      {
         if(!this.var_681)
         {
            this.var_681 = new WelcomeScreenController(this,this._windowManager,this.var_840);
         }
         this.var_681.showWelcomeScreen(param1);
      }
      
      private function setHabboToolbarIcon() : void
      {
         if(this.var_181 != null)
         {
            this.var_181.events.dispatchEvent(new HabboToolbarSetIconEvent(HabboToolbarSetIconEvent.const_136,HabboToolbarIconEnum.HELP));
         }
      }
      
      private function onHabboToolbarEvent(param1:HabboToolbarEvent) : void
      {
         if(param1.type == HabboToolbarEvent.const_69)
         {
            this.setHabboToolbarIcon();
            return;
         }
         if(param1.type == HabboToolbarEvent.const_39)
         {
            if(param1.iconId == HabboToolbarIconEnum.HELP)
            {
               this.toggleHelpUI();
               return;
            }
         }
      }
      
      public function setWelcomeNotifications(param1:Array) : void
      {
         if(!this.var_681)
         {
            this.showWelcomeScreen(true);
         }
         this.var_681.notifications = param1;
      }
   }
}

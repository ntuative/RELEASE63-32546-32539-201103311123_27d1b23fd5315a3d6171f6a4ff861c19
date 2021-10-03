package com.sulake.habbo.friendbar.view
{
   import com.sulake.core.assets.IAsset;
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.runtime.Component;
   import com.sulake.core.runtime.IID;
   import com.sulake.core.runtime.IUnknown;
   import com.sulake.core.utils.Map;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.core.window.components.IItemListWindow;
   import com.sulake.core.window.enum.WindowParam;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.avatar.IAvatarImage;
   import com.sulake.habbo.avatar.IAvatarImageListener;
   import com.sulake.habbo.avatar.IAvatarRenderManager;
   import com.sulake.habbo.avatar.enum.AvatarScaleType;
   import com.sulake.habbo.avatar.enum.AvatarSetType;
   import com.sulake.habbo.friendbar.HabboFriendBar;
   import com.sulake.habbo.friendbar.data.IFriendEntity;
   import com.sulake.habbo.friendbar.data.IHabboFriendBarData;
   import com.sulake.habbo.friendbar.events.FindFriendsNotificationEvent;
   import com.sulake.habbo.friendbar.events.FriendBarUpdateEvent;
   import com.sulake.habbo.friendbar.iid.IIDHabboFriendBarData;
   import com.sulake.habbo.friendbar.view.utils.AddFriendsEntityTab;
   import com.sulake.habbo.friendbar.view.utils.FriendEntityTab;
   import com.sulake.habbo.friendbar.view.utils.ITab;
   import com.sulake.habbo.friendbar.view.utils.Tab;
   import com.sulake.habbo.friendbar.view.utils.TextCropper;
   import com.sulake.habbo.window.IHabboWindowManager;
   import com.sulake.habbo.window.enum.HabboAlertDialogFlag;
   import com.sulake.habbo.window.utils.IAlertDialog;
   import com.sulake.iid.IIDAvatarRenderManager;
   import flash.display.BitmapData;
   import flash.events.Event;
   import iid.IIDHabboWindowManager;
   
   public class HabboFriendBarView extends Component implements IHabboFriendBarView, IAvatarImageListener
   {
      
      private static const const_427:int = 127;
      
      private static const const_1767:int = 40;
      
      private static const const_961:int = -1;
      
      private static const const_278:int = 1;
      
      private static const const_1299:int = -4;
      
      private static const const_610:int = 80;
      
      private static const const_1304:Boolean = false;
      
      private static const const_1301:String = "bar_xml";
      
      private static const const_1308:String = "toggle_xml";
      
      private static const const_279:String = "list";
      
      private static const const_1101:String = "header";
      
      private static const const_618:String = "canvas";
      
      private static const const_959:String = "button_left";
      
      private static const const_960:String = "button_right";
      
      private static const const_1307:String = "button_left_page";
      
      private static const const_1303:String = "button_right_page";
      
      private static const const_1306:String = "button_left_end";
      
      private static const const_1300:String = "button_right_end";
      
      private static const const_1305:String = "button_close";
      
      private static const const_1302:String = "button_open";
       
      
      private var _windowManager:IHabboWindowManager;
      
      private var var_1094:IAvatarRenderManager;
      
      private var var_115:IHabboFriendBarData;
      
      private var var_30:IWindowContainer;
      
      private var var_199:IWindowContainer;
      
      private var var_345:Vector.<Tab>;
      
      private var var_1092:Map;
      
      private var _startIndex:int = 0;
      
      private var var_1095:ITab;
      
      private var var_1093:int = -1;
      
      private var var_1367:TextCropper;
      
      private var _findFriendsEnabled:Boolean = false;
      
      public function HabboFriendBarView(param1:HabboFriendBar, param2:uint, param3:IAssetLibrary)
      {
         super(param1,param2,param3);
         this.var_1367 = new TextCropper();
         this.var_1092 = new Map();
         this.var_345 = new Vector.<Tab>();
         if(param1 is HabboFriendBar)
         {
            this._findFriendsEnabled = HabboFriendBar(param1).findFriendsEnabled;
         }
         queueInterface(new IIDAvatarRenderManager(),this.onAvatarRendererAvailable);
         queueInterface(new IIDHabboWindowManager(),this.onWindowManagerAvailable);
         queueInterface(new IIDHabboFriendBarData(),this.onFriendBarDataAvailable);
      }
      
      override public function dispose() : void
      {
         if(!disposed)
         {
            this._windowManager.getWindowContext(const_278).getDesktopWindow().removeEventListener(WindowEvent.const_49,this.onDesktopResized);
            if(this.var_199)
            {
               this.var_199.dispose();
               this.var_199 = null;
            }
            if(this.var_30)
            {
               this.var_30.dispose();
               this.var_30 = null;
            }
            while(this.var_1092.length > 0)
            {
               try
               {
                  BitmapData(this.var_1092.remove(this.var_1092.getKey(0))).dispose();
               }
               catch(e:Error)
               {
               }
            }
            while(this.var_345.length > 0)
            {
               ITab(this.var_345.pop()).dispose();
            }
            if(this.var_115)
            {
               this.var_115.events.removeEventListener(FriendBarUpdateEvent.const_509,this.onRefreshView);
               this.var_115 = null;
               release(new IIDHabboFriendBarData());
            }
            if(this._windowManager)
            {
               this._windowManager = null;
               release(new IIDHabboWindowManager());
            }
            if(this.var_1094)
            {
               this.var_1094 = null;
               release(new IIDAvatarRenderManager());
            }
            this.var_1367.dispose();
            this.var_1367 = null;
            super.dispose();
         }
      }
      
      public function set visible(param1:Boolean) : void
      {
         if(this.var_30)
         {
            this.var_30.visible = param1;
            this.var_30.activate();
         }
         if(this.var_199)
         {
            this.var_199.visible = !param1;
            if(this.var_30)
            {
               this.var_199.x = this.var_30.x;
               this.var_199.y = this.var_30.y;
               this.var_199.activate();
            }
         }
      }
      
      public function get visible() : Boolean
      {
         return this.var_30 && this.var_30.visible;
      }
      
      public function populate() : void
      {
         var _loc3_:int = 0;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc7_:* = null;
         var _loc1_:IItemListWindow = this.var_30.findChildByName(const_279) as IItemListWindow;
         _loc1_.autoArrangeItems = false;
         var _loc2_:int = _loc1_.numListItems;
         _loc3_ = _loc2_;
         while(_loc3_ > 0)
         {
            _loc1_.removeListItemAt(_loc3_ - 1);
            _loc3_--;
         }
         while(this.var_345.length > 0)
         {
            this.var_345.pop().recycle();
         }
         this.var_1095 = null;
         _loc2_ = Math.min(this.numTabsVisibleAtCurrentSize,this.var_115.numFriends);
         this.visible = _loc2_ > 0 || this._findFriendsEnabled;
         if(this._startIndex + _loc2_ > this.var_115.numFriends)
         {
            this._startIndex = Math.max(0,this._startIndex - (this._startIndex + _loc2_ - this.var_115.numFriends));
         }
         _loc3_ = 0;
         while(_loc3_ < _loc2_)
         {
            _loc4_ = this.var_115.getFriendAt(_loc3_ + this._startIndex);
            _loc5_ = FriendEntityTab.allocate(_loc4_);
            this.var_345.push(_loc5_);
            if(_loc4_.id == this.var_1093)
            {
               _loc6_ = _loc4_;
            }
            _loc1_.addListItem(_loc5_.window);
            _loc3_++;
         }
         if(this._findFriendsEnabled)
         {
            if(this.maxNumOfTabsVisible > _loc2_ || _loc2_ == 0)
            {
               _loc7_ = new AddFriendsEntityTab();
               _loc1_.addListItem(_loc7_.window);
               this.var_345.push(_loc7_);
            }
         }
         _loc1_.autoArrangeItems = true;
         this.deSelect();
         if(_loc6_)
         {
            this.selectFriendEntity(_loc6_);
         }
         this.toggleArrowButtons(this.numTabsVisibleAtCurrentSize < this.var_115.numFriends);
      }
      
      private function getFriendEntityTabByID(param1:int) : FriendEntityTab
      {
         var _loc2_:* = null;
         var _loc3_:int = this.var_345.length;
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            _loc2_ = this.var_345[_loc4_] as FriendEntityTab;
            if(_loc2_)
            {
               if(_loc2_.friend.id == param1)
               {
                  return _loc2_;
               }
            }
            _loc4_++;
         }
         return null;
      }
      
      private function getEntityTabByWindow(param1:IWindow) : ITab
      {
         var _loc2_:* = null;
         var _loc3_:int = this.var_345.length;
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            _loc2_ = this.var_345[_loc4_];
            if(_loc2_.window == param1)
            {
               return _loc2_;
            }
            _loc4_++;
         }
         return null;
      }
      
      private function onFriendBarDataAvailable(param1:IID, param2:IUnknown) : void
      {
         this.var_115 = param2 as IHabboFriendBarData;
         this.var_115.events.addEventListener(FriendBarUpdateEvent.const_509,this.onRefreshView);
         this.var_115.events.addEventListener(FindFriendsNotificationEvent.TYPE,this.onFindFriendsNotification);
      }
      
      private function onWindowManagerAvailable(param1:IID, param2:IUnknown) : void
      {
         this._windowManager = param2 as IHabboWindowManager;
      }
      
      private function isUserInterfaceReady() : Boolean
      {
         return this.var_30 && !this.var_30.disposed;
      }
      
      private function buildUserInterface() : void
      {
         Tab.var_1048 = this.var_115;
         Tab.var_1049 = this;
         Tab.var_849 = assets;
         Tab.var_1298 = this._windowManager;
         Tab.var_2061 = this.var_1367;
         var _loc1_:IAsset = assets.getAssetByName(const_1301);
         this.var_30 = this._windowManager.buildFromXML(_loc1_.content as XML,const_278) as IWindowContainer;
         if(const_961 > 0)
         {
            this.var_30.width = const_961;
         }
         else
         {
            this.var_30.width = this.calculateWidthForBar();
         }
         this.var_30.x = this.var_30.parent.width / 2 - this.var_30.width / 2;
         this.var_30.y = this.var_30.parent.height - (this.var_30.height + const_1299);
         this.var_30.setParamFlag(WindowParam.const_249,true);
         this.var_30.procedure = this.barWindowEventProc;
         if(const_1304)
         {
            _loc1_ = assets.getAssetByName(const_1308);
            this.var_199 = this._windowManager.buildFromXML(_loc1_.content as XML,const_278) as IWindowContainer;
            this.var_199.x = this.var_30.x;
            this.var_199.y = this.var_30.y;
            this.var_199.setParamFlag(WindowParam.const_249,true);
            this.var_199.visible = false;
            this.var_199.procedure = this.toggleWindowEventProc;
         }
         this.visible = true;
         this._windowManager.getWindowContext(const_278).getDesktopWindow().addEventListener(WindowEvent.const_49,this.onDesktopResized);
      }
      
      private function onAvatarRendererAvailable(param1:IID, param2:IUnknown) : void
      {
         this.var_1094 = param2 as IAvatarRenderManager;
      }
      
      public function getAvatarFaceBitmap(param1:String) : BitmapData
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         if(!_loc2_)
         {
            if(this.var_1094)
            {
               _loc3_ = this.var_1094.createAvatarImage(param1,AvatarScaleType.const_53,null,this);
               if(_loc3_)
               {
                  _loc2_ = _loc3_.getCroppedImage(AvatarSetType.const_52);
                  _loc3_.dispose();
               }
            }
         }
         return _loc2_;
      }
      
      public function avatarImageReady(param1:String) : void
      {
         var _loc2_:* = null;
         var _loc6_:* = null;
         var _loc7_:* = null;
         var _loc8_:* = null;
         var _loc9_:* = null;
         var _loc10_:* = null;
         var _loc3_:IItemListWindow = this.var_30.findChildByName(const_279) as IItemListWindow;
         var _loc4_:int = this.var_115.numFriends;
         var _loc5_:int = 0;
         while(_loc5_ < _loc4_)
         {
            _loc2_ = this.var_115.getFriendAt(_loc5_);
            if(_loc2_.figure == param1)
            {
               _loc6_ = this.getAvatarFaceBitmap(_loc2_.figure);
               if(_loc6_)
               {
                  this.var_1092[_loc2_.figure] = _loc6_;
                  _loc7_ = _loc3_.getListItemByID(_loc2_.id) as IWindowContainer;
                  if(_loc7_)
                  {
                     _loc8_ = _loc7_.getChildByName(const_279) as IItemListWindow;
                     if(_loc8_)
                     {
                        _loc9_ = IWindowContainer(_loc8_.getListItemByName(const_1101));
                        if(_loc9_)
                        {
                           _loc10_ = _loc9_.findChildByName(const_618) as IBitmapWrapperWindow;
                           _loc10_.bitmap = _loc6_.clone();
                           _loc10_.width = _loc6_.width;
                           _loc10_.height = _loc6_.height;
                        }
                     }
                  }
               }
            }
            _loc5_++;
         }
      }
      
      public function faceBookImageReady(param1:BitmapData) : void
      {
      }
      
      private function isFriendSelected(param1:IFriendEntity) : Boolean
      {
         return this.var_1093 == param1.id;
      }
      
      public function selectTab(param1:ITab) : void
      {
         if(!param1.selected)
         {
            if(this.var_1095)
            {
               this.deSelect();
            }
            param1.select();
            this.var_1095 = param1;
         }
      }
      
      public function selectFriendEntity(param1:IFriendEntity) : void
      {
         if(this.var_1093 == param1.id)
         {
            return;
         }
         var _loc2_:FriendEntityTab = this.getFriendEntityTabByID(param1.id);
         if(_loc2_)
         {
            this.selectTab(_loc2_);
            this.var_1093 = param1.id;
         }
      }
      
      public function deSelect() : void
      {
         if(this.var_1095)
         {
            this.var_1095.deselect();
            this.var_1093 = -1;
         }
      }
      
      private function onRefreshView(param1:Event) : void
      {
         if(!this.isUserInterfaceReady())
         {
            this.buildUserInterface();
         }
         this.resizeAndPopulate(true);
      }
      
      private function onFindFriendsNotification(param1:FindFriendsNotificationEvent) : void
      {
         var event:FindFriendsNotificationEvent = param1;
         var title:String = !!event.success ? "${friendbar.find.success.title}" : "${friendbar.find.error.title}";
         var text:String = !!event.success ? "${friendbar.find.success.text}" : "${friendbar.find.error.text}";
         this._windowManager.notify(title,text,function(param1:IAlertDialog, param2:Event):void
         {
            param1.dispose();
         },HabboAlertDialogFlag.const_560);
      }
      
      private function barWindowEventProc(param1:WindowEvent, param2:IWindow) : void
      {
         var _loc3_:int = 0;
         if(param1.type == WindowMouseEvent.const_41)
         {
            _loc3_ = this._startIndex;
            switch(param2.name)
            {
               case const_959:
                  _loc3_ = Math.max(0,this._startIndex - 1);
                  break;
               case const_1307:
                  _loc3_ = Math.max(0,this._startIndex - this.numTabsVisibleAtCurrentSize);
                  break;
               case const_1306:
                  _loc3_ = 0;
                  break;
               case const_960:
                  _loc3_ = Math.max(0,Math.min(this.var_115.numFriends - this.numTabsVisibleAtCurrentSize,this._startIndex + 1));
                  break;
               case const_1303:
                  _loc3_ = Math.max(0,Math.min(this.var_115.numFriends - this.numTabsVisibleAtCurrentSize,this._startIndex + this.numTabsVisibleAtCurrentSize));
                  break;
               case const_1300:
                  _loc3_ = Math.max(0,this.var_115.numFriends - this.numTabsVisibleAtCurrentSize);
                  break;
               case const_1305:
                  this.visible = false;
            }
            if(_loc3_ != this._startIndex)
            {
               this.deSelect();
               this._startIndex = _loc3_;
               this.resizeAndPopulate(true);
            }
         }
         if(param1.type == WindowEvent.const_602)
         {
            this.deSelect();
         }
      }
      
      private function toggleWindowEventProc(param1:WindowEvent, param2:IWindow) : void
      {
         if(this.var_199.visible)
         {
            if(param1.type == WindowMouseEvent.const_41)
            {
               switch(param2.name)
               {
                  case const_1302:
                     this.visible = true;
               }
            }
         }
      }
      
      private function toggleArrowButtons(param1:Boolean) : void
      {
         this.var_30.findChildByName(const_960).visible = param1;
         this.var_30.findChildByName(const_959).visible = param1;
      }
      
      private function resizeAndPopulate(param1:Boolean = false) : void
      {
         var _loc2_:int = 0;
         if(!disposed)
         {
            if(this.var_30)
            {
               _loc2_ = this.numTabsVisibleAtCurrentSize;
               this.var_30.width = this.calculateWidthForBar();
               this.var_30.x = Math.max(this.var_30.parent.width / 2 - this.var_30.width / 2,const_610);
               if(_loc2_ != this.numTabsVisibleAtCurrentSize || param1)
               {
                  this.populate();
               }
            }
         }
      }
      
      private function get numTabsVisibleAtCurrentSize() : int
      {
         var _loc1_:IItemListWindow = this.var_30.findChildByName(const_279) as IItemListWindow;
         return _loc1_.width / (const_427 + _loc1_.spacing);
      }
      
      private function get maxNumOfTabsVisible() : int
      {
         var _loc1_:IItemListWindow = this.var_30.findChildByName(const_279) as IItemListWindow;
         var _loc2_:int = this._windowManager.getWindowContext(const_278).getDesktopWindow().width - const_610;
         var _loc3_:int = this.var_30.width - _loc1_.width;
         return (_loc2_ - _loc3_) / (const_427 + _loc1_.spacing);
      }
      
      private function calculateWidthForBar() : int
      {
         var _loc1_:IItemListWindow = this.var_30.findChildByName(const_279) as IItemListWindow;
         var _loc2_:int = this._windowManager.getWindowContext(const_278).getDesktopWindow().width - const_610;
         var _loc3_:int = this.var_30.width - _loc1_.width;
         var _loc4_:int = (_loc2_ - _loc3_) / (const_427 + _loc1_.spacing);
         var _loc5_:int = 0;
         if(_loc4_ > this.var_115.numFriends)
         {
            _loc5_ = this.var_115.numFriends + (!!this._findFriendsEnabled ? 1 : 0);
         }
         else
         {
            _loc5_ = _loc4_;
         }
         return _loc5_ * (const_427 + _loc1_.spacing) + _loc3_;
      }
      
      private function onDesktopResized(param1:WindowEvent) : void
      {
         this.resizeAndPopulate(false);
      }
   }
}

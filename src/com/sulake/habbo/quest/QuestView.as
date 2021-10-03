package com.sulake.habbo.quest
{
   import com.sulake.core.assets.AssetLoaderStruct;
   import com.sulake.core.assets.loaders.AssetLoaderEvent;
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.core.window.components.IHTMLTextWindow;
   import com.sulake.core.window.components.IItemListWindow;
   import com.sulake.core.window.components.IScrollableListWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.enum.LinkTarget;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.quest.enum.QuestStatusEnum;
   import com.sulake.habbo.quest.enum.QuestTypeEnum;
   import com.sulake.habbo.room.IGetImageListener;
   import com.sulake.habbo.room.ImageResult;
   import com.sulake.habbo.session.furniture.IFurnitureData;
   import com.sulake.room.utils.Vector3d;
   import flash.display.BitmapData;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   
   public class QuestView implements IGetImageListener, IDisposable
   {
       
      
      private var var_64:QuestCampaign;
      
      private var var_61:Quest;
      
      private var _view:IWindow;
      
      private var var_546:int;
      
      private var var_2768:IScrollableListWindow;
      
      private var var_820:Boolean = false;
      
      private var var_671:Timer;
      
      private var var_2769:Boolean;
      
      public function QuestView(param1:QuestCampaign, param2:Quest, param3:Boolean = false)
      {
         super();
         this.var_64 = param1;
         this.var_61 = param2;
         this.var_2769 = param3;
         this.createView();
      }
      
      public function dispose() : void
      {
         this._view.dispose();
         this.var_820 = true;
         if(this.var_671)
         {
            this.var_671.stop();
            this.var_671 = null;
         }
      }
      
      public function get disposed() : Boolean
      {
         return this.var_820;
      }
      
      public function init() : void
      {
         var _loc1_:IWindow = this.find("quest.button.accept");
         if(_loc1_)
         {
            _loc1_.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,this.onActivateQuest);
         }
         var _loc2_:IWindow = this.find("quest.reward.desc");
         if(_loc2_)
         {
            _loc2_.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,this.onRewardInfo);
            _loc2_.mouseThreshold = 0;
         }
         this.localize();
         if(this.var_2769)
         {
            this.alterViewForStandAlone();
         }
      }
      
      private function alterViewForStandAlone() : void
      {
         this.find("quest.available.container").visible = false;
         this.setTextHeight("quest.description");
         this.setTextHeight("quest.requirement");
         var _loc1_:IWindow = this.find("quest.reward.container");
         this.find("quest.status.container").y = _loc1_.y + _loc1_.height + 5;
      }
      
      private function setTextHeight(param1:String) : void
      {
         var _loc2_:ITextWindow = ITextWindow(this.find(param1));
         _loc2_.height = _loc2_.textHeight;
      }
      
      private function createView() : void
      {
         switch(this.var_61.type)
         {
            case QuestTypeEnum.FIND_STUFF:
            case QuestTypeEnum.FIND_HIDDEN_STUFF:
            case QuestTypeEnum.GIVE_BADGE:
            case QuestTypeEnum.PLACE_ITEM:
            case QuestTypeEnum.PICKUP_ITEM:
            case QuestTypeEnum.ROTATE_ITEM:
            case QuestTypeEnum.MOVE_ITEM:
            case QuestTypeEnum.SWITCH_ITEM_STATE:
            case QuestTypeEnum.STACK_ITEM:
            case QuestTypeEnum.PLACE_WALLPAPER:
            case QuestTypeEnum.PLACE_FLOOR:
               this._view = this.var_64.controller.questEngine.getXmlWindow("QuestTypeBasic");
               this.var_2768 = this.find("quest.content.itemlist") as IScrollableListWindow;
               if(!this._view)
               {
                  throw new Error("[QuestView] Could not create view for quest type: " + this.var_61.type + " !");
               }
               this._view.addEventListener(WindowEvent.const_49,this.onResized);
               return;
               break;
            default:
               throw new Error("[QuestView] View not defined for quest type: " + this.var_61.type + " !");
         }
      }
      
      public function get view() : IWindow
      {
         return this._view;
      }
      
      public function onActivateQuest(param1:WindowEvent, param2:IWindow = null) : void
      {
         if(this.var_61)
         {
            this.var_64.controller.activateQuest(this.var_61);
         }
      }
      
      public function onRewardInfo(param1:WindowEvent, param2:IWindow = null) : void
      {
         var _loc3_:* = null;
         if(this.var_61)
         {
            _loc3_ = "catalog.page.quest." + this.var_64.code;
            Logger.log("Questing->Open Catalog: " + _loc3_);
            this.var_64.controller.questEngine.openCatalog(_loc3_);
         }
         param1.stopPropagation();
         param1.stopImmediatePropagation();
      }
      
      public function find(param1:String) : IWindow
      {
         var _loc2_:* = null;
         if(this.var_820)
         {
            return null;
         }
         if(this._view is IWindowContainer)
         {
            _loc2_ = IWindowContainer(this._view).findChildByName(param1);
         }
         else if(this._view is IItemListWindow)
         {
            _loc2_ = IItemListWindow(this._view).getListItemByName(param1);
         }
         if(_loc2_ == null)
         {
            throw new Error("Window element with name: " + param1 + " cannot be found!");
         }
         return _loc2_;
      }
      
      private function localize() : void
      {
         var _loc34_:* = null;
         var _loc35_:* = null;
         var _loc36_:int = 0;
         var _loc37_:* = null;
         var _loc38_:* = null;
         var _loc39_:* = null;
         var _loc1_:String = ["quest",this.var_64.code,this.var_61.localizationCode].join("_");
         var _loc2_:String = ["quest_" + this.var_64.code,"type_" + this.var_61.type.toLowerCase()].join(".");
         var _loc3_:String = "quest_" + this.var_64.code;
         var _loc4_:* = _loc1_ + ".title";
         var _loc5_:* = _loc1_ + ".short";
         var _loc6_:* = _loc1_ + ".desc";
         var _loc7_:* = _loc2_ + ".requirement";
         var _loc8_:* = _loc2_ + ".success";
         var _loc13_:* = _loc3_ + ".reward.title";
         var _loc14_:* = _loc3_ + ".reward.desc";
         var _loc15_:IBitmapWrapperWindow = this.find("quest.image") as IBitmapWrapperWindow;
         if(this.var_61.type == QuestTypeEnum.FIND_STUFF)
         {
            _loc34_ = this.var_61.roomItemTypeName.split("*");
            _loc35_ = _loc34_.length > 0 ? _loc34_[0] : "";
            _loc36_ = _loc34_.length > 1 ? int(parseInt(_loc34_[1])) : 0;
            _loc37_ = this.var_64.controller.questEngine.sessionDataManager.getFloorItemDataByName(_loc35_,_loc36_);
            if(_loc37_)
            {
               _loc39_ = "";
               _loc38_ = this.var_64.controller.questEngine.roomEngine.getFurnitureImage(_loc37_.id,new Vector3d(90,0,0),64,this,_loc36_,_loc39_);
               this.var_546 = _loc38_.id;
               if(_loc38_ && _loc38_.data)
               {
                  this.imageReady(_loc38_.id,_loc38_.data);
               }
               this.var_64.controller.questEngine.localization.registerParameter(_loc7_,"name",_loc37_.title);
            }
         }
         else if(this.var_61.type == QuestTypeEnum.FIND_HIDDEN_STUFF)
         {
            this.var_64.controller.questEngine.setImageFromAsset(_loc15_,"icon_quest_hidden",this.onPreviewImageReady);
         }
         else if(this.var_61.type == QuestTypeEnum.GIVE_BADGE)
         {
            this.var_64.controller.questEngine.setImageFromAsset(_loc15_,this.var_61.questBadgeAchievementTypeId,this.onPreviewImageReady);
         }
         else if(this.var_61.type == QuestTypeEnum.PLACE_ITEM)
         {
            this.var_546 = -1;
            QuestUtils.setElementImage(this.find("quest.image") as IBitmapWrapperWindow,new BitmapData(1,1,true));
         }
         else if(this.var_61.type == QuestTypeEnum.PICKUP_ITEM)
         {
            this.var_546 = -1;
            QuestUtils.setElementImage(this.find("quest.image") as IBitmapWrapperWindow,new BitmapData(1,1,true));
         }
         else if(this.var_61.type == QuestTypeEnum.ROTATE_ITEM)
         {
            this.var_546 = -1;
            QuestUtils.setElementImage(this.find("quest.image") as IBitmapWrapperWindow,new BitmapData(1,1,true));
         }
         else if(this.var_61.type == QuestTypeEnum.MOVE_ITEM)
         {
            this.var_546 = -1;
            QuestUtils.setElementImage(this.find("quest.image") as IBitmapWrapperWindow,new BitmapData(1,1,true));
         }
         else if(this.var_61.type == QuestTypeEnum.SWITCH_ITEM_STATE)
         {
            this.var_546 = -1;
            QuestUtils.setElementImage(this.find("quest.image") as IBitmapWrapperWindow,new BitmapData(1,1,true));
         }
         else if(this.var_61.type == QuestTypeEnum.STACK_ITEM)
         {
            this.var_546 = -1;
            QuestUtils.setElementImage(this.find("quest.image") as IBitmapWrapperWindow,new BitmapData(1,1,true));
         }
         else
         {
            this.var_546 = -1;
            QuestUtils.setElementImage(this.find("quest.image") as IBitmapWrapperWindow,new BitmapData(1,1,true));
         }
         this.setText("quest.header.title",_loc4_);
         this.setText("quest.header.short",_loc5_);
         this.setText("quest.description",_loc6_);
         var _loc16_:IWindow = this.find("quest.button.accept");
         var _loc17_:IWindow = this.find("quest.status");
         _loc16_.visible = false;
         _loc17_.visible = false;
         var _loc18_:IWindow = this.find("quest.status.container");
         var _loc19_:int = 4287150640;
         switch(this.var_61.status)
         {
            case QuestStatusEnum.const_360:
               _loc16_.visible = true;
               break;
            case QuestStatusEnum.const_45:
               this.setText("quest.status","quest.accepted");
               _loc17_.visible = true;
               break;
            case QuestStatusEnum.const_208:
               this.setText("quest.status","quest.expired");
               _loc17_.visible = true;
               _loc19_ = 4290822336;
               break;
            case QuestStatusEnum.const_871:
               this.setText("quest.status","quest.completed");
               _loc17_.visible = true;
               _loc19_ = 4290822336;
               break;
            case QuestStatusEnum.const_209:
               this.setText("quest.status","quest.preview");
               _loc17_.visible = true;
               _loc19_ = 4292927712;
         }
         if(_loc18_)
         {
            _loc18_.color = _loc19_;
         }
         this.setText("quest.requirement",_loc7_);
         this.var_64.controller.questEngine.localization.registerParameter(_loc14_,"amount",this.var_61.rewardCurrencyAmount.toString());
         this.setText("quest.reward.title",_loc13_);
         this.setText("quest.reward.desc",_loc14_,true,true);
         var _loc20_:int = this.var_61.endDate.date;
         var _loc21_:int = this.var_61.endDate.month + 1;
         var _loc22_:int = this.var_61.endDate.fullYear;
         var _loc23_:int = this.var_61.endDate.minutes;
         var _loc24_:int = this.var_61.endDate.hours;
         var _loc25_:int = _loc24_ > 11 ? int(_loc24_ - 12) : int(_loc24_);
         var _loc26_:String = _loc24_ < 12 ? "am" : "pm";
         this.var_64.controller.questEngine.localization.registerParameter("quest.available","day",_loc20_.toString());
         this.var_64.controller.questEngine.localization.registerParameter("quest.available","month",_loc21_.toString());
         this.var_64.controller.questEngine.localization.registerParameter("quest.available","year",_loc22_.toString());
         this.var_64.controller.questEngine.localization.registerParameter("quest.available","12h",this.pad(_loc25_));
         this.var_64.controller.questEngine.localization.registerParameter("quest.available","24h",this.pad(_loc24_));
         this.var_64.controller.questEngine.localization.registerParameter("quest.available","ampm",_loc26_);
         this.var_64.controller.questEngine.localization.registerParameter("quest.available","minute",this.pad(_loc23_));
         this.setText("quest.available","quest.available");
         var _loc27_:String = [_loc20_,_loc21_,_loc22_].join(".");
         var _loc28_:String = [this.pad(_loc24_),this.pad(_loc23_)].join(":");
         var _loc29_:IBitmapWrapperWindow = this.find("quest.header.img") as IBitmapWrapperWindow;
         var _loc30_:String = "header_" + this.var_64.code;
         this.var_64.controller.questEngine.setImageFromAsset(_loc29_,_loc30_,this.onHeaderImageReady);
         var _loc31_:IBitmapWrapperWindow = this.find("quest.reward.icon") as IBitmapWrapperWindow;
         var _loc32_:String = "icon_" + this.var_64.code + "_reward_" + this.var_61.rewardCurrencyAmount;
         this.var_64.controller.questEngine.setImageFromAsset(_loc31_,_loc32_,this.onRewardImageReady);
         this.updateMargins();
         var _loc33_:IWindow = this.find("quest.reward.desc");
         if(_loc33_)
         {
            this.var_671 = new Timer(20,1);
            this.var_671.addEventListener(TimerEvent.TIMER,this.onShowReward);
            this.var_671.start();
            _loc33_.visible = false;
         }
      }
      
      private function onShowReward(param1:TimerEvent) : void
      {
         var _loc2_:IWindow = this.find("quest.reward.desc");
         if(_loc2_)
         {
            _loc2_.visible = true;
         }
         this.var_671.stop();
         this.var_671 = null;
      }
      
      private function pad(param1:int, param2:int = 2) : String
      {
         var _loc3_:String = param1.toString();
         while(_loc3_.length < param2)
         {
            _loc3_ = "0" + _loc3_;
         }
         return _loc3_;
      }
      
      private function setText(param1:String, param2:String, param3:Boolean = true, param4:Boolean = false) : void
      {
         var _loc5_:IWindow = this.find(param1);
         if(_loc5_)
         {
            if(param3)
            {
               param2 = "${" + param2 + "}";
            }
            _loc5_.caption = param2;
            if(param4 && _loc5_ is IHTMLTextWindow)
            {
               (_loc5_ as IHTMLTextWindow).htmlText = "<a href=\"event:\" >" + (_loc5_ as IHTMLTextWindow).text + "</a>";
               (_loc5_ as IHTMLTextWindow).linkTarget = LinkTarget.const_852;
            }
         }
      }
      
      private function onRewardImageReady(param1:AssetLoaderEvent) : void
      {
         var _loc3_:* = null;
         if(this.var_820)
         {
            return;
         }
         var _loc2_:AssetLoaderStruct = param1.target as AssetLoaderStruct;
         if(_loc2_ != null)
         {
            _loc3_ = this.find("quest.reward.icon") as IBitmapWrapperWindow;
            this.var_64.controller.questEngine.setImageFromAsset(_loc3_,_loc2_.assetName,this.onRewardImageReady);
         }
      }
      
      private function onHeaderImageReady(param1:AssetLoaderEvent) : void
      {
         var _loc3_:* = null;
         if(this.var_820)
         {
            return;
         }
         var _loc2_:AssetLoaderStruct = param1.target as AssetLoaderStruct;
         if(_loc2_ != null)
         {
            _loc3_ = this.find("quest.header.img") as IBitmapWrapperWindow;
            this.var_64.controller.questEngine.setImageFromAsset(_loc3_,_loc2_.assetName,this.onHeaderImageReady);
         }
      }
      
      private function onPreviewImageReady(param1:AssetLoaderEvent) : void
      {
         var _loc3_:* = null;
         if(this.var_820)
         {
            return;
         }
         var _loc2_:AssetLoaderStruct = param1.target as AssetLoaderStruct;
         if(_loc2_ != null)
         {
            _loc3_ = this.find("quest.image") as IBitmapWrapperWindow;
            this.var_64.controller.questEngine.setImageFromAsset(_loc3_,_loc2_.assetName,this.onPreviewImageReady);
         }
      }
      
      public function imageReady(param1:int, param2:BitmapData) : void
      {
         var _loc3_:* = null;
         if(this.var_820)
         {
            return;
         }
         if(this.var_546 == param1)
         {
            _loc3_ = this.find("quest.image") as IBitmapWrapperWindow;
            if(_loc3_)
            {
               _loc3_.height = param2.height + 5;
               QuestUtils.setElementImage(_loc3_,param2,_loc3_.height);
               this.updateMargins();
            }
         }
      }
      
      private function updateMargins() : void
      {
         var _loc1_:ITextWindow = this.find("quest.requirement") as ITextWindow;
         var _loc2_:ITextWindow = this.find("quest.description") as ITextWindow;
         _loc1_.height = _loc1_.textHeight + 5;
         _loc2_.height = _loc2_.textHeight + 5;
         if(this.var_2768.maxScrollV > 0)
         {
            _loc1_.margins.right = 20;
            _loc2_.margins.right = 20;
         }
         else
         {
            _loc1_.margins.right = 5;
            _loc2_.margins.right = 5;
         }
         _loc1_.height = _loc1_.textHeight + 5;
         _loc2_.height = _loc2_.textHeight + 5;
      }
      
      private function onResized(param1:WindowEvent, param2:IWindow = null) : void
      {
         this.updateMargins();
      }
      
      public function get quest() : Quest
      {
         return this.var_61;
      }
   }
}

package com.sulake.habbo.notifications
{
   import com.sulake.core.assets.IAsset;
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.runtime.IUpdateReceiver;
   import com.sulake.core.utils.Map;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.core.window.components.IDesktopWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.session.events.BadgeImageReadyEvent;
   import com.sulake.habbo.toolbar.IHabboToolbar;
   import com.sulake.habbo.window.IHabboWindowManager;
   import flash.display.BitmapData;
   import flash.geom.Point;
   
   public class HabboNotificationItemView implements IUpdateReceiver
   {
      
      public static const const_928:int = 70;
      
      public static const const_443:int = 4;
      
      private static const name_3:int = 0;
      
      private static const const_512:int = 1;
      
      private static const const_1007:int = 2;
      
      private static const const_1008:int = 3;
      
      private static const const_434:Number = 50;
       
      
      private var var_181:IHabboToolbar;
      
      private var _window:IWindow;
      
      private var var_221:HabboNotificationItem;
      
      private var var_1921:Boolean = false;
      
      private var var_2819:Map;
      
      private var var_455:Map;
      
      private var var_1226:uint;
      
      private var var_1225:uint;
      
      private var var_1499:uint;
      
      private var var_797:int;
      
      private var var_798:Number;
      
      private var var_1920:int;
      
      private var var_1919:int;
      
      private var _state:int;
      
      public function HabboNotificationItemView(param1:IAsset, param2:IHabboWindowManager, param3:Map, param4:Map, param5:IHabboToolbar, param6:HabboNotificationItem)
      {
         super();
         this.var_2819 = param3;
         this.var_455 = param4;
         var _loc7_:XmlAsset = param1 as XmlAsset;
         if(_loc7_ == null)
         {
            return;
         }
         this._window = param2.buildFromXML(_loc7_.content as XML,1);
         this._window.tags.push("notificationview");
         this._window.context.getDesktopWindow().addEventListener(WindowEvent.const_49,this.onRoomViewResized);
         this._window.procedure = this.onWindowEvent;
         this._window.blend = 0;
         this._window.visible = false;
         var _loc8_:ITextWindow = IWindowContainer(this._window).findChildByTag("notification_text") as ITextWindow;
         if(_loc8_ != null)
         {
            this.var_1920 = this._window.height - _loc8_.rectangle.bottom;
         }
         else
         {
            this.var_1920 = 15;
         }
         this.var_1919 = this._window.height;
         this.var_797 = 4;
         this.var_798 = 0;
         this._state = name_3;
         this.var_181 = param5;
         this.showItem(param6);
      }
      
      public function get disposed() : Boolean
      {
         return this._window == null;
      }
      
      public function get ready() : Boolean
      {
         return this._state == name_3;
      }
      
      public function get verticalPosition() : int
      {
         return this.var_797;
      }
      
      private function showItem(param1:HabboNotificationItem) : void
      {
         if(param1 == null)
         {
            return;
         }
         var _loc2_:String = param1.content;
         this.setNotificationText(_loc2_);
         var _loc3_:BitmapData = param1.style.icon;
         this.setNotificationIcon(_loc3_);
         this.var_221 = param1;
         this.reposition();
         this.startFadeIn();
      }
      
      public function replaceIcon(param1:BadgeImageReadyEvent) : void
      {
         if(param1.badgeId != this.var_221.style.iconSrc)
         {
            return;
         }
         if(param1.badgeImage != null)
         {
            this.setNotificationIcon(param1.badgeImage);
         }
      }
      
      public function update(param1:uint) : void
      {
         var _loc2_:Number = NaN;
         var _loc3_:Number = NaN;
         switch(this._state)
         {
            case name_3:
               break;
            case const_512:
               this.var_1226 += param1;
               _loc2_ = Number(this.var_1226) / Number(this.var_455["time_fade_in"]);
               if(this.var_1226 > int(this.var_455["time_fade_in"]))
               {
                  this.startDisplay();
               }
               this.adjustBlend(_loc2_);
               break;
            case const_1007:
               this.var_1499 += param1;
               if(this.var_1499 > int(this.var_455["time_display"]) && !this.var_1921)
               {
                  this.startFadeOut();
               }
               break;
            case const_1008:
               this.var_1225 += param1;
               _loc3_ = 1 - Number(this.var_1225) / Number(this.var_455["time_fade_out"]);
               this.adjustBlend(_loc3_);
               if(this.var_1225 > int(this.var_455["time_fade_in"]))
               {
                  this.startIdling();
               }
         }
      }
      
      public function dispose() : void
      {
         if(this._window != null)
         {
            this._window.dispose();
            this._window = null;
         }
         if(this.var_221 != null)
         {
            this.var_221.dispose();
            this.var_221 = null;
         }
      }
      
      private function setNotificationText(param1:String) : void
      {
         var _loc2_:ITextWindow = IWindowContainer(this._window).findChildByTag("notification_text") as ITextWindow;
         if(_loc2_ == null || param1 == null)
         {
            return;
         }
         this._window.height = 0;
         _loc2_.text = param1;
         _loc2_.height = _loc2_.textHeight + this.var_1920;
         if(this._window.height < this.var_1919)
         {
            this._window.height = this.var_1919;
         }
      }
      
      private function setNotificationIcon(param1:BitmapData) : void
      {
         var _loc3_:* = null;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc2_:IBitmapWrapperWindow = IWindowContainer(this._window).findChildByTag("notification_icon") as IBitmapWrapperWindow;
         if(_loc2_ == null)
         {
            return;
         }
         if(param1 == null)
         {
            _loc2_.bitmap = null;
            return;
         }
         if(param1.width < _loc2_.width && param1.height < _loc2_.height)
         {
            _loc3_ = new BitmapData(_loc2_.width,_loc2_.height,true,0);
            _loc5_ = (_loc2_.width - param1.width) / 2;
            _loc6_ = (_loc2_.height - param1.height) / 2;
            _loc3_.copyPixels(param1,param1.rect,new Point(_loc5_,_loc6_));
         }
         else if(param1.width < param1.height)
         {
            _loc3_ = new BitmapData(param1.height,param1.height,true,0);
            _loc4_ = (param1.height - param1.width) / 2;
            _loc3_.copyPixels(param1,param1.rect,new Point(_loc4_,0));
         }
         else if(param1.width > param1.height)
         {
            _loc3_ = new BitmapData(param1.width,param1.width,true,0);
            _loc4_ = (param1.width - param1.height) / 2;
            _loc3_.copyPixels(param1,param1.rect,new Point(0,_loc4_));
         }
         else
         {
            _loc3_ = new BitmapData(param1.width,param1.height);
            _loc3_.copyPixels(param1,param1.rect,new Point(0,0));
         }
         _loc2_.bitmap = _loc3_;
      }
      
      private function startFadeIn() : void
      {
         this.var_1226 = 0;
         this._state = const_512;
         this._window.visible = true;
      }
      
      private function startFadeOut() : void
      {
         this.var_1225 = 0;
         this._state = const_1008;
      }
      
      private function startDisplay() : void
      {
         this.var_1499 = 0;
         this._state = const_1007;
      }
      
      private function startIdling() : void
      {
         this._state = name_3;
         this._window.visible = false;
      }
      
      public function reposition(param1:int = -1) : void
      {
         if(this._window == null)
         {
            return;
         }
         if(this.var_181 == null)
         {
            return;
         }
         var _loc2_:IDesktopWindow = this._window.context.getDesktopWindow();
         if(_loc2_ == null)
         {
            return;
         }
         if(param1 != -1)
         {
            this.var_797 = param1;
         }
         var _loc3_:int = this.var_181.orientation == "TOP" ? int(const_434) : 0;
         var _loc4_:int = this.var_181.orientation == "BOTTOM" ? int(_loc2_.height - const_434) : int(_loc2_.height);
         var _loc5_:int = this.var_181.orientation == "LEFT" ? int(const_434) : 0;
         var _loc6_:int = this.var_181.orientation == "RIGHT" ? int(_loc2_.width - const_434) : int(_loc2_.width);
         if(this.var_455["position_horizontal_follow_toolbar"] == "com.sulake.room.object.logic" && (this.var_181.orientation != "TOP" && this.var_181.orientation != "BOTTOM"))
         {
            if(this.var_181.orientation == "LEFT")
            {
               this._window.x = _loc5_ + const_443;
            }
            else
            {
               this._window.x = _loc6_ - this._window.width - const_443;
            }
         }
         else if(this.var_455["position_horizontal"] == "left")
         {
            this._window.x = _loc5_ + const_443;
         }
         else
         {
            this._window.x = _loc6_ - this._window.width - const_443;
         }
         if(this.var_455["position_vertical_follow_toolbar"] == "com.sulake.room.object.logic" && (this.var_181.orientation != "RIGHT" && this.var_181.orientation != "LEFT"))
         {
            if(this.var_181.orientation == "TOP")
            {
               this._window.y = _loc3_ + this.var_797;
            }
            else
            {
               this._window.y = _loc4_ - this._window.height - this.var_797;
            }
         }
         else if(this.var_455["position_vertical"] == "top")
         {
            this._window.y = _loc3_ + this.var_797;
         }
         else
         {
            this._window.y = _loc4_ - this._window.height - this.var_797;
         }
      }
      
      public function onWindowEvent(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1 == null)
         {
            return;
         }
         if(param1.type == WindowMouseEvent.WINDOW_EVENT_MOUSE_OVER)
         {
            this.var_1921 = true;
            Logger.log("notifications - hover on");
         }
         else if(param1.type == WindowMouseEvent.const_25)
         {
            this.var_1921 = false;
            Logger.log("notifications - hover off");
         }
         else if(param1.type == WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            if(this.var_221 != null)
            {
               this.var_221.ExecuteUiLinks();
            }
         }
      }
      
      private function onRoomViewResized(param1:WindowEvent) : void
      {
         this.reposition();
      }
      
      private function adjustBlend(param1:Number) : void
      {
         this.var_798 = param1;
         if(this.var_798 > 1)
         {
            this.var_798 = 1;
         }
         if(this.var_798 < 0)
         {
            this.var_798 = 0;
         }
         this._window.blend = this.var_798;
      }
   }
}

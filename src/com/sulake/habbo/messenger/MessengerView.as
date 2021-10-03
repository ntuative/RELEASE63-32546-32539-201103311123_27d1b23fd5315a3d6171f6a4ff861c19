package com.sulake.habbo.messenger
{
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.components.IFrameWindow;
   import com.sulake.core.window.components.ITextFieldWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowKeyboardEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.communication.messages.outgoing.friendlist.SendMsgMessageComposer;
   import com.sulake.habbo.messenger.domain.Conversation;
   import com.sulake.habbo.messenger.domain.Message;
   import com.sulake.habbo.toolbar.HabboToolbarIconEnum;
   import com.sulake.habbo.toolbar.events.HabboToolbarShowMenuEvent;
   import com.sulake.habbo.window.enum.HabboWindowParam;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.ui.Keyboard;
   import flash.utils.Timer;
   
   public class MessengerView implements IDisposable
   {
       
      
      private var var_139:HabboMessenger;
      
      private var var_1040:ConversationsTabView;
      
      private var var_1026:ITextFieldWindow;
      
      private var var_16:IFrameWindow;
      
      private var var_1552:ConversationView;
      
      private var var_519:Timer;
      
      private var _disposed:Boolean = false;
      
      public function MessengerView(param1:HabboMessenger)
      {
         super();
         this.var_139 = param1;
         this.var_519 = new Timer(300,1);
         this.var_519.addEventListener(TimerEvent.TIMER,this.onResizeTimer);
      }
      
      public function dispose() : void
      {
         if(!this._disposed)
         {
            if(this.var_519)
            {
               this.var_519.stop();
               this.var_519.removeEventListener(TimerEvent.TIMER,this.onResizeTimer);
               this.var_519 = null;
            }
            this.var_139 = null;
            this._disposed = true;
         }
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function isMessengerOpen() : Boolean
      {
         return this.var_16 != null && this.var_16.visible;
      }
      
      public function close() : void
      {
         if(this.var_16 != null)
         {
            this.var_16.visible = false;
         }
      }
      
      public function openMessenger() : void
      {
         if(this.var_139.conversations.openConversations.length < 1)
         {
            return;
         }
         if(this.var_16 == null)
         {
            this.prepareContent();
            this.refresh();
            this.var_139.toolbar.events.dispatchEvent(new HabboToolbarShowMenuEvent(HabboToolbarShowMenuEvent.const_54,HabboToolbarIconEnum.MESSENGER,this.var_16));
         }
         else
         {
            this.refresh();
            this.var_16.visible = true;
            this.var_16.activate();
         }
      }
      
      public function refresh() : void
      {
         if(this.var_16 == null)
         {
            return;
         }
         var _loc1_:Conversation = this.var_139.conversations.findSelectedConversation();
         this.var_16.caption = _loc1_ == null ? "" : _loc1_.name;
         this.var_1040.refresh();
         this.var_1552.refresh();
         if(this.var_139.conversations.openConversations.length < 1)
         {
            this.var_16.visible = false;
            this.var_139.setHabboToolbarIcon(false,false);
         }
      }
      
      public function addMsgToView(param1:Conversation, param2:Message) : void
      {
         if(this.var_16 == null)
         {
            return;
         }
         if(!param1.selected)
         {
            return;
         }
         this.var_1552.addMessage(param2);
      }
      
      private function prepareContent() : void
      {
         this.var_16 = IFrameWindow(this.var_139.getXmlWindow("main_window"));
         var _loc1_:IWindow = this.var_16.findChildByTag("close");
         _loc1_.procedure = this.onWindowClose;
         this.var_16.procedure = this.onWindow;
         this.var_16.title.color = 4294623744;
         this.var_16.title.textColor = 4287851525;
         this.var_1040 = new ConversationsTabView(this.var_139,this.var_16);
         this.var_1040.refresh();
         this.var_1026 = ITextFieldWindow(this.var_16.findChildByName("message_input"));
         this.var_1026.addEventListener(WindowKeyboardEvent.const_205,this.onMessageInput);
         this.var_1552 = new ConversationView(this.var_139,this.var_16);
         this.var_16.scaler.setParamFlag(HabboWindowParam.const_892,false);
         this.var_16.scaler.setParamFlag(HabboWindowParam.const_1235,true);
      }
      
      private function onMessageInput(param1:Event) : void
      {
         var _loc4_:int = 0;
         var _loc5_:* = null;
         var _loc2_:IWindow = IWindow(param1.target);
         if(!(param1 is WindowKeyboardEvent))
         {
            return;
         }
         var _loc3_:WindowKeyboardEvent = param1 as WindowKeyboardEvent;
         if(_loc3_.charCode == Keyboard.ENTER)
         {
            this.sendMsg();
         }
         else
         {
            _loc4_ = 120;
            _loc5_ = this.var_1026.text;
            if(_loc5_.length > _loc4_)
            {
               this.var_1026.text = _loc5_.substring(0,_loc4_);
            }
         }
      }
      
      private function onWindow(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowEvent.const_49 || param2 != this.var_16)
         {
            return;
         }
         if(!this.var_519.running)
         {
            this.var_519.reset();
            this.var_519.start();
         }
      }
      
      private function onResizeTimer(param1:TimerEvent) : void
      {
         Logger.log("XXX RESIZE XXX");
         this.var_1552.afterResize();
         this.var_1040.refresh();
      }
      
      private function onWindowClose(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         Logger.log("Close window");
         this.var_16.visible = false;
      }
      
      private function sendMsg() : void
      {
         var _loc1_:String = this.var_1026.text;
         Logger.log("Send msg: " + _loc1_);
         if(_loc1_ == "")
         {
            Logger.log("No text...");
            return;
         }
         var _loc2_:Conversation = this.var_139.conversations.findSelectedConversation();
         if(_loc2_ == null)
         {
            Logger.log("No conversation...");
            return;
         }
         this.var_139.send(new SendMsgMessageComposer(_loc2_.id,_loc1_));
         if(_loc2_.messages.length == 1)
         {
            this.var_139.playSendSound();
         }
         this.var_1026.text = "";
         this.var_139.conversations.addMessageAndUpdateView(new Message(Message.const_926,_loc2_.id,_loc1_,Util.getFormattedNow()));
      }
      
      public function getTabCount() : int
      {
         return this.var_1040 == null ? 7 : int(this.var_1040.getTabCount());
      }
   }
}

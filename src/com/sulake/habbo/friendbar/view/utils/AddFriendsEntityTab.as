package com.sulake.habbo.friendbar.view.utils
{
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.core.window.events.WindowMouseEvent;
   import flash.display.BitmapData;
   
   public class AddFriendsEntityTab extends Tab
   {
      
      private static const const_1360:String = "icon";
      
      private static const TEXT:String = "text";
      
      private static const const_1808:String = "title";
      
      private static const BUTTON:String = "button";
      
      private static const const_1451:String = "addFriendsEntityTabXML";
      
      private static const const_1450:String = "friends_icon_png";
       
      
      public function AddFriendsEntityTab()
      {
         super();
         _window = var_1298.buildFromXML(var_849.getAssetByName(const_1451).content as XML) as IWindowContainer;
         _window.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,this.onMouseClick);
         var _loc1_:IBitmapWrapperWindow = _window.findChildByName(const_1360) as IBitmapWrapperWindow;
         _loc1_.disposesBitmap = false;
         _loc1_.bitmap = var_849.getAssetByName(const_1450).content as BitmapData;
         var _loc2_:IWindow = _window.findChildByName(BUTTON);
         _loc2_.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,this.onButtonClick);
         var _loc3_:IWindow = _window.findChildByName(TEXT);
         _loc3_.visible = false;
      }
      
      override public function select() : void
      {
         if(!selected)
         {
            _window.y = 0 - (0 - name_1);
            _window.findChildByName(TEXT).visible = true;
            super.select();
         }
      }
      
      override public function deselect() : void
      {
         if(selected)
         {
            _window.y += 0 - name_1;
            _window.findChildByName(TEXT).visible = false;
            super.deselect();
         }
      }
      
      override public function recycle() : void
      {
         dispose();
      }
      
      private function onMouseClick(param1:WindowMouseEvent) : void
      {
         if(!disposed && !recycled)
         {
            if(selected)
            {
               var_1049.deSelect();
            }
            else
            {
               var_1049.selectTab(this);
            }
         }
      }
      
      private function onButtonClick(param1:WindowMouseEvent) : void
      {
         var_1048.findNewFriends();
         this.deselect();
      }
   }
}

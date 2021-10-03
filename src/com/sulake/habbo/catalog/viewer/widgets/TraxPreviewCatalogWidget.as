package com.sulake.habbo.catalog.viewer.widgets
{
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IButtonWindow;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.catalog.HabboCatalog;
   import com.sulake.habbo.catalog.viewer.IProduct;
   import com.sulake.habbo.catalog.viewer.widgets.events.SelectProductEvent;
   import com.sulake.habbo.catalog.viewer.widgets.events.WidgetEvent;
   import com.sulake.habbo.sound.HabboMusicPrioritiesEnum;
   
   public class TraxPreviewCatalogWidget extends CatalogWidget implements ICatalogWidget
   {
       
      
      private var var_458:IButtonWindow;
      
      private var var_2709:int = -1;
      
      public function TraxPreviewCatalogWidget(param1:IWindowContainer)
      {
         super(param1);
         this.var_458 = _window.findChildByName("listen") as IButtonWindow;
         Logger.log("Trax listener found button: " + this.var_458);
         if(this.var_458 != null)
         {
            this.var_458.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,this.onClickPlay);
            this.var_458.disable();
         }
      }
      
      override public function dispose() : void
      {
         if(this.var_458 != null)
         {
            this.var_458.removeEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,this.onClickPlay);
         }
         (page.viewer.catalog as HabboCatalog).soundManager.musicController.stop(HabboMusicPrioritiesEnum.const_1057);
         super.dispose();
      }
      
      override public function init() : Boolean
      {
         if(!super.init())
         {
            return false;
         }
         if(page.offers.length == 0)
         {
            return false;
         }
         events.addEventListener(WidgetEvent.CWE_SELECT_PRODUCT,this.onSelectProduct);
         return true;
      }
      
      private function onSelectProduct(param1:SelectProductEvent) : void
      {
         if(param1 == null || param1.offer == null)
         {
            return;
         }
         var _loc2_:Boolean = false;
         var _loc3_:IProduct = param1.offer.productContainer.firstProduct;
         if(_loc3_.extraParam.length > 0)
         {
            this.var_2709 = parseInt(_loc3_.extraParam);
            _loc2_ = true;
         }
         if(this.var_458 != null)
         {
            if(_loc2_)
            {
               this.var_458.enable();
            }
            else
            {
               this.var_458.disable();
            }
         }
      }
      
      private function onClickPlay(param1:WindowMouseEvent) : void
      {
         (page.viewer.catalog as HabboCatalog).soundManager.musicController.playSong(this.var_2709,HabboMusicPrioritiesEnum.const_1057,-1,15);
      }
   }
}

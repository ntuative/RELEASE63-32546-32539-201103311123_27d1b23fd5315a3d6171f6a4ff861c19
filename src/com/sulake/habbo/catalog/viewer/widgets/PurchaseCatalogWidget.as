package com.sulake.habbo.catalog.viewer.widgets
{
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.localization.ICoreLocalizationManager;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IButtonWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.catalog.HabboCatalog;
   import com.sulake.habbo.catalog.purse.Purse;
   import com.sulake.habbo.catalog.viewer.Offer;
   import com.sulake.habbo.catalog.viewer.widgets.events.CatalogWidgetInitPurchaseEvent;
   import com.sulake.habbo.catalog.viewer.widgets.events.CatalogWidgetPurchaseOverrideEvent;
   import com.sulake.habbo.catalog.viewer.widgets.events.SelectProductEvent;
   import com.sulake.habbo.catalog.viewer.widgets.events.SetExtraPurchaseParameterEvent;
   import com.sulake.habbo.catalog.viewer.widgets.events.WidgetEvent;
   
   public class PurchaseCatalogWidget extends CatalogWidget implements ICatalogWidget
   {
       
      
      private var var_2367:XML;
      
      private var var_2365:XML;
      
      private var var_2366:XML;
      
      private var var_908:IWindowContainer;
      
      private var var_597:IButtonWindow;
      
      private var var_2930:IButtonWindow;
      
      private var var_1713:ITextWindow;
      
      private var var_1712:ITextWindow;
      
      private var var_1711:ITextWindow;
      
      private var var_2886:ITextWindow;
      
      private var var_95:Offer;
      
      private var var_1710:String = "";
      
      private var var_1394:Function;
      
      public function PurchaseCatalogWidget(param1:IWindowContainer)
      {
         super(param1);
      }
      
      override public function dispose() : void
      {
         events.removeEventListener(WidgetEvent.CWE_SELECT_PRODUCT,this.onSelectProduct);
         events.removeEventListener(WidgetEvent.const_918,this.onSetParameter);
         events.removeEventListener(WidgetEvent.CWE_PURCHASE_OVERRIDE,this.onPurchaseOverride);
         super.dispose();
      }
      
      override public function init() : Boolean
      {
         if(!super.init())
         {
            return false;
         }
         var _loc1_:XmlAsset = page.viewer.catalog.assets.getAssetByName("purchaseWidgetCreditsStub") as XmlAsset;
         if(_loc1_ != null)
         {
            this.var_2367 = _loc1_.content as XML;
         }
         var _loc2_:XmlAsset = page.viewer.catalog.assets.getAssetByName("purchaseWidgetPixelsStub") as XmlAsset;
         if(_loc2_ != null)
         {
            this.var_2365 = _loc2_.content as XML;
         }
         var _loc3_:XmlAsset = page.viewer.catalog.assets.getAssetByName("purchaseWidgetCreditsPixelsStub") as XmlAsset;
         if(_loc3_ != null)
         {
            this.var_2366 = _loc3_.content as XML;
         }
         var _loc4_:XmlAsset = page.viewer.catalog.assets.getAssetByName("purchaseWidgetCreditsOrCreditsAndPixelsStub") as XmlAsset;
         events.addEventListener(WidgetEvent.CWE_SELECT_PRODUCT,this.onSelectProduct);
         events.addEventListener(WidgetEvent.const_918,this.onSetParameter);
         events.addEventListener(WidgetEvent.CWE_PURCHASE_OVERRIDE,this.onPurchaseOverride);
         events.addEventListener(WidgetEvent.CWE_INIT_PURCHASE,this.initPurchase);
         return true;
      }
      
      private function onPurchaseOverride(param1:CatalogWidgetPurchaseOverrideEvent) : void
      {
         this.var_1394 = param1.callback;
      }
      
      private function attachStub(param1:String) : void
      {
         var _loc2_:* = null;
         switch(param1)
         {
            case Offer.const_946:
               _loc2_ = page.viewer.catalog.windowManager.buildFromXML(this.var_2367) as IWindowContainer;
               break;
            case Offer.const_1095:
               _loc2_ = page.viewer.catalog.windowManager.buildFromXML(this.var_2365) as IWindowContainer;
               break;
            case Offer.const_1236:
               _loc2_ = page.viewer.catalog.windowManager.buildFromXML(this.var_2366) as IWindowContainer;
               break;
            default:
               Logger.log("Unknown price-type, can\'t attach..." + this.var_95.priceType);
         }
         if(_loc2_ != null)
         {
            if(this.var_908 != null)
            {
               _window.removeChild(this.var_908);
               this.var_908.dispose();
            }
            this.var_908 = _loc2_;
            _window.addChild(_loc2_);
            this.var_908.x = 0;
            this.var_908.y = 0;
         }
         this.var_1713 = _window.findChildByName("ctlg_price_credits") as ITextWindow;
         this.var_1712 = _window.findChildByName("ctlg_price_pixels") as ITextWindow;
         this.var_1711 = _window.findChildByName("ctlg_price_credits_pixels") as ITextWindow;
         this.var_2886 = _window.findChildByName("ctlg_special_txt") as ITextWindow;
         this.var_597 = window.findChildByName("ctlg_buy_button") as IButtonWindow;
         if(this.var_597 != null)
         {
            if(this.var_1394 != null)
            {
               this.var_597.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,this.var_1394);
            }
            else
            {
               this.var_597.removeEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,this.var_1394);
               this.var_597.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,this.onPurchase);
            }
            this.var_597.disable();
         }
      }
      
      private function onSelectProduct(param1:SelectProductEvent) : void
      {
         var _loc4_:* = null;
         var _loc2_:ICoreLocalizationManager = (page.viewer.catalog as HabboCatalog).localization;
         this.var_95 = param1.offer;
         this.attachStub(this.var_95.priceType);
         if(this.var_1713 != null)
         {
            _loc2_.registerParameter("catalog.purchase.price.credits","credits",String(this.var_95.priceInCredits));
            this.var_1713.caption = "${catalog.purchase.price.credits}";
         }
         var _loc3_:String = this.var_95.activityPointType == Purse.const_182 ? "pixels" : "activitypoints";
         if(this.var_1712 != null)
         {
            _loc4_ = "catalog.purchase.price.activitypoints." + this.var_95.activityPointType;
            _loc2_.registerParameter(_loc4_,_loc3_,this.var_95.priceInActivityPoints.toString());
            this.var_1712.caption = _loc2_.getKey(_loc4_);
         }
         if(this.var_1711 != null)
         {
            _loc4_ = "catalog.purchase.price.credits+activitypoints." + this.var_95.activityPointType;
            _loc2_.registerParameter(_loc4_,"credits",String(this.var_95.priceInCredits));
            _loc2_.registerParameter(_loc4_,_loc3_,String(this.var_95.priceInActivityPoints));
            this.var_1711.caption = _loc2_.getKey(_loc4_);
         }
         var _loc5_:IWindow = _window.findChildByName("activity_points_bg");
         if(_loc5_ != null)
         {
            _loc5_.color = this.var_95.activityPointType == 0 ? 6737151 : uint(13421772);
         }
         if(this.var_597 != null)
         {
            this.var_597.enable();
         }
      }
      
      private function onSetParameter(param1:SetExtraPurchaseParameterEvent) : void
      {
         this.var_1710 = param1.parameter;
      }
      
      private function onPurchase(param1:WindowMouseEvent) : void
      {
         if(this.var_95 != null)
         {
            (page.viewer.catalog as HabboCatalog).showPurchaseConfirmation(this.var_95,page.pageId,this.var_1710);
         }
      }
      
      private function initPurchase(param1:CatalogWidgetInitPurchaseEvent) : void
      {
         if(this.var_95 != null)
         {
            (page.viewer.catalog as HabboCatalog).showPurchaseConfirmation(this.var_95,page.pageId,this.var_1710,param1.enableBuyAsGift);
         }
      }
   }
}

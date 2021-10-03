package com.sulake.habbo.catalog.viewer
{
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.habbo.catalog.IHabboCatalog;
   import com.sulake.habbo.catalog.enum.ProductTypeEnum;
   import com.sulake.habbo.communication.messages.incoming.catalog.CatalogPageMessageProductData;
   import com.sulake.habbo.room.IGetImageListener;
   import com.sulake.habbo.room.IRoomEngine;
   import com.sulake.habbo.room.ImageResult;
   import com.sulake.habbo.session.furniture.IFurnitureData;
   import com.sulake.habbo.session.product.IProductData;
   import flash.display.BitmapData;
   
   public class Product extends ProductGridItem implements IProduct, IGetImageListener
   {
       
      
      private var var_1965:String;
      
      private var var_1874:int;
      
      private var var_1524:String;
      
      private var var_1525:int;
      
      private var var_1966:int;
      
      private var var_1967:IProductData;
      
      private var _furnitureData:IFurnitureData;
      
      public function Product(param1:CatalogPageMessageProductData, param2:IProductData, param3:IFurnitureData)
      {
         super();
         this.var_1965 = param1.productType;
         this.var_1874 = param1.furniClassId;
         this.var_1524 = param1.extraParam;
         this.var_1525 = param1.productCount;
         this.var_1966 = param1.expiration;
         this.var_1967 = param2;
         this._furnitureData = param3;
      }
      
      public function get productType() : String
      {
         return this.var_1965;
      }
      
      public function get productClassId() : int
      {
         return this.var_1874;
      }
      
      public function get extraParam() : String
      {
         return this.var_1524;
      }
      
      public function get productCount() : int
      {
         return this.var_1525;
      }
      
      public function get expiration() : int
      {
         return this.var_1966;
      }
      
      public function get productData() : IProductData
      {
         return this.var_1967;
      }
      
      public function get furnitureData() : IFurnitureData
      {
         return this._furnitureData;
      }
      
      override public function dispose() : void
      {
         super.dispose();
         this.var_1965 = "";
         this.var_1874 = 0;
         this.var_1524 = "";
         this.var_1525 = 0;
         this.var_1966 = 0;
         this.var_1967 = null;
      }
      
      public function initIcon(param1:IProductContainer, param2:IGetImageListener = null) : BitmapData
      {
         var _loc6_:* = null;
         var _loc3_:* = null;
         if(param2 == null)
         {
            param2 = {};
         }
         var _loc4_:IRoomEngine = (param1 as ProductContainer).offer.page.viewer.roomEngine;
         var _loc5_:IHabboCatalog = (param1 as ProductContainer).offer.page.viewer.catalog;
         switch(this.productType)
         {
            case ProductTypeEnum.const_87:
               _loc6_ = _loc4_.getFurnitureIcon(this.productClassId,param2);
               break;
            case ProductTypeEnum.const_75:
               _loc6_ = _loc4_.getWallItemIcon(this.productClassId,param2,this.var_1524);
               break;
            case ProductTypeEnum.const_181:
               _loc3_ = _loc5_.getPixelEffectIcon(this.productClassId);
               break;
            case ProductTypeEnum.const_323:
               _loc3_ = _loc5_.getSubscriptionProductIcon(this.productClassId);
               break;
            default:
               Logger.log("[Product] Can not yet handle this type of product: " + this.productType);
         }
         if(_loc6_ != null)
         {
            _loc3_ = _loc6_.data;
            if(param2 == this)
            {
               this.setIconImage(_loc3_);
            }
         }
         return _loc3_;
      }
      
      public function imageReady(param1:int, param2:BitmapData) : void
      {
         Logger.log("[Product] Bundle Icon Image Ready!" + param1);
         setIconImage(param2);
      }
      
      override public function set view(param1:IWindowContainer) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         if(!param1)
         {
            return;
         }
         super.view = param1;
         if(this.var_1525 > 1)
         {
            _loc2_ = _view.findChildByName("multiContainer");
            if(_loc2_)
            {
               _loc2_.visible = true;
            }
            _loc3_ = _view.findChildByName("multiCounter") as ITextWindow;
            if(_loc3_)
            {
               _loc3_.text = "x" + this.productCount;
            }
         }
      }
   }
}

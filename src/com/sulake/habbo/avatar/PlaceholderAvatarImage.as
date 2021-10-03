package com.sulake.habbo.avatar
{
   import com.sulake.core.utils.Map;
   import com.sulake.habbo.avatar.alias.AssetAliasCollection;
   import com.sulake.habbo.avatar.cache.AvatarImageCache;
   import com.sulake.habbo.avatar.enum.AvatarAction;
   import flash.display.BitmapData;
   
   public class PlaceholderAvatarImage extends AvatarImage
   {
      
      static var var_700:Map = new Map();
       
      
      public function PlaceholderAvatarImage(param1:AvatarStructure, param2:AssetAliasCollection, param3:AvatarFigureContainer, param4:String)
      {
         super(param1,param2,param3,param4);
      }
      
      override public function dispose() : void
      {
         var _loc1_:* = null;
         if(!var_820)
         {
            _structure = null;
            _assets = null;
            var_244 = null;
            var_283 = null;
            var_617 = null;
            var_562 = null;
            var_333 = null;
            if(!var_1303 && var_45)
            {
               var_45.dispose();
            }
            var_45 = null;
            _loc1_ = getCache();
            if(_loc1_)
            {
               _loc1_.dispose();
               _loc1_ = null;
            }
            var_696 = null;
            var_820 = true;
         }
      }
      
      override protected function getFullImage(param1:String) : BitmapData
      {
         return var_700[param1];
      }
      
      override protected function cacheFullImage(param1:String, param2:BitmapData) : void
      {
         var_700[param1] = param2;
      }
      
      override public function appendAction(param1:String, ... rest) : Boolean
      {
         var _loc3_:* = null;
         if(rest != null && rest.length > 0)
         {
            _loc3_ = rest[0];
         }
         switch(param1)
         {
            case AvatarAction.const_414:
               switch(_loc3_)
               {
                  case AvatarAction.const_932:
                  case AvatarAction.const_504:
                  case AvatarAction.const_378:
                  case AvatarAction.const_896:
                  case AvatarAction.const_372:
                  case AvatarAction.const_864:
                     super.appendAction.apply(null,[param1].concat(rest));
               }
               break;
            case AvatarAction.const_333:
            case AvatarAction.const_640:
            case AvatarAction.const_240:
            case AvatarAction.const_819:
            case AvatarAction.const_822:
            case AvatarAction.const_820:
               super.addActionData.apply(null,[param1].concat(rest));
         }
         return true;
      }
      
      override public function isPlaceholder() : Boolean
      {
         return true;
      }
   }
}

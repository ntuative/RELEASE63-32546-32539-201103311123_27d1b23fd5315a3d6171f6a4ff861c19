package com.sulake.habbo.advertisement
{
   import com.sulake.core.assets.AssetLoaderStruct;
   import com.sulake.core.assets.IAsset;
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.assets.loaders.AssetLoaderEvent;
   import com.sulake.core.assets.loaders.IAssetLoader;
   import com.sulake.core.communication.connection.IConnection;
   import com.sulake.core.runtime.Component;
   import com.sulake.core.runtime.IContext;
   import com.sulake.core.runtime.IID;
   import com.sulake.core.runtime.IUnknown;
   import com.sulake.core.utils.Map;
   import com.sulake.habbo.advertisement.events.AdEvent;
   import com.sulake.habbo.advertisement.events.AdImageEvent;
   import com.sulake.habbo.communication.IHabboCommunicationManager;
   import com.sulake.habbo.communication.messages.incoming.advertisement.InterstitialMessageEvent;
   import com.sulake.habbo.communication.messages.incoming.advertisement.RoomAdMessageEvent;
   import com.sulake.habbo.communication.messages.outgoing.advertisement.GetInterstitialMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.advertisement.GetRoomAdMessageComposer;
   import com.sulake.habbo.communication.messages.parser.advertisement.InterstitialMessageParser;
   import com.sulake.habbo.communication.messages.parser.advertisement.RoomAdMessageParser;
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   import com.sulake.iid.IIDHabboCommunicationManager;
   import com.sulake.iid.IIDHabboConfigurationManager;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.net.URLRequest;
   import flash.system.Security;
   import flash.utils.Timer;
   import flash.utils.getTimer;
   
   public class AdManager extends Component implements IAdManager
   {
       
      
      private var var_316:IHabboCommunicationManager;
      
      private var _connection:IConnection;
      
      private var _config:IHabboConfigurationManager;
      
      private var var_2290:Boolean;
      
      private var var_1363:String;
      
      private var var_2289:String;
      
      private var var_2291:int = 0;
      
      private var var_1087:int = 0;
      
      private var var_2288:int = 0;
      
      private var var_1655:int = 0;
      
      private var var_1653:int = 0;
      
      private var var_217:Timer;
      
      private var var_1364:String;
      
      private var var_1654:String;
      
      private var var_1088:BitmapData = null;
      
      private var var_1089:BitmapData = null;
      
      private var var_585:Map;
      
      public function AdManager(param1:IContext, param2:uint = 0, param3:IAssetLibrary = null)
      {
         super(param1,param2,param3);
         this.var_585 = new Map();
         queueInterface(new IIDHabboCommunicationManager(),this.onCommunicationManagerReady);
         queueInterface(new IIDHabboConfigurationManager(),this.onConfigurationReady);
         events.addEventListener(AdImageEvent.ROOM_AD_LOAD_IMAGE,this.onLoadAdImage);
      }
      
      override public function dispose() : void
      {
         super.dispose();
         this._connection = null;
         if(this.var_585 != null)
         {
            this.var_585.dispose();
            this.var_585 = null;
         }
         if(this.var_316 != null)
         {
            release(new IIDHabboCommunicationManager());
            this.var_316 = null;
         }
         if(this._config != null)
         {
            release(new IIDHabboConfigurationManager());
            this._config = null;
         }
         if(this.var_1088)
         {
            this.var_1088.dispose();
            this.var_1088 = null;
         }
         if(this.var_1089)
         {
            this.var_1089.dispose();
            this.var_1089 = null;
         }
      }
      
      private function onCommunicationManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         this.var_316 = param2 as IHabboCommunicationManager;
         if(this.var_316 == null)
         {
            return;
         }
         this._connection = this.var_316.getHabboMainConnection(this.onConnectionReady);
         if(this._connection != null)
         {
            this.onConnectionReady(this._connection);
         }
      }
      
      private function onConnectionReady(param1:IConnection) : void
      {
         if(disposed || param1 == null)
         {
            return;
         }
         this._connection = param1;
         this._connection.addMessageEvent(new InterstitialMessageEvent(this.onInterstitial));
         this._connection.addMessageEvent(new RoomAdMessageEvent(this.onRoomAd));
      }
      
      private function onConfigurationReady(param1:IID = null, param2:IUnknown = null) : void
      {
         var _loc7_:* = null;
         var _loc8_:* = null;
         this._config = param2 as IHabboConfigurationManager;
         if(this._config == null)
         {
            return;
         }
         this.var_2290 = this._config.getKey("interstitial.enabled","false") == "com.sulake.room.object.logic";
         this.var_2291 = int(this._config.getKey("interstitial.interval","30000"));
         this.var_2288 = int(this._config.getKey("interstitial.show.time","5000"));
         this.var_1655 = int(this._config.getKey("interstitial.max.displays.flash","-1"));
         var _loc3_:String = this._config.getKey("ads.domain");
         if(_loc3_ != "")
         {
            Security.loadPolicyFile("http://" + _loc3_ + "/crossdomain.xml");
         }
         var _loc4_:String = this._config.getKey("billboard.adwarning.left.url");
         var _loc5_:String = this._config.getKey("billboard.adwarning.right.url");
         var _loc6_:String = this._config.getKey("image.library.url");
         if(_loc4_ != "" && _loc5_ != "")
         {
            _loc4_ = _loc6_ + _loc4_;
            _loc5_ = _loc6_ + _loc5_;
            _loc7_ = new URLRequest(_loc4_);
            _loc8_ = assets.loadAssetFromFile("adWarningL",_loc7_,"image/png");
            _loc8_.addEventListener(AssetLoaderEvent.const_29,this.adWarningLeftReady);
            _loc7_ = new URLRequest(_loc5_);
            _loc8_ = assets.loadAssetFromFile("adWarningRight",_loc7_,"image/png");
            _loc8_.addEventListener(AssetLoaderEvent.const_29,this.adWarningRightReady);
         }
      }
      
      public function showInterstitial() : Boolean
      {
         if(!this.var_2290)
         {
            return false;
         }
         if(this.var_217 != null && this.var_217.running)
         {
            this.var_217.reset();
            return false;
         }
         if(this.var_1087 == 0)
         {
            this.var_1087 = getTimer();
            return false;
         }
         if(this.var_1655 > 0 && this.var_1653 >= this.var_1655)
         {
            return false;
         }
         var _loc1_:int = getTimer() - this.var_1087;
         if(_loc1_ > this.var_2291)
         {
            ++this.var_1653;
            this._connection.send(new GetInterstitialMessageComposer());
            return true;
         }
         return false;
      }
      
      private function onInterstitial(param1:InterstitialMessageEvent) : void
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc2_:InterstitialMessageParser = param1.getParser();
         this.var_1363 = _loc2_.imageUrl;
         this.var_2289 = _loc2_.clickUrl;
         this.var_1087 = getTimer();
         if(this.var_1363 != "")
         {
            _loc3_ = this.var_1363;
            if(assets.hasAsset(_loc3_))
            {
               assets.removeAsset(assets.getAssetByName(_loc3_));
            }
            if(this.var_217 == null)
            {
               this.var_217 = new Timer(this.var_2288,1);
               this.var_217.addEventListener(TimerEvent.TIMER_COMPLETE,this.interstitialTimerComplete);
            }
            if(this.var_217.running)
            {
               this.var_217.reset();
            }
            this.var_217.start();
            _loc4_ = new URLRequest(this.var_1363);
            _loc5_ = assets.loadAssetFromFile(_loc3_,_loc4_,"image/jpeg");
            _loc5_.addEventListener(AssetLoaderEvent.const_29,this.interstitialLoaderEventHandler);
            _loc5_.addEventListener(AssetLoaderEvent.const_48,this.interstitialLoaderEventHandler);
         }
         else
         {
            this.stopInterstitial();
         }
      }
      
      private function interstitialLoaderEventHandler(param1:AssetLoaderEvent) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:* = null;
         if(param1 == null)
         {
            return;
         }
         switch(param1.type)
         {
            case AssetLoaderEvent.const_29:
               _loc2_ = param1.target as AssetLoaderStruct;
               if(_loc2_ != null)
               {
                  _loc3_ = _loc2_.assetLoader;
                  if(_loc3_ != null)
                  {
                     _loc4_ = _loc3_.content as Bitmap;
                     this.startInterstitial(_loc4_);
                     return;
                  }
               }
               this.stopInterstitial();
               break;
            case AssetLoaderEvent.const_48:
               this.stopInterstitial();
         }
      }
      
      private function startInterstitial(param1:Bitmap) : void
      {
         if(this.var_217 != null && !this.var_217.running)
         {
            return;
         }
         if(this.isValidAdImage(param1))
         {
            events.dispatchEvent(new AdEvent(AdEvent.const_539,0,0,param1.bitmapData,this.var_2289));
            this.var_1087 = getTimer();
         }
         else
         {
            this.stopInterstitial();
         }
      }
      
      private function interstitialTimerComplete(param1:TimerEvent) : void
      {
         this.stopInterstitial();
      }
      
      private function stopInterstitial() : void
      {
         if(this.var_217 != null && this.var_217.running)
         {
            this.var_217.reset();
         }
         if(events != null)
         {
            events.dispatchEvent(new AdEvent(AdEvent.const_437));
         }
      }
      
      public function showRoomAd() : void
      {
         this._connection.send(new GetRoomAdMessageComposer());
      }
      
      private function onRoomAd(param1:RoomAdMessageEvent) : void
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc2_:RoomAdMessageParser = param1.getParser();
         this.var_1364 = _loc2_.imageUrl;
         this.var_1654 = _loc2_.clickUrl;
         if(this.var_1364 != "" && this.var_1654 != "")
         {
            _loc3_ = this.var_1364;
            if(assets.hasAsset(_loc3_))
            {
               assets.removeAsset(assets.getAssetByName(_loc3_));
            }
            _loc4_ = new URLRequest(this.var_1364);
            _loc5_ = assets.loadAssetFromFile(_loc3_,_loc4_,"image/jpeg");
            _loc5_.addEventListener(AssetLoaderEvent.const_29,this.roomAdImageReady);
         }
      }
      
      private function roomAdImageReady(param1:AssetLoaderEvent) : void
      {
         var _loc4_:* = null;
         var _loc2_:AssetLoaderStruct = param1.target as AssetLoaderStruct;
         var _loc3_:Bitmap = _loc2_.assetLoader.content as Bitmap;
         if(this.isValidAdImage(_loc3_))
         {
            _loc4_ = this.emulateBackgroundTransparency(_loc3_.bitmapData);
            events.dispatchEvent(new AdEvent(AdEvent.const_518,0,0,_loc4_,_loc2_.assetName,this.var_1654,this.var_1088,this.var_1089));
         }
      }
      
      private function adWarningLeftReady(param1:AssetLoaderEvent) : void
      {
         var _loc2_:AssetLoaderStruct = param1.target as AssetLoaderStruct;
         var _loc3_:Bitmap = _loc2_.assetLoader.content as Bitmap;
         if(_loc3_ != null)
         {
            this.var_1088 = this.emulateBackgroundTransparency(_loc3_.bitmapData);
         }
      }
      
      private function adWarningRightReady(param1:AssetLoaderEvent) : void
      {
         var _loc2_:AssetLoaderStruct = param1.target as AssetLoaderStruct;
         var _loc3_:Bitmap = _loc2_.assetLoader.content as Bitmap;
         if(_loc3_ != null)
         {
            this.var_1089 = this.emulateBackgroundTransparency(_loc3_.bitmapData);
         }
      }
      
      private function emulateBackgroundTransparency(param1:BitmapData) : BitmapData
      {
         var _loc4_:int = 0;
         var _loc5_:* = 0;
         if(param1 == null)
         {
            return null;
         }
         var _loc2_:BitmapData = new BitmapData(param1.width,param1.height,true,0);
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_.height)
         {
            _loc4_ = 0;
            while(_loc4_ < _loc2_.width)
            {
               _loc5_ = uint(param1.getPixel32(_loc4_,_loc3_));
               if(_loc5_ != 4294967295)
               {
                  _loc2_.setPixel32(_loc4_,_loc3_,_loc5_);
               }
               _loc4_++;
            }
            _loc3_++;
         }
         return _loc2_;
      }
      
      private function isValidAdImage(param1:Bitmap) : Boolean
      {
         if(param1 != null && (param1.width > 1 || param1.height > 1))
         {
            return true;
         }
         return false;
      }
      
      public function loadRoomAdImage(param1:int, param2:int, param3:String, param4:String) : void
      {
         if(events != null)
         {
            events.dispatchEvent(new AdImageEvent(AdImageEvent.ROOM_AD_LOAD_IMAGE,param3,param4,param1,param2));
         }
      }
      
      private function onLoadAdImage(param1:Event) : void
      {
         if(param1 is AdImageEvent)
         {
            this.loadImageAsset(param1 as AdImageEvent);
         }
      }
      
      private function loadImageAsset(param1:AdImageEvent) : void
      {
         var _loc6_:* = null;
         var _loc7_:* = null;
         var _loc8_:* = null;
         if(param1 == null)
         {
            return;
         }
         if(param1.imageUrl == null || param1.imageUrl == "")
         {
            return;
         }
         var _loc2_:String = param1.imageUrl;
         if(assets.hasAsset(_loc2_))
         {
            _loc6_ = assets.getAssetByName(_loc2_);
            if(_loc6_ != null)
            {
               _loc7_ = _loc6_.content;
               if(_loc7_ is BitmapData)
               {
                  this.dispatchImageAsset(_loc6_.content as BitmapData,param1);
                  return;
               }
            }
         }
         var _loc3_:Array = this.var_585.getValue(_loc2_);
         if(_loc3_ == null)
         {
            _loc3_ = new Array();
            this.var_585.add(_loc2_,_loc3_);
         }
         if(_loc3_.length > 0)
         {
            for each(_loc8_ in _loc3_)
            {
               if(_loc8_.objectId == param1.objectId)
               {
                  return;
               }
            }
         }
         _loc3_.push(param1);
         Logger.log("trying to load billboard from url " + _loc2_);
         var _loc4_:URLRequest = new URLRequest(_loc2_);
         var _loc5_:AssetLoaderStruct = assets.loadAssetFromFile(_loc2_,_loc4_,"image/png");
         _loc5_.addEventListener(AssetLoaderEvent.const_29,this.onBillboardImageReady);
         _loc5_.addEventListener(AssetLoaderEvent.const_48,this.onBillboardImageLoadError);
      }
      
      private function onBillboardImageReady(param1:AssetLoaderEvent) : void
      {
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc2_:AssetLoaderStruct = param1.target as AssetLoaderStruct;
         var _loc3_:Bitmap = _loc2_.assetLoader.content as Bitmap;
         var _loc4_:Array = this.var_585.remove(_loc2_.assetName);
         if(_loc4_ == null || _loc4_.length == 0)
         {
            return;
         }
         Logger.log("billboard image loaded from url " + _loc2_.assetName);
         if(this.isValidAdImage(_loc3_))
         {
            _loc5_ = _loc3_.bitmapData;
            for each(_loc6_ in _loc4_)
            {
               this.dispatchImageAsset(_loc5_,_loc6_);
            }
         }
      }
      
      private function dispatchImageAsset(param1:BitmapData, param2:AdImageEvent) : void
      {
         if(events != null)
         {
            events.dispatchEvent(new AdEvent(AdEvent.const_917,param2.roomId,0,param1.clone(),param2.imageUrl,param2.clickUrl,null,null,param2.objectId));
         }
      }
      
      private function onBillboardImageLoadError(param1:AssetLoaderEvent) : void
      {
         var _loc5_:* = null;
         var _loc2_:AssetLoaderStruct = param1.target as AssetLoaderStruct;
         var _loc3_:Bitmap = _loc2_.assetLoader.content as Bitmap;
         var _loc4_:Array = this.var_585.remove(_loc2_.assetName);
         if(_loc4_ == null || _loc4_.length == 0)
         {
            return;
         }
         for each(_loc5_ in _loc4_)
         {
            Logger.log("failed to load billboard image from url \'" + _loc2_.assetName + "\'");
            events.dispatchEvent(new AdEvent(AdEvent.const_722,_loc5_.roomId,0,null,_loc5_.imageUrl,_loc5_.clickUrl,null,null,_loc5_.objectId));
         }
      }
   }
}

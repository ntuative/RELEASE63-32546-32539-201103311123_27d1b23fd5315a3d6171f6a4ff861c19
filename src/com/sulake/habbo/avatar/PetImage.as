package com.sulake.habbo.avatar
{
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.habbo.avatar.actions.ActiveActionData;
   import com.sulake.habbo.avatar.actions.IActiveActionData;
   import com.sulake.habbo.avatar.alias.AssetAliasCollection;
   import com.sulake.habbo.avatar.animation.Animation;
   import com.sulake.habbo.avatar.animation.IAnimationLayerData;
   import com.sulake.habbo.avatar.animation.IAvatarDataContainer;
   import com.sulake.habbo.avatar.animation.ISpriteDataContainer;
   import com.sulake.habbo.avatar.cache.AvatarImageBodyPartCache;
   import com.sulake.habbo.avatar.cache.AvatarImageCache;
   import com.sulake.habbo.avatar.enum.AvatarAction;
   import com.sulake.habbo.avatar.enum.AvatarDirectionAngle;
   import com.sulake.habbo.avatar.enum.AvatarScaleType;
   import com.sulake.habbo.avatar.enum.AvatarSetType;
   import com.sulake.habbo.avatar.pets.IPetData;
   import com.sulake.habbo.avatar.structure.AvatarCanvas;
   import com.sulake.habbo.avatar.structure.figure.FigurePart;
   import com.sulake.habbo.avatar.structure.figure.IFigurePartSet;
   import com.sulake.habbo.avatar.structure.figure.IPartColor;
   import com.sulake.habbo.avatar.structure.figure.ISetType;
   import flash.display.BitmapData;
   import flash.filters.ColorMatrixFilter;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.utils.getTimer;
   
   public class PetImage implements IAvatarImage, IDisposable
   {
      
      private static const CHANNELS_EQUAL:String = "CHANNELS_EQUAL";
      
      private static const CHANNELS_UNIQUE:String = "CHANNELS_UNIQUE";
      
      private static const CHANNELS_RED:String = "CHANNELS_RED";
      
      private static const CHANNELS_GREEN:String = "CHANNELS_GREEN";
      
      private static const CHANNELS_BLUE:String = "CHANNELS_BLUE";
      
      private static const CHANNELS_SATURATED:String = "CHANNELS_SATURATED";
      
      private static const const_1282:String = "Default";
      
      private static const const_1283:int = 2;
      
      private static const const_1281:String = AvatarSetType.const_36;
       
      
      protected var _structure:AvatarStructure;
      
      protected var _scale:String;
      
      protected var var_90:int;
      
      protected var var_283:IActiveActionData;
      
      protected var var_820:Boolean;
      
      private var var_907:IActiveActionData;
      
      private var _assets:AssetAliasCollection;
      
      private var var_244:AvatarImageCache;
      
      private var var_571:int = 0;
      
      private var var_1588:int = 0;
      
      private var var_617:AvatarFigureContainer;
      
      private var var_572:Boolean;
      
      private var var_207:Array;
      
      private var var_562:IAvatarDataContainer;
      
      private var var_333:Array;
      
      private var var_45:BitmapData;
      
      private var var_906:Boolean;
      
      private var var_696:Array;
      
      private var var_1328:Boolean = false;
      
      private var var_1392:int = 0;
      
      private var var_1086:int;
      
      private var var_1652:int;
      
      private var var_1393:Array;
      
      private var var_1326:String;
      
      private var var_478:String;
      
      private var var_2923:int;
      
      private var var_2924:int;
      
      public function PetImage(param1:AvatarStructure, param2:AssetAliasCollection, param3:String, param4:String)
      {
         this.var_333 = [];
         this.var_696 = new Array();
         super();
         this.var_572 = true;
         this._structure = param1;
         this._assets = param2;
         this._scale = param4;
         if(this._scale == null)
         {
            this._scale = AvatarScaleType.const_53;
         }
         if(param3 == null || param3 == "")
         {
            param3 = "phd-1-5.pbd-1-5.ptl-1-5";
            Logger.log("Using default pet figure");
         }
         this.var_617 = new AvatarFigureContainer(param3);
         var _loc5_:int = this.var_617.getPartSetId("pbd");
         this.solvePetAvatarTypeAndBreed(_loc5_);
         this.var_1392 = this.var_1086;
         this.var_244 = new AvatarImageCache(this._structure,this,this._assets,this._scale);
         this.setDirection(const_1281,const_1283);
         this.var_333 = new Array();
         this.var_907 = new ActiveActionData(AvatarAction.const_378);
         this.var_907.definition = this._structure.getActionDefinition(const_1282);
         this.resetActions();
      }
      
      public function dispose() : void
      {
         var _loc1_:* = null;
         if(!this.var_820)
         {
            this._structure = null;
            this._assets = null;
            this.var_244 = null;
            this.var_283 = null;
            this.var_617 = null;
            this.var_562 = null;
            this.var_333 = null;
            if(this.var_45)
            {
               this.var_45.dispose();
            }
            _loc1_ = this.getCache();
            if(_loc1_)
            {
               _loc1_.dispose();
               _loc1_ = null;
            }
            this.var_45 = null;
            this.var_696 = null;
            this.var_820 = true;
         }
      }
      
      public function get disposed() : Boolean
      {
         return this.var_820;
      }
      
      public function getFigure() : IAvatarFigureContainer
      {
         return this.var_617;
      }
      
      public function getScale() : String
      {
         return this._scale;
      }
      
      public function getSubType() : int
      {
         return this.var_1392;
      }
      
      public function getPartColor(param1:String) : IPartColor
      {
         return this._structure.getPartColor(this.var_617,param1);
      }
      
      public function setDirection(param1:String, param2:int) : void
      {
         var _loc3_:* = null;
         param2 += this.var_1588;
         if(param2 < AvatarDirectionAngle.const_1068)
         {
            param2 = AvatarDirectionAngle.const_283 + (param2 + 1);
         }
         if(param2 > AvatarDirectionAngle.const_283)
         {
            param2 -= NaN;
         }
         if(param1 == AvatarSetType.const_52)
         {
            if((this.var_90 == 6 || this.var_90 == 0) && param2 == 7)
            {
               param2 = this.var_90;
            }
            _loc3_ = this._structure.renderManager.petDataManager.getPetData(this.var_1392);
            if(_loc3_ != null)
            {
               if(_loc3_.disableHeadTurn)
               {
                  param2 = this.var_90;
               }
            }
         }
         if(this._structure.isMainAvatarSet(param1))
         {
            this.var_90 = param2;
         }
         this.getCache().setDirection(param1,param2);
         this.var_572 = true;
      }
      
      public function setDirectionAngle(param1:String, param2:int) : void
      {
         var _loc3_:int = 0;
         _loc3_ = param2 / 45;
         this.setDirection(param1,_loc3_);
      }
      
      public function getSprites() : Array
      {
         return this.var_207;
      }
      
      public function getCanvasOffsets() : Array
      {
         return this.var_696;
      }
      
      public function getLayerData(param1:ISpriteDataContainer) : IAnimationLayerData
      {
         return this._structure.getBodyPartData(param1.animation.id,this.var_571,param1.id);
      }
      
      public function updateAnimationByFrames(param1:int = 1) : void
      {
         this.var_571 += param1;
         this.var_572 = true;
      }
      
      public function getImage(param1:String, param2:Boolean) : BitmapData
      {
         var _loc8_:* = null;
         var _loc9_:* = null;
         var _loc10_:* = null;
         var _loc11_:* = null;
         var _loc12_:* = null;
         var _loc13_:* = null;
         var _loc14_:* = null;
         var _loc15_:* = null;
         var _loc16_:* = false;
         var _loc17_:int = 0;
         var _loc18_:* = null;
         var _loc19_:int = 0;
         var _loc20_:int = 0;
         var _loc21_:int = 0;
         var _loc22_:* = null;
         var _loc23_:* = null;
         if(!this.var_572)
         {
            return this.var_45;
         }
         if(this.var_283 == null)
         {
            return null;
         }
         if(!this.var_1328)
         {
            this.endActionAppends();
         }
         var _loc3_:AvatarImageCache = this.getCache();
         var _loc4_:AvatarCanvas = this._structure.getCanvas(this._scale,this.var_283.definition.geometryType);
         if(this.var_45 == null || _loc4_ != null && (this.var_45.width != _loc4_.width || this.var_45.height != _loc4_.height))
         {
            _loc4_ = this._structure.getCanvas(this._scale,this.var_283.definition.geometryType);
            if(_loc4_ == null)
            {
               return null;
            }
            this.var_45 = new BitmapData(_loc4_.width,_loc4_.height,true,16777215);
         }
         var _loc5_:Array = this._structure.getBodyParts(param1,this.var_283.definition.geometryType,this.var_90);
         this.var_45.lock();
         this.var_45.fillRect(this.var_45.rect,16777215);
         var _loc6_:Point = _loc4_.offset;
         if(_loc6_ == null)
         {
            _loc6_ = new Point(0,0);
         }
         var _loc7_:int = _loc5_.length - 1;
         while(_loc7_ >= 0)
         {
            _loc8_ = _loc5_[_loc7_];
            _loc9_ = _loc3_.getImageContainer(_loc8_,this.var_571);
            if(_loc9_ && _loc9_.image && _loc9_.regPoint)
            {
               _loc10_ = _loc9_.image;
               _loc11_ = _loc9_.regPoint.clone();
               _loc12_ = this.getCache().getBodyPartCache(_loc8_);
               _loc13_ = _loc12_.getAction();
               _loc14_ = _loc13_.definition.assetPartDefinition;
               _loc15_ = this._structure.getParts(_loc8_,this.var_617,_loc13_,"pet",_loc12_.getDirection(),[]);
               _loc16_ = this.var_1392 < 3;
               _loc17_ = !!_loc16_ ? 32 : 67;
               if(this._scale == AvatarScaleType.const_93)
               {
                  _loc17_ = !!_loc16_ ? 6 : 31;
               }
               if(_loc15_.length > 0)
               {
                  _loc18_ = _loc15_[0];
                  _loc19_ = _loc18_.getFrameIndex(this.var_571);
                  _loc20_ = this.var_90;
                  _loc21_ = 1;
                  switch(this.var_90)
                  {
                     case 4:
                        _loc20_ = 2;
                        _loc21_ = -1;
                        break;
                     case 5:
                        _loc20_ = 1;
                        _loc21_ = -1;
                        break;
                     case 6:
                        _loc20_ = 0;
                        _loc21_ = -1;
                  }
                  _loc22_ = this._structure.getPartActionOffset(this.getSubType(),this._scale,_loc8_,_loc14_,_loc19_,_loc20_);
                  if(_loc22_ != null)
                  {
                     _loc11_.x += _loc22_.x * _loc21_;
                     _loc11_.y += _loc22_.y;
                     if(this.var_90 == 7 && _loc12_.getDirection() == 6)
                     {
                        _loc11_.offset(-1 * _loc17_,0);
                     }
                     else if(this.var_90 == 4 && _loc12_.getDirection() == 3)
                     {
                        _loc11_.offset(_loc17_,0);
                     }
                     else if(this.var_90 == 3 && _loc12_.getDirection() == 4)
                     {
                        _loc11_.offset(-1 * _loc17_,0);
                     }
                     else if(this.var_90 == 6 && _loc12_.getDirection() == 7)
                     {
                        _loc11_.offset(_loc17_,0);
                     }
                  }
               }
               this.var_45.copyPixels(_loc10_,_loc10_.rect,_loc11_.add(_loc6_),null,null,true);
            }
            _loc7_--;
         }
         this.var_45.unlock();
         this.var_572 = false;
         if(this.var_562 != null)
         {
            if(this.var_562.paletteIsGrayscale)
            {
               _loc23_ = this.convertToGrayscale(this.var_45);
               if(this.var_45)
               {
                  this.var_45.dispose();
               }
               this.var_45 = _loc23_;
               this.var_45.paletteMap(this.var_45,this.var_45.rect,new Point(0,0),this.var_562.reds,[],[]);
            }
            else
            {
               this.var_45.copyChannel(this.var_45,this.var_45.rect,new Point(0,0),2,8);
            }
         }
         if(this.var_45 && param2)
         {
            return this.var_45.clone();
         }
         return this.var_45;
      }
      
      public function getCroppedImage(param1:String) : BitmapData
      {
         var _loc6_:* = null;
         var _loc9_:* = null;
         var _loc10_:* = null;
         var _loc11_:* = null;
         var _loc12_:* = null;
         var _loc13_:* = null;
         var _loc14_:* = null;
         var _loc15_:* = null;
         var _loc16_:* = null;
         var _loc17_:int = 0;
         var _loc18_:* = null;
         var _loc19_:* = null;
         var _loc20_:int = 0;
         var _loc21_:int = 0;
         var _loc22_:int = 0;
         var _loc23_:* = null;
         if(this.var_283 == null)
         {
            return null;
         }
         var _loc2_:AvatarImageCache = this.getCache();
         var _loc3_:AvatarCanvas = this._structure.getCanvas(this._scale,this.var_283.definition.geometryType);
         if(_loc3_ == null)
         {
            return null;
         }
         var _loc4_:BitmapData = new BitmapData(_loc3_.width,_loc3_.height,true,16777215);
         var _loc5_:Array = this._structure.getBodyParts(param1,this.var_283.definition.geometryType,this.var_90);
         var _loc7_:int = _loc5_.length - 1;
         while(_loc7_ >= 0)
         {
            _loc9_ = _loc5_[_loc7_];
            _loc10_ = _loc2_.getImageContainer(_loc9_,this.var_571);
            if(_loc10_ != null)
            {
               _loc11_ = _loc10_.image;
               if(_loc11_ == null)
               {
                  _loc4_.dispose();
                  return null;
               }
               _loc12_ = _loc10_.regPoint.clone();
               _loc13_ = this.getCache().getBodyPartCache(_loc9_);
               _loc14_ = _loc13_.getAction();
               _loc15_ = _loc14_.definition.assetPartDefinition;
               _loc16_ = this._structure.getParts(_loc9_,this.var_617,_loc14_,"pet",_loc13_.getDirection(),[]);
               _loc17_ = 32;
               if(this._scale == AvatarScaleType.const_93)
               {
                  _loc17_ = 6;
               }
               if(_loc16_.length > 0)
               {
                  _loc19_ = _loc16_[0];
                  _loc20_ = _loc19_.getFrameIndex(this.var_571);
                  _loc21_ = this.var_90;
                  _loc22_ = 1;
                  switch(this.var_90)
                  {
                     case 4:
                        _loc21_ = 2;
                        _loc22_ = -1;
                        break;
                     case 5:
                        _loc21_ = 1;
                        _loc22_ = -1;
                        break;
                     case 6:
                        _loc21_ = 0;
                        _loc22_ = -1;
                  }
                  _loc23_ = this._structure.getPartActionOffset(this.getSubType(),this._scale,_loc9_,_loc15_,_loc20_,_loc21_);
                  if(_loc23_ != null)
                  {
                     _loc12_.x += _loc23_.x * _loc22_;
                     _loc12_.y += _loc23_.y;
                     if(this.var_90 == 7 && _loc13_.getDirection() == 6)
                     {
                        _loc12_.offset(-1 * _loc17_,0);
                     }
                     else if(this.var_90 == 4 && _loc13_.getDirection() == 3)
                     {
                        _loc12_.offset(_loc17_,0);
                     }
                     else if(this.var_90 == 3 && _loc13_.getDirection() == 4)
                     {
                        _loc12_.offset(-1 * _loc17_,0);
                     }
                     else if(this.var_90 == 6 && _loc13_.getDirection() == 7)
                     {
                        _loc12_.offset(_loc17_,0);
                     }
                  }
               }
               _loc4_.copyPixels(_loc11_,_loc11_.rect,_loc12_,null,null,true);
               _loc18_ = new Rectangle(_loc12_.x,_loc12_.y,_loc11_.width,_loc11_.height);
               if(_loc6_ == null)
               {
                  _loc6_ = _loc18_;
               }
               else
               {
                  _loc6_ = _loc6_.union(_loc18_);
               }
            }
            _loc7_--;
         }
         if(_loc6_ == null)
         {
            _loc6_ = new Rectangle(0,0,1,1);
         }
         var _loc8_:BitmapData = new BitmapData(_loc6_.width,_loc6_.height,true,16777215);
         _loc8_.copyPixels(_loc4_,_loc6_,new Point(0,0),null,null,true);
         _loc4_.dispose();
         return _loc8_;
      }
      
      public function getAsset(param1:String) : BitmapDataAsset
      {
         return this._assets.getAssetByName(param1) as BitmapDataAsset;
      }
      
      public function getDirection() : int
      {
         return this.var_90;
      }
      
      public function initActionAppends() : void
      {
         this.var_333 = new Array();
         this.var_1328 = false;
         this.var_478 = "";
      }
      
      public function endActionAppends() : void
      {
         this.sortActions();
         this.resetActions();
         this.setActionsToParts();
      }
      
      public function appendAction(param1:String, ... rest) : Boolean
      {
         var _loc3_:* = null;
         this.var_1328 = false;
         if(rest != null && rest.length > 0)
         {
            _loc3_ = rest[0];
         }
         this.var_478 = this.var_478 + param1 + _loc3_;
         switch(param1)
         {
            case AvatarAction.const_414:
               switch(_loc3_)
               {
                  case "wav":
                     this.addActionData("wave");
                     break;
                  case AvatarAction.const_932:
                  case AvatarAction.const_504:
                  case AvatarAction.const_864:
                  case AvatarAction.const_378:
                  case AvatarAction.const_1134:
                  case AvatarAction.const_1211:
                  case AvatarAction.const_1689:
                  case AvatarAction.const_1664:
                  case AvatarAction.const_1455:
                  case AvatarAction.const_1256:
                  case AvatarAction.const_1183:
                  case AvatarAction.const_1567:
                  case AvatarAction.const_1576:
                  case AvatarAction.const_1254:
                  case AvatarAction.const_727:
                     this.addActionData(_loc3_);
                     break;
                  default:
                     this.errorThis("appendAction() >> UNKNOWN POSTURE TYPE: " + _loc3_);
               }
               break;
            case AvatarAction.const_308:
               switch(_loc3_)
               {
                  case AvatarAction.const_784:
                  case AvatarAction.const_912:
                  case AvatarAction.const_445:
                  case AvatarAction.const_735:
                  case AvatarAction.const_768:
                  case AvatarAction.const_1171:
                  case AvatarAction.const_1156:
                  case AvatarAction.const_1221:
                  case AvatarAction.const_1065:
                  case AvatarAction.const_1083:
                     this.addActionData(_loc3_);
                     break;
                  default:
                     this.errorThis("appendAction() >> UNKNOWN GESTURE TYPE: " + _loc3_);
               }
               break;
            case AvatarAction.const_331:
            case AvatarAction.const_240:
            case AvatarAction.const_333:
            case AvatarAction.const_571:
               this.addActionData(param1,_loc3_);
               break;
            default:
               this.errorThis("appendAction() >> UNKNOWN ACTION TYPE: " + param1);
         }
         return true;
      }
      
      private function addActionData(param1:String, param2:String = "") : void
      {
         var _loc3_:* = null;
         if(this.var_333 == null)
         {
            this.var_333 = new Array();
         }
         var _loc4_:int = 0;
         while(_loc4_ < this.var_333.length)
         {
            _loc3_ = this.var_333[_loc4_];
            if(_loc3_.actionType == param1 && _loc3_.actionParameter == param2)
            {
               return;
            }
            _loc4_++;
         }
         this.var_333.push(new ActiveActionData(param1,param2));
      }
      
      public function isAnimating() : Boolean
      {
         return this.var_906;
      }
      
      private function resetActions() : Boolean
      {
         this.var_906 = false;
         this.var_207 = [];
         this.var_562 = null;
         this.var_1588 = 0;
         this.var_283 = this.var_907;
         this.var_283.definition = this.var_907.definition;
         this.setActionToParts(this.var_907);
         this.getCache().resetBodyPartCache(this.var_907);
         return true;
      }
      
      private function sortActions() : void
      {
         this.var_1328 = true;
         if(this.var_1326 == this.var_478)
         {
            return;
         }
         this.var_1326 = this.var_478;
         this.var_1393 = this._structure.sortActions(this.var_333);
         if(this.var_1393 == null)
         {
            this.var_696 = new Array(0,0,0);
         }
         else
         {
            this.var_696 = this._structure.getCanvasOffsets(this.var_1393,this._scale,this.var_90);
         }
      }
      
      private function setActionsToParts() : void
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         for each(_loc1_ in this.var_1393)
         {
            if(!(!_loc1_ || !_loc1_.definition))
            {
               if(_loc1_.definition.isAnimation && _loc1_.actionParameter == "")
               {
                  _loc1_.actionParameter = "1";
               }
               this.setActionToParts(_loc1_);
               if(_loc1_.definition.isAnimation)
               {
                  this.var_906 = true;
                  _loc2_ = this._structure.getAnimation(_loc1_.definition.state + "." + _loc1_.actionParameter);
                  if(_loc2_ != null)
                  {
                     this.var_207 = this.var_207.concat(_loc2_.spriteData);
                     if(_loc2_.hasDirectionData())
                     {
                        this.var_1588 = _loc2_.directionData.offset;
                     }
                     if(_loc2_.hasAvatarData())
                     {
                        this.var_562 = _loc2_.avatarData;
                     }
                  }
               }
               if(_loc1_.actionType == AvatarAction.const_372)
               {
                  this.var_906 = true;
               }
               if(_loc1_.actionType == AvatarAction.const_240)
               {
                  this.var_906 = true;
               }
               if(_loc1_.actionType == AvatarAction.const_331)
               {
                  this.var_906 = true;
               }
            }
         }
      }
      
      private function getCache() : AvatarImageCache
      {
         if(this.var_244 == null)
         {
            this.var_244 = new AvatarImageCache(this._structure,this,this._assets,this._scale);
         }
         return this.var_244;
      }
      
      private function setActionToParts(param1:IActiveActionData) : void
      {
         if(param1 == null)
         {
            return;
         }
         if(param1.definition.assetPartDefinition == "")
         {
            return;
         }
         if(param1.definition.isMain)
         {
            this.var_283 = param1;
            this.getCache().setGeometryType(param1.definition.geometryType);
         }
         this.getCache().setAction(param1,getTimer());
         this.var_572 = true;
      }
      
      public function get avatarSpriteData() : IAvatarDataContainer
      {
         return this.var_562;
      }
      
      private function convertToGrayscale(param1:BitmapData, param2:String = "CHANNELS_EQUAL") : BitmapData
      {
         var _loc3_:* = 0.33;
         var _loc4_:* = 0.33;
         var _loc5_:* = 0.33;
         switch(param2)
         {
            case "CHANNELS_UNIQUE":
               _loc3_ = 0.3;
               _loc4_ = 0.59;
               _loc5_ = 0.11;
               break;
            case "CHANNELS_RED":
               _loc3_ = 1;
               _loc4_ = 0;
               _loc5_ = 0;
               break;
            case "CHANNELS_GREEN":
               _loc3_ = 0;
               _loc4_ = 1;
               _loc5_ = 0;
               break;
            case "CHANNELS_BLUE":
               _loc3_ = 0;
               _loc4_ = 0;
               _loc5_ = 1;
               break;
            case "CHANNELS_DESATURATED":
               _loc3_ = 0.3086;
               _loc4_ = 0.6094;
               _loc5_ = 0.082;
         }
         var _loc7_:Array = [_loc3_,_loc4_,_loc5_,0,0,_loc3_,_loc4_,_loc5_,0,0,_loc3_,_loc4_,_loc5_,0,0,0,0,0,1,0];
         var _loc8_:ColorMatrixFilter = new ColorMatrixFilter(_loc7_);
         var _loc9_:BitmapData = new BitmapData(param1.width,param1.height,param1.transparent,4294967295);
         _loc9_.copyPixels(param1,param1.rect,new Point(0,0),null,null,false);
         _loc9_.applyFilter(_loc9_,_loc9_.rect,new Point(0,0),_loc8_);
         return _loc9_;
      }
      
      private function errorThis(param1:String) : void
      {
         Logger.log("[PetImageError] " + param1);
      }
      
      private function logThis(param1:String) : void
      {
      }
      
      private function solvePetAvatarTypeAndBreed(param1:int) : void
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         this.var_1086 = 0;
         this.var_1652 = 0;
         var _loc2_:ISetType = this._structure.figureData.getSetType("pbd");
         if(_loc2_ != null)
         {
            _loc3_ = _loc2_.getPartSet(param1);
            if(_loc3_ != null)
            {
               for each(_loc4_ in _loc3_.parts)
               {
                  if(_loc4_.type == "pbd")
                  {
                     this.var_1086 = _loc4_.id;
                     this.var_1652 = _loc4_.breed;
                     break;
                  }
               }
            }
         }
      }
      
      public function get petType() : int
      {
         return this.var_1086;
      }
      
      public function get petBreed() : int
      {
         return this.var_1652;
      }
      
      public function isPlaceholder() : Boolean
      {
         return false;
      }
   }
}

package com.sulake.habbo.room.object.visualization.avatar
{
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.utils.Map;
   import com.sulake.habbo.avatar.IAvatarImage;
   import com.sulake.habbo.avatar.IAvatarImageListener;
   import com.sulake.habbo.avatar.animation.IAnimationLayerData;
   import com.sulake.habbo.avatar.animation.ISpriteDataContainer;
   import com.sulake.habbo.avatar.enum.AvatarAction;
   import com.sulake.habbo.avatar.enum.AvatarSetType;
   import com.sulake.habbo.room.object.RoomObjectVariableEnum;
   import com.sulake.room.object.IRoomObject;
   import com.sulake.room.object.IRoomObjectModel;
   import com.sulake.room.object.visualization.IRoomObjectSprite;
   import com.sulake.room.object.visualization.IRoomObjectVisualizationData;
   import com.sulake.room.object.visualization.RoomObjectSpriteVisualization;
   import com.sulake.room.utils.IRoomGeometry;
   import flash.display.BitmapData;
   import flash.display.BlendMode;
   
   public class AvatarVisualization extends RoomObjectSpriteVisualization implements IAvatarImageListener
   {
      
      private static const const_976:String = "avatar";
      
      private static const const_617:Number = -0.01;
      
      private static const const_616:Number = -0.409;
      
      private static const const_977:int = 2;
      
      private static const const_1355:Array = [0,0,0];
      
      private static const const_1354:int = 3;
       
      
      private var var_628:AvatarVisualizationData = null;
      
      private var var_524:Map;
      
      private var var_518:Map;
      
      private var var_1196:int = 0;
      
      private var var_906:Boolean;
      
      private var var_617:String;
      
      private var var_948:String;
      
      private var var_1195:int = 0;
      
      private var var_627:BitmapDataAsset;
      
      private var var_958:BitmapDataAsset;
      
      private var var_1803:int = -1;
      
      private var var_1806:int = -1;
      
      private var var_1807:int = -1;
      
      private const const_975:int = 0;
      
      private const const_1785:int = 1;
      
      private const const_1780:int = 2;
      
      private const const_1781:int = 3;
      
      private const const_1356:int = 4;
      
      private var var_1598:int = -1;
      
      private var var_261:String = "";
      
      private var _postureParameter:String = "";
      
      private var var_1808:Boolean = false;
      
      private var var_1805:Boolean = false;
      
      private var var_1809:Boolean = false;
      
      private var var_1454:Boolean = false;
      
      private var var_659:Boolean = false;
      
      private var var_1457:int = 0;
      
      private var var_1455:int = 0;
      
      private var var_2530:int = 0;
      
      private var var_768:int = 0;
      
      private var var_769:int = 0;
      
      private var var_626:int = 0;
      
      private var var_1456:int = 0;
      
      private var var_1178:Boolean = false;
      
      private var var_1804:Boolean = false;
      
      private var var_1177:int = 0;
      
      private var var_770:int = 0;
      
      private var var_1810:Boolean = false;
      
      private var var_1176:int = 0;
      
      private var var_60:IAvatarImage = null;
      
      private var var_820:Boolean;
      
      public function AvatarVisualization()
      {
         super();
         this.var_524 = new Map();
         this.var_518 = new Map();
         this.var_906 = false;
      }
      
      override public function dispose() : void
      {
         if(this.var_524 != null)
         {
            this.resetImages();
            this.var_524.dispose();
            this.var_518.dispose();
            this.var_524 = null;
         }
         this.var_628 = null;
         this.var_627 = null;
         this.var_958 = null;
         super.dispose();
         this.var_820 = true;
      }
      
      public function get disposed() : Boolean
      {
         return this.var_820;
      }
      
      override public function initialize(param1:IRoomObjectVisualizationData) : Boolean
      {
         this.var_628 = param1 as AvatarVisualizationData;
         createSprites(this.const_1356);
         return true;
      }
      
      private function updateModel(param1:IRoomObjectModel, param2:Number, param3:Boolean) : Boolean
      {
         var _loc4_:Boolean = false;
         var _loc5_:* = false;
         var _loc6_:int = 0;
         var _loc7_:* = null;
         var _loc8_:* = null;
         if(param1.getUpdateID() != var_177)
         {
            _loc4_ = false;
            _loc5_ = false;
            _loc6_ = 0;
            _loc7_ = "";
            _loc5_ = Boolean(param1.getNumber(RoomObjectVariableEnum.const_223) > 0 && param3);
            if(_loc5_ != this.var_1808)
            {
               this.var_1808 = _loc5_;
               _loc4_ = true;
            }
            _loc5_ = param1.getNumber(RoomObjectVariableEnum.const_396) > 0;
            if(_loc5_ != this.var_1805)
            {
               this.var_1805 = _loc5_;
               _loc4_ = true;
            }
            _loc5_ = param1.getNumber(RoomObjectVariableEnum.const_374) > 0;
            if(_loc5_ != this.var_1809)
            {
               this.var_1809 = _loc5_;
               _loc4_ = true;
            }
            _loc5_ = Boolean(param1.getNumber(RoomObjectVariableEnum.const_897) > 0 && param3);
            if(_loc5_ != this.var_1454)
            {
               this.var_1454 = _loc5_;
               _loc4_ = true;
            }
            _loc5_ = param1.getNumber(RoomObjectVariableEnum.const_1228) > 0;
            if(_loc5_ != this.var_659)
            {
               this.var_659 = _loc5_;
               _loc4_ = true;
               this.updateTypingBubble(param2);
            }
            _loc6_ = param1.getNumber(RoomObjectVariableEnum.const_129);
            if(_loc6_ != this.var_1457)
            {
               this.var_1457 = _loc6_;
               _loc4_ = true;
            }
            _loc7_ = param1.getString(RoomObjectVariableEnum.const_273);
            if(_loc7_ != this.var_261)
            {
               this.var_261 = _loc7_;
               _loc4_ = true;
            }
            _loc7_ = param1.getString(RoomObjectVariableEnum.const_713);
            if(_loc7_ != this._postureParameter)
            {
               this._postureParameter = _loc7_;
               _loc4_ = true;
            }
            _loc6_ = param1.getNumber(RoomObjectVariableEnum.const_1045);
            if(_loc6_ != this.var_1455)
            {
               this.var_1455 = _loc6_;
               _loc4_ = true;
            }
            _loc6_ = param1.getNumber(RoomObjectVariableEnum.const_507);
            if(_loc6_ != this.var_768)
            {
               this.var_768 = _loc6_;
               _loc4_ = true;
            }
            _loc6_ = param1.getNumber(RoomObjectVariableEnum.const_580);
            if(_loc6_ != this.var_769)
            {
               this.var_769 = _loc6_;
               _loc4_ = true;
            }
            _loc6_ = param1.getNumber(RoomObjectVariableEnum.const_354);
            if(_loc6_ != this.var_626)
            {
               this.var_626 = _loc6_;
               _loc4_ = true;
            }
            _loc6_ = param1.getNumber(RoomObjectVariableEnum.const_184);
            if(_loc6_ != this.var_1803)
            {
               this.var_1803 = _loc6_;
               _loc4_ = true;
            }
            if(this.var_769 > 0 && param1.getNumber(RoomObjectVariableEnum.const_354) > 0)
            {
               if(this.var_626 != this.var_769)
               {
                  this.var_626 = this.var_769;
                  _loc4_ = true;
               }
            }
            else if(this.var_626 != 0)
            {
               this.var_626 = 0;
               _loc4_ = true;
            }
            _loc6_ = param1.getNumber(RoomObjectVariableEnum.const_766);
            if(_loc6_ != this.var_1177)
            {
               this.var_1177 = _loc6_;
               _loc4_ = true;
               this.updateNumberBubble(param2);
            }
            this.validateActions(param2);
            _loc7_ = param1.getString(RoomObjectVariableEnum.const_1198);
            if(_loc7_ != this.var_948)
            {
               this.var_948 = _loc7_;
               _loc4_ = true;
            }
            _loc8_ = param1.getString(RoomObjectVariableEnum.const_193);
            if(this.updateFigure(_loc8_))
            {
               _loc4_ = true;
            }
            var_177 = param1.getUpdateID();
            return _loc4_;
         }
         return false;
      }
      
      private function updateFigure(param1:String) : Boolean
      {
         if(this.var_617 != param1)
         {
            this.var_617 = param1;
            this.resetImages();
            return true;
         }
         return false;
      }
      
      private function resetImages() : void
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         for each(_loc1_ in this.var_524)
         {
            if(_loc1_)
            {
               _loc1_.dispose();
            }
         }
         for each(_loc1_ in this.var_518)
         {
            if(_loc1_)
            {
               _loc1_.dispose();
            }
         }
         this.var_524.reset();
         this.var_518.reset();
         this.var_60 = null;
         _loc2_ = getSprite(this.const_975);
         if(_loc2_ != null)
         {
            _loc2_.asset = null;
            _loc2_.alpha = 255;
         }
      }
      
      private function validateActions(param1:Number) : void
      {
         var _loc2_:int = 0;
         if(param1 < 48)
         {
            this.var_1454 = false;
         }
         if(this.var_261 == "sit" || this.var_261 == "lay")
         {
            this.var_1456 = param1 / 2;
         }
         else
         {
            this.var_1456 = 0;
         }
         this.var_1804 = false;
         this.var_1178 = false;
         if(this.var_261 == "lay")
         {
            this.var_1178 = true;
            _loc2_ = int(this._postureParameter);
            if(_loc2_ < 0)
            {
               this.var_1804 = true;
            }
         }
      }
      
      private function getAvatarImage(param1:Number, param2:int) : IAvatarImage
      {
         var _loc3_:* = null;
         var _loc4_:String = "avatarImage" + param1.toString();
         if(param2 == 0)
         {
            _loc3_ = this.var_524.getValue(_loc4_) as IAvatarImage;
         }
         else
         {
            _loc4_ += "-" + param2;
            _loc3_ = this.var_518.getValue(_loc4_) as IAvatarImage;
         }
         if(_loc3_ == null)
         {
            _loc3_ = this.var_628.getAvatar(this.var_617,param1,this.var_948,this);
            if(_loc3_ != null)
            {
               if(param2 == 0)
               {
                  this.var_524.add(_loc4_,_loc3_);
               }
               else
               {
                  if(this.var_518.length >= const_1354)
                  {
                     this.var_518.remove(this.var_518.getKeys().shift());
                  }
                  this.var_518.add(_loc4_,_loc3_);
               }
            }
         }
         return _loc3_;
      }
      
      private function updateObject(param1:IRoomObject, param2:IRoomGeometry, param3:Boolean, param4:Boolean = false) : Boolean
      {
         var _loc5_:Boolean = false;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         if(param4 || var_474 != param1.getUpdateID() || this.var_1598 != param2.updateId)
         {
            _loc5_ = param3;
            _loc6_ = param1.getDirection().x - param2.direction.x;
            _loc6_ = (_loc6_ % 360 + 360) % 360;
            _loc7_ = this.var_1803;
            if(this.var_261 == "float")
            {
               _loc7_ = _loc6_;
            }
            else
            {
               _loc7_ -= param2.direction.x;
            }
            _loc7_ = (_loc7_ % 360 + 360) % 360;
            if(_loc6_ != this.var_1806 || param4)
            {
               _loc5_ = true;
               this.var_1806 = _loc6_;
               _loc6_ -= 112.5;
               _loc6_ = (_loc6_ + 360) % 360;
               this.var_60.setDirectionAngle(AvatarSetType.const_36,_loc6_);
            }
            if(_loc7_ != this.var_1807 || param4)
            {
               _loc5_ = true;
               this.var_1807 = _loc7_;
               if(this.var_1807 != this.var_1806)
               {
                  _loc7_ -= 112.5;
                  _loc7_ = (_loc7_ + 360) % 360;
                  this.var_60.setDirectionAngle(AvatarSetType.const_52,_loc7_);
               }
            }
            var_474 = param1.getUpdateID();
            this.var_1598 = param2.updateId;
            return _loc5_;
         }
         return false;
      }
      
      private function updateShadow(param1:Number) : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc2_:IRoomObjectSprite = getSprite(this.const_1785);
         this.var_627 = null;
         if(this.var_261 == "mv" || this.var_261 == "std")
         {
            _loc2_.visible = true;
            if(this.var_627 == null || param1 != var_91)
            {
               _loc3_ = 0;
               _loc4_ = 0;
               if(param1 < 48)
               {
                  this.var_627 = this.var_60.getAsset("sh_std_sd_1_0_0");
                  _loc3_ = -8;
                  _loc4_ = -3;
               }
               else
               {
                  this.var_627 = this.var_60.getAsset("h_std_sd_1_0_0");
                  _loc3_ = -17;
                  _loc4_ = -7;
               }
               if(this.var_627 != null)
               {
                  _loc2_.asset = this.var_627.content as BitmapData;
                  _loc2_.offsetX = _loc3_;
                  _loc2_.offsetY = _loc4_;
                  _loc2_.alpha = 50;
                  _loc2_.relativeDepth = 1;
               }
               else
               {
                  _loc2_.visible = false;
               }
            }
         }
         else
         {
            this.var_627 = null;
            _loc2_.visible = false;
         }
      }
      
      private function updateTypingBubble(param1:Number) : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         this.var_958 = null;
         var _loc2_:IRoomObjectSprite = getSprite(this.const_1780);
         if(this.var_659)
         {
            _loc2_.visible = true;
            _loc5_ = 64;
            if(param1 < 48)
            {
               this.var_958 = this.var_628.getAvatarRendererAsset("user_typing_small_png") as BitmapDataAsset;
               _loc3_ = 3;
               _loc4_ = -42;
               _loc5_ = 32;
            }
            else
            {
               this.var_958 = this.var_628.getAvatarRendererAsset("user_typing_png") as BitmapDataAsset;
               _loc3_ = 14;
               _loc4_ = -83;
            }
            if(this.var_261 == "sit")
            {
               _loc4_ += _loc5_ / 2;
            }
            else if(this.var_261 == "lay")
            {
               _loc4_ += _loc5_;
            }
            if(this.var_958 != null)
            {
               _loc2_.asset = this.var_958.content as BitmapData;
               _loc2_.offsetX = _loc3_;
               _loc2_.offsetY = _loc4_;
               _loc2_.relativeDepth = -0.02;
            }
         }
         else
         {
            _loc2_.visible = false;
         }
      }
      
      private function updateNumberBubble(param1:Number) : void
      {
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc2_:* = null;
         var _loc3_:IRoomObjectSprite = getSprite(this.const_1781);
         if(this.var_1177 > 0)
         {
            _loc6_ = 64;
            if(param1 < 48)
            {
               _loc2_ = this.var_628.getAvatarRendererAsset("number_" + this.var_1177 + "_small_png") as BitmapDataAsset;
               _loc4_ = -6;
               _loc5_ = -52;
               _loc6_ = 32;
            }
            else
            {
               _loc2_ = this.var_628.getAvatarRendererAsset("number_" + this.var_1177 + "_png") as BitmapDataAsset;
               _loc4_ = -8;
               _loc5_ = -105;
            }
            if(this.var_261 == "sit")
            {
               _loc5_ += _loc6_ / 2;
            }
            else if(this.var_261 == "lay")
            {
               _loc5_ += _loc6_;
            }
            if(_loc2_ != null)
            {
               _loc3_.visible = true;
               _loc3_.asset = _loc2_.content as BitmapData;
               _loc3_.offsetX = _loc4_;
               _loc3_.offsetY = _loc5_;
               _loc3_.relativeDepth = -0.01;
               this.var_770 = 1;
               this.var_1810 = true;
               this.var_1176 = 0;
               _loc3_.alpha = 0;
            }
            else
            {
               _loc3_.visible = false;
            }
         }
         else if(_loc3_.visible)
         {
            this.var_770 = -1;
         }
      }
      
      private function animateNumberBubble(param1:int) : Boolean
      {
         var _loc5_:int = 0;
         var _loc2_:IRoomObjectSprite = getSprite(this.const_1781);
         var _loc3_:int = _loc2_.alpha;
         var _loc4_:Boolean = false;
         if(this.var_1810)
         {
            ++this.var_1176;
            if(this.var_1176 < 10)
            {
               return false;
            }
            if(this.var_770 < 0)
            {
               if(param1 < 48)
               {
                  _loc2_.offsetY -= 2;
               }
               else
               {
                  _loc2_.offsetY -= 4;
               }
            }
            else
            {
               _loc5_ = 4;
               if(param1 < 48)
               {
                  _loc5_ = 8;
               }
               if(this.var_1176 % _loc5_ == 0)
               {
                  --_loc2_.offsetY;
                  _loc4_ = true;
               }
            }
         }
         if(this.var_770 > 0)
         {
            if(_loc3_ < 255)
            {
               _loc3_ += 32;
            }
            if(_loc3_ >= 255)
            {
               _loc3_ = 255;
               this.var_770 = 0;
            }
            _loc2_.alpha = _loc3_;
            return true;
         }
         if(this.var_770 < 0)
         {
            if(_loc3_ >= 0)
            {
               _loc3_ -= 32;
            }
            if(_loc3_ <= 0)
            {
               this.var_770 = 0;
               this.var_1810 = false;
               _loc3_ = 0;
               _loc2_.visible = false;
            }
            _loc2_.alpha = _loc3_;
            return true;
         }
         return _loc4_;
      }
      
      override public function update(param1:IRoomGeometry, param2:int, param3:Boolean, param4:Boolean) : void
      {
         var _loc16_:* = null;
         var _loc17_:* = null;
         var _loc18_:* = null;
         var _loc19_:int = 0;
         var _loc20_:* = null;
         var _loc21_:* = null;
         var _loc22_:* = null;
         var _loc23_:int = 0;
         var _loc24_:int = 0;
         var _loc25_:* = null;
         var _loc26_:int = 0;
         var _loc27_:int = 0;
         var _loc28_:int = 0;
         var _loc29_:int = 0;
         var _loc30_:int = 0;
         var _loc31_:* = null;
         var _loc32_:* = null;
         var _loc5_:IRoomObject = object;
         if(_loc5_ == null)
         {
            return;
         }
         if(param1 == null)
         {
            return;
         }
         if(this.var_628 == null)
         {
            return;
         }
         var _loc6_:IRoomObjectModel = _loc5_.getModel();
         var _loc7_:Number = param1.scale;
         var _loc8_:Boolean = false;
         var _loc9_:Boolean = false;
         var _loc10_:Boolean = false;
         var _loc11_:int = this.var_768;
         var _loc12_:Boolean = false;
         var _loc13_:Boolean = this.updateModel(_loc6_,_loc7_,param3);
         if(this.animateNumberBubble(_loc7_))
         {
            increaseUpdateId();
         }
         if(_loc13_ || _loc7_ != var_91 || this.var_60 == null)
         {
            if(_loc7_ != var_91)
            {
               _loc9_ = true;
               this.validateActions(_loc7_);
            }
            if(_loc11_ != this.var_768)
            {
               _loc12_ = true;
            }
            if(_loc9_ || this.var_60 == null || _loc12_)
            {
               this.var_60 = this.getAvatarImage(_loc7_,this.var_768);
               if(this.var_60 == null)
               {
                  return;
               }
               _loc8_ = true;
               _loc16_ = getSprite(this.const_975);
               if(_loc16_ && this.var_60 && this.var_60.isPlaceholder())
               {
                  _loc16_.alpha = 150;
               }
               else if(_loc16_)
               {
                  _loc16_.alpha = 255;
               }
            }
            if(this.var_60 == null)
            {
               return;
            }
            this.updateShadow(_loc7_);
            if(_loc9_)
            {
               this.updateTypingBubble(_loc7_);
               this.updateNumberBubble(_loc7_);
            }
            _loc10_ = this.updateObject(_loc5_,param1,param3,true);
            this.updateActions(this.var_60);
            var_91 = _loc7_;
         }
         else
         {
            _loc10_ = this.updateObject(_loc5_,param1,param3);
         }
         var _loc14_:Boolean = _loc10_ || _loc13_ || _loc9_;
         var _loc15_:Boolean = (this.var_906 || this.var_1195 > 0) && param3;
         if(_loc14_)
         {
            this.var_1195 = const_977;
         }
         if(_loc14_ || _loc15_)
         {
            increaseUpdateId();
            --this.var_1195;
            --this.var_1196;
            if(!(this.var_1196 <= 0 || _loc9_ || _loc13_ || _loc8_))
            {
               return;
            }
            this.var_60.updateAnimationByFrames(1);
            this.var_1196 = const_977;
            _loc18_ = this.var_60.getCanvasOffsets();
            if(_loc18_ == null || _loc18_.length < 3)
            {
               _loc18_ = const_1355;
            }
            _loc17_ = getSprite(this.const_975);
            if(_loc17_ != null)
            {
               _loc21_ = this.var_60.getImage(AvatarSetType.const_36,false);
               if(_loc21_ != null)
               {
                  _loc17_.asset = _loc21_;
               }
               if(_loc17_.asset)
               {
                  _loc17_.offsetX = -1 * _loc7_ / 2 + _loc18_[0];
                  _loc17_.offsetY = -_loc17_.asset.height + _loc7_ / 4 + _loc18_[1] + this.var_1456;
               }
               if(this.var_1178)
               {
                  if(this.var_1804)
                  {
                     _loc17_.relativeDepth = -0.5;
                  }
                  else
                  {
                     _loc17_.relativeDepth = const_616 + _loc18_[2];
                  }
               }
               else
               {
                  _loc17_.relativeDepth = const_617 + _loc18_[2];
               }
            }
            _loc17_ = getSprite(this.const_1780);
            if(_loc17_ != null && _loc17_.visible)
            {
               if(!this.var_1178)
               {
                  _loc17_.relativeDepth = const_617 - 0.01 + _loc18_[2];
               }
               else
               {
                  _loc17_.relativeDepth = const_616 - 0.01 + _loc18_[2];
               }
            }
            this.var_906 = this.var_60.isAnimating();
            _loc19_ = this.const_1356;
            for each(_loc20_ in this.var_60.getSprites())
            {
               if(_loc20_.id == const_976)
               {
                  _loc17_ = getSprite(this.const_975);
                  _loc22_ = this.var_60.getLayerData(_loc20_);
                  _loc23_ = _loc20_.getDirectionOffsetX(this.var_60.getDirection());
                  _loc24_ = _loc20_.getDirectionOffsetY(this.var_60.getDirection());
                  if(_loc22_ != null)
                  {
                     _loc23_ += _loc22_.dx;
                     _loc24_ += _loc22_.dy;
                  }
                  if(_loc7_ < 48)
                  {
                     _loc23_ /= 2;
                     _loc24_ /= 2;
                  }
                  _loc17_.offsetX += _loc23_;
                  _loc17_.offsetY += _loc24_;
               }
               else
               {
                  _loc17_ = getSprite(_loc19_);
                  if(_loc17_ != null)
                  {
                     _loc17_.capturesMouse = false;
                     _loc17_.visible = true;
                     _loc25_ = this.var_60.getLayerData(_loc20_);
                     _loc26_ = 0;
                     _loc27_ = _loc20_.getDirectionOffsetX(this.var_60.getDirection());
                     _loc28_ = _loc20_.getDirectionOffsetY(this.var_60.getDirection());
                     _loc29_ = _loc20_.getDirectionOffsetZ(this.var_60.getDirection());
                     _loc30_ = 0;
                     if(_loc20_.hasDirections)
                     {
                        _loc30_ = this.var_60.getDirection();
                     }
                     if(_loc25_ != null)
                     {
                        _loc26_ = _loc25_.animationFrame;
                        _loc27_ += _loc25_.dx;
                        _loc28_ += _loc25_.dy;
                        _loc30_ += _loc25_.directionOffset;
                     }
                     if(_loc7_ < 48)
                     {
                        _loc27_ /= 2;
                        _loc28_ /= 2;
                     }
                     if(_loc30_ < 0)
                     {
                        _loc30_ += 8;
                     }
                     else if(_loc30_ > 7)
                     {
                        _loc30_ -= 8;
                     }
                     _loc31_ = this.var_60.getScale() + "_" + _loc20_.member + "_" + _loc30_ + "_" + _loc26_;
                     _loc32_ = this.var_60.getAsset(_loc31_);
                     if(_loc32_ == null)
                     {
                        continue;
                     }
                     _loc17_.asset = _loc32_.content as BitmapData;
                     _loc17_.offsetX = -_loc32_.offset.x - _loc7_ / 2 + _loc27_;
                     _loc17_.offsetY = -_loc32_.offset.y + _loc28_ + this.var_1456;
                     if(this.var_1178)
                     {
                        _loc17_.relativeDepth = const_616 - 0.001 * spriteCount * _loc29_;
                     }
                     else
                     {
                        _loc17_.relativeDepth = const_617 - 0.001 * spriteCount * _loc29_;
                     }
                     if(_loc20_.ink == 33)
                     {
                        _loc17_.blendMode = BlendMode.ADD;
                     }
                     else
                     {
                        _loc17_.blendMode = BlendMode.NORMAL;
                     }
                  }
                  _loc19_++;
               }
            }
         }
      }
      
      private function updateActions(param1:IAvatarImage) : void
      {
         var _loc3_:* = null;
         if(param1 == null)
         {
            return;
         }
         param1.initActionAppends();
         param1.appendAction(AvatarAction.const_414,this.var_261,this._postureParameter);
         if(this.var_1457 > 0)
         {
            param1.appendAction(AvatarAction.const_308,AvatarAction.const_1571[this.var_1457]);
         }
         if(this.var_1455 > 0)
         {
            param1.appendAction(AvatarAction.const_640,this.var_1455);
         }
         if(this.var_2530 > 0)
         {
            param1.appendAction(AvatarAction.const_819,this.var_2530);
         }
         if(this.var_769 > 0)
         {
            param1.appendAction(AvatarAction.const_822,this.var_769);
         }
         if(this.var_626 > 0)
         {
            param1.appendAction(AvatarAction.const_820,this.var_626);
         }
         if(this.var_1808)
         {
            param1.appendAction(AvatarAction.const_331);
         }
         if(this.var_1809 || this.var_1454)
         {
            param1.appendAction(AvatarAction.const_571);
         }
         if(this.var_1805)
         {
            param1.appendAction(AvatarAction.const_240);
         }
         if(this.var_768 > 0)
         {
            param1.appendAction(AvatarAction.const_333,this.var_768);
         }
         param1.endActionAppends();
         this.var_906 = param1.isAnimating();
         var _loc2_:int = this.const_1356;
         for each(_loc3_ in this.var_60.getSprites())
         {
            if(_loc3_.id != const_976)
            {
               _loc2_++;
            }
         }
         if(_loc2_ != spriteCount)
         {
            createSprites(_loc2_);
         }
      }
      
      public function avatarImageReady(param1:String) : void
      {
         this.resetImages();
      }
   }
}

package com.sulake.core.window.utils
{
   import com.sulake.core.utils.Map;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.utils.getQualifiedClassName;
   
   public class PropertyStruct
   {
      
      public static const const_128:String = "hex";
      
      public static const const_42:String = "int";
      
      public static const const_254:String = "uint";
      
      public static const const_245:String = "Number";
      
      public static const const_37:String = "Boolean";
      
      public static const const_55:String = "String";
      
      public static const const_230:String = "Point";
      
      public static const const_261:String = "Rectangle";
      
      public static const const_147:String = "Array";
      
      public static const const_262:String = "Map";
       
      
      private var var_614:String;
      
      private var var_187:Object;
      
      private var _type:String;
      
      private var var_2441:Boolean;
      
      private var var_2895:Boolean;
      
      private var var_2442:Array;
      
      public function PropertyStruct(param1:String, param2:Object, param3:String, param4:Boolean, param5:Array = null)
      {
         super();
         this.var_614 = param1;
         this.var_187 = param2;
         this._type = param3;
         this.var_2441 = param4;
         this.var_2895 = param3 == const_262 || param3 == const_147 || param3 == const_230 || param3 == const_261;
         this.var_2442 = param5;
      }
      
      public function get key() : String
      {
         return this.var_614;
      }
      
      public function get value() : Object
      {
         return this.var_187;
      }
      
      public function get type() : String
      {
         return this._type;
      }
      
      public function get valid() : Boolean
      {
         return this.var_2441;
      }
      
      public function get range() : Array
      {
         return this.var_2442;
      }
      
      public function toString() : String
      {
         switch(this._type)
         {
            case const_128:
               return "0x" + uint(this.var_187).toString(16);
            case const_37:
               return Boolean(this.var_187) == true ? "com.sulake.room.object.logic" : "false";
            case const_230:
               return "Point(" + Point(this.var_187).x + ", " + Point(this.var_187).y + ")";
            case const_261:
               return "Rectangle(" + Rectangle(this.var_187).x + ", " + Rectangle(this.var_187).y + ", " + Rectangle(this.var_187).width + ", " + Rectangle(this.var_187).height + ")";
            default:
               return String(this.value);
         }
      }
      
      public function toXMLString() : String
      {
         var _loc1_:* = null;
         var _loc2_:int = 0;
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         switch(this._type)
         {
            case const_262:
               _loc3_ = this.var_187 as Map;
               _loc1_ = "<var key=\"" + this.var_614 + "\">\r<value>\r<" + this._type + ">\r";
               _loc2_ = 0;
               while(_loc2_ < _loc3_.length)
               {
                  _loc1_ += "<var key=\"" + _loc3_.getKey(_loc2_) + "\" value=\"" + _loc3_.getWithIndex(_loc2_) + "\" type=\"" + getQualifiedClassName(_loc3_.getWithIndex(_loc2_)) + "\" />\r";
                  _loc2_++;
               }
               _loc1_ += "</" + this._type + ">\r</value>\r</var>";
               break;
            case const_147:
               _loc4_ = this.var_187 as Array;
               _loc1_ = "<var key=\"" + this.var_614 + "\">\r<value>\r<" + this._type + ">\r";
               _loc2_ = 0;
               while(_loc2_ < _loc4_.length)
               {
                  _loc1_ += "<var key=\"" + String(_loc2_) + "\" value=\"" + _loc4_[_loc2_] + "\" type=\"" + getQualifiedClassName(_loc4_[_loc2_]) + "\" />\r";
                  _loc2_++;
               }
               _loc1_ += "</" + this._type + ">\r</value>\r</var>";
               break;
            case const_230:
               _loc5_ = this.var_187 as Point;
               _loc1_ = "<var key=\"" + this.var_614 + "\">\r<value>\r<" + this._type + ">\r";
               _loc1_ += "<var key=\"x\" value=\"" + _loc5_.x + "\" type=\"" + const_42 + "\" />\r";
               _loc1_ += "<var key=\"y\" value=\"" + _loc5_.y + "\" type=\"" + const_42 + "\" />\r";
               _loc1_ += "</" + this._type + ">\r</value>\r</var>";
               break;
            case const_261:
               _loc6_ = this.var_187 as Rectangle;
               _loc1_ = "<var key=\"" + this.var_614 + "\">\r<value>\r<" + this._type + ">\r";
               _loc1_ += "<var key=\"x\" value=\"" + _loc6_.x + "\" type=\"" + const_42 + "\" />\r";
               _loc1_ += "<var key=\"y\" value=\"" + _loc6_.y + "\" type=\"" + const_42 + "\" />\r";
               _loc1_ += "<var key=\"width\" value=\"" + _loc6_.width + "\" type=\"" + const_42 + "\" />\r";
               _loc1_ += "<var key=\"height\" value=\"" + _loc6_.height + "\" type=\"" + const_42 + "\" />\r";
               _loc1_ += "</" + this._type + ">\r</value>\r</var>";
               break;
            case const_128:
               _loc1_ = "<var key=\"" + this.var_614 + "\" value=\"" + "0x" + uint(this.var_187).toString(16) + "\" type=\"" + this._type + "\" />";
               break;
            default:
               _loc1_ = "<var key=\"" + this.var_614 + "\" value=\"" + this.var_187 + "\" type=\"" + this._type + "\" />";
         }
         return _loc1_;
      }
   }
}

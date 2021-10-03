package com.sulake.core.window.graphics.renderer
{
   import com.sulake.core.utils.Map;
   import flash.geom.Rectangle;
   
   public class SkinTemplateEntity implements ISkinTemplateEntity
   {
       
      
      protected var _id:uint;
      
      protected var _name:String;
      
      protected var _type:String;
      
      protected var var_1181:Rectangle;
      
      protected var var_2088:Map;
      
      protected var var_852:Array;
      
      public function SkinTemplateEntity(param1:String, param2:String, param3:uint, param4:Rectangle, param5:Map)
      {
         super();
         this._id = param3;
         this._name = param1;
         this._type = param2;
         this.var_1181 = param4;
         this.var_2088 = param5 == null ? new Map() : param5;
         this.var_852 = new Array();
      }
      
      public function get id() : uint
      {
         return this._id;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get type() : String
      {
         return this._type;
      }
      
      public function get tags() : Array
      {
         return this.var_852;
      }
      
      public function get region() : Rectangle
      {
         return this.var_1181;
      }
      
      public function getProperty(param1:String) : Object
      {
         return this.var_2088[param1];
      }
      
      public function setProperty(param1:String, param2:Object) : void
      {
         this.var_2088[param1] = param2;
      }
   }
}

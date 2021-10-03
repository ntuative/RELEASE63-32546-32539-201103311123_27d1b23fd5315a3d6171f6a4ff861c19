package com.sulake.habbo.navigator.domain
{
   import com.sulake.habbo.navigator.HabboNavigator;
   import com.sulake.habbo.navigator.mainview.MainViewCtrl;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.EventsTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.MyRoomsTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.OfficialTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.RoomsTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.SearchTabPageDecorator;
   
   public class Tabs
   {
      
      public static const const_416:int = 1;
      
      public static const const_234:int = 2;
      
      public static const const_317:int = 3;
      
      public static const const_403:int = 4;
      
      public static const const_266:int = 5;
      
      public static const const_407:int = 1;
      
      public static const const_816:int = 2;
      
      public static const const_812:int = 3;
      
      public static const const_844:int = 4;
      
      public static const const_227:int = 5;
      
      public static const const_846:int = 6;
      
      public static const const_677:int = 7;
      
      public static const const_233:int = 8;
      
      public static const const_392:int = 9;
      
      public static const const_1915:int = 10;
      
      public static const const_752:int = 11;
      
      public static const const_521:int = 12;
       
      
      private var var_445:Array;
      
      private var _navigator:HabboNavigator;
      
      public function Tabs(param1:HabboNavigator)
      {
         super();
         this._navigator = param1;
         this.var_445 = new Array();
         this.var_445.push(new Tab(this._navigator,const_416,const_521,new EventsTabPageDecorator(this._navigator),MainViewCtrl.const_440));
         this.var_445.push(new Tab(this._navigator,const_234,const_407,new RoomsTabPageDecorator(this._navigator),MainViewCtrl.const_440));
         this.var_445.push(new Tab(this._navigator,const_403,const_752,new OfficialTabPageDecorator(this._navigator),MainViewCtrl.const_1250));
         this.var_445.push(new Tab(this._navigator,const_317,const_227,new MyRoomsTabPageDecorator(this._navigator),MainViewCtrl.const_440));
         this.var_445.push(new Tab(this._navigator,const_266,const_233,new SearchTabPageDecorator(this._navigator),MainViewCtrl.const_657));
         this.setSelectedTab(const_416);
      }
      
      public function onFrontPage() : Boolean
      {
         return this.getSelected().id == const_403;
      }
      
      public function get tabs() : Array
      {
         return this.var_445;
      }
      
      public function setSelectedTab(param1:int) : void
      {
         this.clearSelected();
         this.getTab(param1).selected = true;
      }
      
      public function getSelected() : Tab
      {
         var _loc1_:* = null;
         for each(_loc1_ in this.var_445)
         {
            if(_loc1_.selected)
            {
               return _loc1_;
            }
         }
         return null;
      }
      
      private function clearSelected() : void
      {
         var _loc1_:* = null;
         for each(_loc1_ in this.var_445)
         {
            _loc1_.selected = false;
         }
      }
      
      public function getTab(param1:int) : Tab
      {
         var _loc2_:* = null;
         for each(_loc2_ in this.var_445)
         {
            if(_loc2_.id == param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
   }
}

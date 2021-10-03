package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class OfficialRoomEntryData implements IDisposable
   {
      
      public static const const_1201:int = 1;
      
      public static const const_832:int = 2;
      
      public static const const_753:int = 3;
      
      public static const const_1631:int = 4;
       
      
      private var _index:int;
      
      private var var_2197:String;
      
      private var var_2195:String;
      
      private var var_2199:Boolean;
      
      private var var_2194:String;
      
      private var var_915:String;
      
      private var var_2196:int;
      
      private var var_2198:int;
      
      private var _type:int;
      
      private var var_2163:String;
      
      private var var_882:GuestRoomData;
      
      private var var_881:PublicRoomData;
      
      private var _open:Boolean;
      
      private var _disposed:Boolean;
      
      public function OfficialRoomEntryData(param1:IMessageDataWrapper)
      {
         super();
         this._index = param1.readInteger();
         this.var_2197 = param1.readString();
         this.var_2195 = param1.readString();
         this.var_2199 = param1.readInteger() == 1;
         this.var_2194 = param1.readString();
         this.var_915 = param1.readString();
         this.var_2196 = param1.readInteger();
         this.var_2198 = param1.readInteger();
         this._type = param1.readInteger();
         if(this._type == const_1201)
         {
            this.var_2163 = param1.readString();
         }
         else if(this._type == const_753)
         {
            this.var_881 = new PublicRoomData(param1);
         }
         else if(this._type == const_832)
         {
            this.var_882 = new GuestRoomData(param1);
         }
         else
         {
            this._open = param1.readBoolean();
         }
      }
      
      public function dispose() : void
      {
         if(this._disposed)
         {
            return;
         }
         this._disposed = true;
         if(this.var_882 != null)
         {
            this.var_882.dispose();
            this.var_882 = null;
         }
         if(this.var_881 != null)
         {
            this.var_881.dispose();
            this.var_881 = null;
         }
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function get type() : int
      {
         return this._type;
      }
      
      public function get index() : int
      {
         return this._index;
      }
      
      public function get popupCaption() : String
      {
         return this.var_2197;
      }
      
      public function get popupDesc() : String
      {
         return this.var_2195;
      }
      
      public function get showDetails() : Boolean
      {
         return this.var_2199;
      }
      
      public function get picText() : String
      {
         return this.var_2194;
      }
      
      public function get picRef() : String
      {
         return this.var_915;
      }
      
      public function get folderId() : int
      {
         return this.var_2196;
      }
      
      public function get tag() : String
      {
         return this.var_2163;
      }
      
      public function get userCount() : int
      {
         return this.var_2198;
      }
      
      public function get guestRoomData() : GuestRoomData
      {
         return this.var_882;
      }
      
      public function get publicRoomData() : PublicRoomData
      {
         return this.var_881;
      }
      
      public function get open() : Boolean
      {
         return this._open;
      }
      
      public function toggleOpen() : void
      {
         this._open = !this._open;
      }
      
      public function get maxUsers() : int
      {
         if(this.type == const_1201)
         {
            return 0;
         }
         if(this.type == const_832)
         {
            return this.var_882.maxUserCount;
         }
         if(this.type == const_753)
         {
            return this.var_881.maxUsers;
         }
         return 0;
      }
   }
}

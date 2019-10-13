//Radar for the HUD
function Radar(parent){
   this.parent = parent;
   this.blips = new Array();
   this.MCwidth = 130;
   this.MCheight = 130;
   this.active = true;
   this.tileSize = 4;
   var _loc9_ = this.MCwidth / this.parent.cols;
   var _loc10_ = this.MCheight / this.parent.rows;
   if(_loc9_ < _loc10_){
      this.tileSize = Math.floor(_loc9_);
   } else{
      this.tileSize = Math.floor(_loc10_);
   }
   this.width = this.parent.cols * this.tileSize;
   this.height = this.parent.rows * this.tileSize;
   this.marginX = (this.MCwidth - this.width) / 2;
   this.marginY = (this.MCheight - this.height) / 2;
   this.scaler = this.tileSize / this.parent.tileSize;
   this.MC = this.parent.parent.parent.hud.MC.radar.createEmptyMovieClip("radar",1);
   this.stats = this.MC._parent.stats;
   this.stats.swapDepths(3);
   this.stats._visible = false;
   this.flash = this.MC._parent.flash;
   this.flash.swapDepths(2);
   this.shroudBitmap = new flash.display.BitmapData(this.MCwidth,this.MCheight,true,0);
   this.MCshroud = this.MC.createEmptyMovieClip("shroud",9);
   this.MCshroud.attachBitmap(this.shroudBitmap,1,true,false);
   this.blurFilter = new flash.filters.BlurFilter(this.tileSize,this.tileSize,2);
   this.MCportal = this.MC.attachMovie("drag","portal",10);
   this.MCportal._width = this.parent.viewWidth / this.parent.tileSize * this.tileSize;
   this.MCportal._height = this.parent.viewHeight * 2 / this.parent.tileSize * this.tileSize;
   this.tileBitmap = new flash.display.BitmapData(this.MCwidth,this.MCheight,false,12868654);
   var _loc6_ = new flash.geom.Matrix();
   _loc6_.scale(this.scaler,this.scaler * 2);
   _loc6_.translate(this.marginX,this.marginY);
   this.tileBitmap.draw(this.parent.tileMC,_loc6_);
   this.MC.attachBitmap(this.tileBitmap,1,true,false);
   this.handle = function(){
      this.MC._visible = false;
      if(this.active && !this.prevActive){
         this.parent.parent.parent.sfx.play("INT_radaronline");
         this.flash.gotoAndPlay("flash");
      }
      if(!this.active && this.prevActive){
         this.parent.parent.parent.sfx.play("INT_radaroffline");
         this.flash.gotoAndPlay("flash");
      }
      this.prevActive = this.active;
      if(!this.active){
         this.blips = new Array();
         return undefined;
      }
      this.MC._visible = true;
      this.MCblips = this.MC.createEmptyMovieClip("blips",2);
      for(var _loc4_ in this.blips){
         var _loc2_ = this.blips[_loc4_];
         var _loc3_ = this.MCblips.attachMovie("blip","blip" + _loc4_,_loc4_);
         _loc3_._x = _loc2_.posX * this.scaler + this.marginX;
         _loc3_._y = _loc2_.posY * this.scaler + this.marginY;
         _loc3_.gotoAndStop(_loc2_.team);
         if(_loc2_.isBuilding){
            _loc3_._width = this.tileSize * _loc2_.stats.width;
            _loc3_._height = this.tileSize * (_loc2_.stats.height - 1);
         }
      }
      this.blips = new Array();
      this.MCportal._x = (- this.parent.posX) * this.scaler + this.marginX;
      this.MCportal._y = (- this.parent.posY) * 2 * this.scaler + this.marginY;
   };
   this.addBlip = function(obj){
      this.blips.push(obj);
   };
   this.doMouse = function(x, y){
      if(!this.active){
         return false;
      }
      var _loc2_ = this.parent.parent.parent.hud.MC.radar;
      if(!_loc2_.hitTest(x,y,true)){
         return false;
      }
      x = (x - _loc2_._x - this.marginX) / this.width;
      y = (y - _loc2_._y - this.marginY) / this.height;
      x = limit(x,0,1);
      y = limit(y,0,1);
      this.parent.parent.camera.posX = x * this.parent.width;
      this.parent.parent.camera.posY = y * this.parent.height * 2;
      MOUSEDOWN = false;
      return true;
   };
   this.showStats = function(title, cost){
      title = title.toUpperCase();
      cost = cost.toUpperCase();
      if(!this.stats._visible || title != this.stats.title){
         this.stats.flash.gotoAndPlay(1);
      }
      this.stats.title = title;
      this.stats.cost = cost;
   };
}

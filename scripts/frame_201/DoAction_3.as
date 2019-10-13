//Arena
function Arena(parent){
   this.parent = parent;
   this.viewWidth = 450;
   this.viewHeight = 400;
   this.viewWidth2 = this.viewWidth / 2;
   this.viewHeight2 = this.viewHeight / 2;
   this.tileSize = 96;
   this.tileSize2 = this.tileSize / 2;
   this.arenaMC = this.parent.MC.createEmptyMovieClip("arena",1);
   this.mask = this.arenaMC.attachMovie("blank","mask",1);
   this.mask._width = this.viewWidth;
   this.mask._height = this.viewHeight;
   this.arenaMC.setMask(this.mask);
   this.arenaMC._x = 150;
   this.MC = this.arenaMC.createEmptyMovieClip("terrain",2);
   this.terrainMC = this.MC.attachMovie("terrain","terrain",-10);
   this.scorchMC = this.MC.createEmptyMovieClip("scorch",-2);
   this.scorchMC.cacheAsBitmap = true;
   this.bgMC = this.MC.createEmptyMovieClip("bg",-3);
   this.tileMC = this.bgMC.createEmptyMovieClip("tiles",2);
   this.windMC = this.bgMC.createEmptyMovieClip("wind",1);
   this.windMC._alpha = 50;
   this.windBitmap = flash.display.BitmapData.loadBitmap("wind");
   this.posX = 0;
   this.posY = 0;
   this.count = 0;
   this.baitGrow = 0.02;
   this.handle = function(){
      this.count++;
      if(this.count > 90){
         this.count = 1;
      }
      this.shroud.handle();
      this.radar.handle();
      this.posX = - this.parent.camera.posX + this.viewWidth2;
      this.posY = - this.parent.camera.posY / 2 + this.viewHeight2;
      var _loc4_ = 0.25;
      var _loc5_ = 1 - _loc4_;
      if(!this.MC._x && !this.MC._y){
         this.MC._x = this.posX;
         this.MC._y = this.posY;
      }
      this.MC._x = Math.round(_loc5_ * this.MC._x + _loc4_ * this.posX);
      this.MC._y = Math.round(_loc5_ * this.MC._y + _loc4_ * this.posY);
      for(var _loc3_ in this.baitList){
         var _loc2_ = this.baits[this.baitList[_loc3_].x][this.baitList[_loc3_].y];
         if(_loc2_ < 100){
            this.baits[this.baitList[_loc3_].x][this.baitList[_loc3_].y] = this.baits[this.baitList[_loc3_].x][this.baitList[_loc3_].y] + this.baitGrow;
         }
         this.baitList[_loc3_].MC.gotoAndStop(5 - Math.ceil(4 * _loc2_ / 100));
      }
      this.drawWind();
   };
   this.drawWind = function(){
      var _loc2_ = this.windMC;
      _loc2_._x = - this.MC._x;
      _loc2_._y = - this.MC._y;
      _loc2_.clear();
      var _loc3_ = new flash.geom.Matrix();
      _loc3_.rotate(-0.463);
      _loc3_.translate(this.MC._x,this.MC._y);
      _loc3_.translate((- this.count) * 4,this.count * 2);
      _loc2_.beginBitmapFill(this.windBitmap,_loc3_);
      _loc2_.moveTo(0,0);
      _loc2_.lineTo(this.viewWidth,0);
      _loc2_.lineTo(this.viewWidth,this.viewHeight);
      _loc2_.lineTo(0,this.viewHeight);
      _loc2_.lineTo(0,0);
      _loc2_.endFill;
      if(random(5) == 1 && _loc2_._alpha < 200){
         _loc2_._alpha = _loc2_._alpha + 25;
      }else {
         _loc2_._alpha = _loc2_._alpha * 0.95;
      }
   };
   this.getZ = function(x, y){
      if(y == undefined){
         var _loc4_ = x;
         x = _loc4_.posX;
         y = _loc4_.posY;
         if(_loc4_.stats.altitude){
            y = y + _loc4_.stats.altitude;
         }
      }
      var _loc2_ = Math.ceil((x + y * 2880) / 10);
      var _loc3_ = undefined;
      while((_loc3_ = this.MC.getInstanceAtDepth(_loc2_)) && _loc3_ != _loc4_.MC){
         _loc2_ = _loc2_ + 1;
      }
      return _loc2_;
   };
   this.translatePos = function(posX, posY){
      var _loc3_ = Math.ceil(posX / this.tileSize);
      var _loc2_ = Math.ceil(posY / this.tileSize);
      return {x:_loc3_,y:_loc2_};
   };
   this.layoutTiles = function(){
      var _loc5_ = this.parent.parent.data["map" + this.parent.level].slice();
      this.cols = Number(ascii2num(_loc5_.shift()));
      this.rows = Number(ascii2num(_loc5_.shift()));
      this.tileHandles = new Object();
      this.baitList = new Array();
      this.tiles = new Array();
      this.baits = new Array();
      this.useds = new Array();
      var _loc2_ = 0;
      while(_loc2_ <= this.cols){
         this.tiles[_loc2_] = new Array();
         this.baits[_loc2_] = new Array();
         _loc2_ = _loc2_ + 1;
      }
      var _loc3_ = 0;
      while(_loc3_ <= this.rows + 1){
         _loc2_ = 0;
         while(_loc2_ <= this.cols + 1){
            var _loc4_ = undefined;
            if(_loc2_ && _loc3_ && _loc2_ <= this.cols && _loc3_ <= this.rows){
               _loc4_ = this.tileHandles["_" + _loc2_ + "_" + _loc3_] = new Tile(this,Number(ascii2num(_loc5_.shift())),(_loc2_ - 1) * this.tileSize,(_loc3_ - 1) * this.tileSize,_loc2_,_loc3_);
            }
            this.tiles[_loc2_][_loc3_] = this.parent.parent.data.tileDatumA[this.tileHandles["_" + _loc2_ + "_" + _loc3_] = new Tile(this,Number(ascii2num(_loc5_.shift())),(_loc2_ - 1) * this.tileSize,(_loc3_ - 1) * this.tileSize,_loc2_,_loc3_).id];
            this.baits[_loc2_][_loc3_] = Number(this.parent.parent.data.tileDatumB[this.tileHandles["_" + _loc2_ + "_" + _loc3_] = new Tile(this,Number(ascii2num(_loc5_.shift())),(_loc2_ - 1) * this.tileSize,(_loc3_ - 1) * this.tileSize,_loc2_,_loc3_).id]) * 100 * this.parent.fractomiser.spit(0.25,1);
            if(this.parent.parent.data.tileDatumB[this.tileHandles["_" + _loc2_ + "_" + _loc3_] = new Tile(this,Number(ascii2num(_loc5_.shift())),(_loc2_ - 1) * this.tileSize,(_loc3_ - 1) * this.tileSize,_loc2_,_loc3_).id]){
               this.baitList.push(this.tileHandles["_" + _loc2_ + "_" + _loc3_] = new Tile(this,Number(ascii2num(_loc5_.shift())),(_loc2_ - 1) * this.tileSize,(_loc3_ - 1) * this.tileSize,_loc2_,_loc3_));
            }
            if(!this.tileHandles["_" + _loc2_ + "_" + _loc3_] = new Tile(this,Number(ascii2num(_loc5_.shift())),(_loc2_ - 1) * this.tileSize,(_loc3_ - 1) * this.tileSize,_loc2_,_loc3_).id){
               this.tiles[_loc2_][_loc3_] = false;
               this.baits[_loc2_][_loc3_] = 0;
            }
            if(!_loc2_ || _loc2_ == this.cols + 1 || (!_loc3_ || _loc3_ == this.rows + 1)){
               this.tiles[_loc2_][_loc3_] = true;
            }
            _loc2_ = _loc2_ + 1;
         }
         _loc3_ = _loc3_ + 1;
      }
      this.width = this.cols * this.tileSize;
      this.height = this.rows * this.tileSize2;
      this.pathFinder = new PathFinder(this,this.tiles,this.baits);
      this.radar = new Radar(this);
      this.shroud = new Shroud(this);
   };
   this.closestAvailable = function(pos){
      var _loc18_ = pos.x;
      var _loc17_ = pos.y;
      var _loc6_ = _loc18_ + 1;
      var _loc10_ = _loc18_ + 2;
      var _loc14_ = _loc18_ + 3;
      var _loc5_ = _loc18_ - 1;
      var _loc9_ = _loc18_ - 2;
      var _loc13_ = _loc18_ - 3;
      var _loc7_ = _loc17_ + 1;
      var _loc11_ = _loc17_ + 2;
      var _loc15_ = _loc17_ + 3;
      var _loc4_ = _loc17_ - 1;
      var _loc8_ = _loc17_ - 2;
      var _loc12_ = _loc17_ - 3;
      var _loc3_ = new Array({x:_loc18_,y:_loc17_});
      _loc3_.push({x:_loc18_,y:_loc4_},{x:_loc6_,y:_loc17_},{x:_loc18_,y:_loc7_},{x:_loc5_,y:_loc17_});
      _loc3_.push({x:_loc18_,y:_loc8_},{x:_loc6_,y:_loc4_},{x:_loc10_,y:_loc17_},{x:_loc6_,y:_loc7_},{x:_loc18_,y:_loc11_},{x:_loc5_,y:_loc7_},{x:_loc9_,y:_loc17_},{x:_loc5_,y:_loc4_});
      _loc3_.push({x:_loc18_,y:_loc12_},{x:_loc6_,y:_loc12_},{x:_loc6_,y:_loc8_},{x:_loc10_,y:_loc8_},{x:_loc10_,y:_loc4_},{x:_loc14_,y:_loc4_},{x:_loc14_,y:_loc17_},{x:_loc10_,y:_loc7_},{x:_loc14_,y:_loc7_},{x:_loc6_,y:_loc11_},{x:_loc10_,y:_loc11_},{x:_loc6_,y:_loc15_},{x:_loc18_,y:_loc15_},{x:_loc5_,y:_loc15_},{x:_loc5_,y:_loc11_},{x:_loc9_,y:_loc11_},{x:_loc9_,y:_loc7_},{x:_loc13_,y:_loc7_},{x:_loc13_,y:_loc17_},{x:_loc9_,y:_loc4_},{x:_loc13_,y:_loc4_},{x:_loc5_,y:_loc8_},{x:_loc9_,y:_loc8_},{x:_loc5_,y:_loc12_});
      var _loc2_ = 0;
      while(_loc2_ < _loc3_.length){
         if(!(_loc3_[_loc2_].x < 1 || _loc3_[_loc2_].x > this.cols || _loc3_[_loc2_].y < 1 || _loc3_[_loc2_].y > this.rows)){
            if(!this.tiles[_loc3_[_loc2_].x][_loc3_[_loc2_].y]){
               return _loc3_[_loc2_];
            }
         }
         _loc2_ = _loc2_ + 1;
      }
      return pos;
   };
   this.onDisplay = function(x, y){
      if(y == undefined){
         var _loc5_ = x;
         x = _loc5_.posX;
         y = _loc5_.posY;
      }
      y = y * 0.5;
      var _loc4_ = - this.MC._x;
      var _loc3_ = - this.MC._y;
      return x > _loc4_ && x < _loc4_ + this.viewWidth && y > _loc3_ && y < _loc3_ + this.viewHeight;
   };
   this.doSnow = function(){
      var _loc6_ = new Array();
      _loc6_ = _loc6_.concat([0.376781314611435,1.18239653110504,0.150821998715401,0,40.4149971008301]);
      _loc6_ = _loc6_.concat([0.547781407833099,1.01139640808105,0.15082198381424,0,40.4149971008301]);
      _loc6_ = _loc6_.concat([0.547781467437744,1.18239665031433,-0.0201780442148447,0,40.4150047302246]);
      _loc6_ = _loc6_.concat([0,0,0,1,0]);
      var _loc5_ = new flash.filters.ColorMatrixFilter(_loc6_);
      this.terrainMC.filters = new Array(_loc5_);
      this.windBitmap = flash.display.BitmapData.loadBitmap("snow");
      var _loc4_ = 0;
      while(_loc4_ <= this.rows + 1){
         var _loc2_ = 0;
         while(_loc2_ <= this.cols + 1){
            var _loc3_ = this.tileHandles["_" + _loc2_ + "_" + _loc4_];
            if(!_loc3_.bait){
               _loc3_.MC.filters = new Array(_loc5_);
            }
            _loc2_ = _loc2_ + 1;
         }
         _loc4_ = _loc4_ + 1;
      }
   };
   this.layoutTiles();
}

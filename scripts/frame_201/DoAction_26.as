function Shroud(parent)
{
   this.parent = parent;
   this.cols = this.parent.cols;
   this.rows = this.parent.rows;
   this.tiles = new Array();
   this.needToUpdate = true;
   this.active = true;
   this.count = 0;
   this.handle = function()
   {
      this.count++;
      this.MC._visible = this.parent.radar.MCshroud._visible = this.active;
      if(this.needToUpdate)
      {
         this.update();
      }
   };
   this.update = function()
   {
      var _loc14_ = this.parent.radar.shroudBitmap;
      _loc14_.fillRect(_loc14_.rectangle,4278190080);
      var _loc13_ = undefined;
      var _loc12_ = undefined;
      var _loc11_ = undefined;
      var _loc9_ = false;
      var _loc10_ = undefined;
      var _loc8_ = undefined;
      var _loc6_ = undefined;
      var _loc5_ = undefined;
      var _loc7_ = undefined;
      var _loc4_ = undefined;
      var _loc16_ = 1;
      var _loc15_ = Math.floor(this.rows / 2);
      if(this.count % 2)
      {
         _loc16_ = _loc15_ + 1;
         _loc15_ = this.rows;
         this.needToUpdate = false;
      }
      var _loc3_ = 1;
      while(_loc3_ <= this.rows)
      {
         var _loc2_ = 1;
         while(_loc2_ <= this.cols)
         {
            if(this.tiles[_loc2_][_loc3_])
            {
               _loc8_ = "s1111";
               _loc14_.fillRect(new flash.geom.Rectangle((_loc2_ - 1.5) * this.parent.radar.tileSize + this.parent.radar.marginX,(_loc3_ - 1.5) * this.parent.radar.tileSize + this.parent.radar.marginY,this.parent.radar.tileSize * 2,this.parent.radar.tileSize * 2),0);
            }
            else
            {
               _loc6_ = _loc2_ + 1;
               _loc5_ = _loc2_ - 1;
               _loc7_ = _loc3_ + 1;
               _loc4_ = _loc3_ - 1;
               _loc13_ = this.tiles[_loc2_][_loc4_] || this.tiles[_loc6_][_loc4_] || this.tiles[_loc6_][_loc3_];
               _loc12_ = this.tiles[_loc6_][_loc3_] || this.tiles[_loc6_][_loc7_] || this.tiles[_loc2_][_loc7_];
               _loc11_ = this.tiles[_loc2_][_loc7_] || this.tiles[_loc5_][_loc7_] || this.tiles[_loc5_][_loc3_];
               _loc9_ = this.tiles[_loc5_][_loc3_] || this.tiles[_loc5_][_loc4_] || this.tiles[_loc2_][_loc4_];
               _loc8_ = "s" + String(Number(_loc13_)) + String(Number(_loc12_)) + String(Number(_loc11_)) + String(Number(_loc9_));
            }
            _loc10_ = this.MC["shroud_" + _loc2_ + "_" + _loc3_];
            _loc10_.gotoAndStop(_loc8_);
            _loc2_ = _loc2_ + 1;
         }
         _loc3_ = _loc3_ + 1;
      }
      _loc14_.applyFilter(_loc14_,_loc14_.rectangle,_loc14_.rectangle.topLeft,this.parent.radar.blurFilter);
   };
   this.reset = function()
   {
      this.MC = this.parent.MC.createEmptyMovieClip("shroud",9999900);
      this.MC.cacheAsBitmap = true;
      var _loc2_ = 0;
      while(_loc2_ <= this.cols + 1)
      {
         this.tiles[_loc2_] = new Array();
         _loc2_ = _loc2_ + 1;
      }
      var _loc3_ = 0;
      while(_loc3_ <= this.rows + 1)
      {
         _loc2_ = 0;
         while(_loc2_ <= this.cols + 1)
         {
            this.tiles[_loc2_][_loc3_] = false;
            if(_loc2_ || _loc3_)
            {
               var _loc4_ = this.MC.attachMovie("shroud","shroud_" + _loc2_ + "_" + _loc3_,this.MC.getNextHighestDepth());
               _loc4_._x = (_loc2_ - 1) * this.parent.tileSize;
               _loc4_._y = (_loc3_ - 1) * this.parent.tileSize2;
               _loc4_.gotoAndStop("s0000");
            }
            _loc2_ = _loc2_ + 1;
         }
         _loc3_ = _loc3_ + 1;
      }
      this.update();
   };
   this.clear = function()
   {
      var _loc3_ = 0;
      while(_loc3_ <= this.rows + 1)
      {
         var _loc2_ = 0;
         while(_loc2_ <= this.cols + 1)
         {
            if(_loc2_ || _loc3_)
            {
               this.tiles[_loc2_][_loc3_] = true;
            }
            _loc2_ = _loc2_ + 1;
         }
         _loc3_ = _loc3_ + 1;
      }
      this.needToUpdate = true;
   };
   this.reveal = function(x, y, spread)
   {
      if(!spread)
      {
         return undefined;
      }
      var _loc2_ = new Array({x:x,y:y});
      var _loc6_ = x + 1;
      var _loc10_ = x + 2;
      var _loc15_ = x + 3;
      var _loc4_ = x - 1;
      var _loc9_ = x - 2;
      var _loc14_ = x - 3;
      var _loc7_ = y + 1;
      var _loc11_ = y + 2;
      var _loc16_ = y + 3;
      var _loc3_ = y - 1;
      var _loc8_ = y - 2;
      var _loc13_ = y - 3;
      if(spread > 1)
      {
         _loc2_.push({x:x,y:_loc3_},{x:_loc6_,y:y},{x:x,y:_loc7_},{x:_loc4_,y:y});
      }
      if(spread > 2)
      {
         _loc2_.push({x:x,y:_loc8_},{x:_loc6_,y:_loc3_},{x:_loc10_,y:y},{x:_loc6_,y:_loc7_},{x:x,y:_loc11_},{x:_loc4_,y:_loc7_},{x:_loc9_,y:y},{x:_loc4_,y:_loc3_});
      }
      if(spread > 3)
      {
         _loc2_.push({x:x,y:_loc13_},{x:_loc6_,y:_loc13_},{x:_loc6_,y:_loc8_},{x:_loc10_,y:_loc8_},{x:_loc10_,y:_loc3_},{x:_loc15_,y:_loc3_},{x:_loc15_,y:y},{x:_loc10_,y:_loc7_},{x:_loc15_,y:_loc7_},{x:_loc6_,y:_loc11_},{x:_loc10_,y:_loc11_},{x:_loc6_,y:_loc16_},{x:x,y:_loc16_},{x:_loc4_,y:_loc16_},{x:_loc4_,y:_loc11_},{x:_loc9_,y:_loc11_},{x:_loc9_,y:_loc7_},{x:_loc14_,y:_loc7_},{x:_loc14_,y:y},{x:_loc9_,y:_loc3_},{x:_loc14_,y:_loc3_},{x:_loc4_,y:_loc8_},{x:_loc9_,y:_loc8_},{x:_loc4_,y:_loc13_});
      }
      var _loc5_ = false;
      for(var _loc12_ in _loc2_)
      {
         if(!this.tiles[_loc2_[_loc12_].x][_loc2_[_loc12_].y])
         {
            _loc5_ = true;
         }
         this.tiles[_loc2_[_loc12_].x][_loc2_[_loc12_].y] = true;
      }
      if(_loc5_)
      {
         this.needToUpdate = true;
      }
   };
   this.reset();
}

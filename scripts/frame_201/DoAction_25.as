function PathFinder(parent, map, baits)
{
   this.parent = parent;
   this.map = map;
   this.baits = baits;
   this.safety = 200;
   this.findPath = function(start, end, ignoreObstructions, allowApproximation, allowCachedResponse, bait)
   {
      var _loc2_ = this.safety;
      this.bait = bait;
      if(allowApproximation == undefined)
      {
         allowApproximation = true;
      }
      if(allowCachedResponse == undefined)
      {
         allowCachedResponse = true;
      }
      if(this.bait)
      {
         allowApproximation = false;
         allowCachedResponse = false;
         _loc2_ = 30;
      }
      this.trail = new Object();
      if(allowCachedResponse && this.cacheIgnoreObstructions == ignoreObstructions && this.cacheAllowApproximation == allowApproximation && start.x == this.cacheStart.x && start.y == this.cacheStart.y && end.x == this.cacheEnd.x && end.y == this.cacheEnd.y)
      {
         return this.cacheRet;
      }
      this.cacheStart = start;
      this.cacheEnd = end;
      this.cacheIgnoreObstructions = ignoreObstructions;
      this.cacheAllowApproximation = allowApproximation;
      this.cacheRet = null;
      this.endNode = new PathNode(end.x,end.y,{g:999999},this,0);
      this.startNode = new PathNode(start.x,start.y,{g:0},this,0);
      this.ignoreObstructions = ignoreObstructions;
      this.allowApproximation = allowApproximation;
      this.endFound = false;
      this.openList = new Array(this.startNode);
      this.closedList = new Array();
      while(current = this.openList.shift())
      {
         if(!(_loc2_ = _loc2_ - 1))
         {
            break;
         }
         this.closedList.push(current);
         if(this.bait && this.baits[current.x][current.y] > 25)
         {
            break;
         }
         this.openList = this.openList.concat(this.getAdjacent(current));
         if(this.endFound)
         {
            break;
         }
         this.openList.sortOn("f",Array.NUMERIC);
      }
      if(this.endFound)
      {
         return this.cacheRet = this.footsteps(this.endNode);
      }
      if(!this.bait)
      {
         if(!this.allowApproximation)
         {
            return false;
         }
         this.closedList.sortOn("h",Array.NUMERIC);
         return this.cacheRet = this.footsteps(this.closedList[0]);
      }
      if(this.baits[current.x][current.y])
      {
         return this.cacheRet = this.footsteps(current);
      }
      return false;
   };
   this.getAdjacent = function(node)
   {
      var _loc3_ = new Array();
      var _loc6_ = node.x;
      var _loc5_ = node.y;
      if(_loc6_ < 1 || _loc6_ > this.map.length - 1 || _loc5_ < 1 || _loc5_ > this.map[0].length - 1)
      {
         return _loc3_;
      }
      var _loc8_ = _loc6_ + 1;
      var _loc9_ = _loc6_ - 1;
      var _loc7_ = _loc5_ + 1;
      var _loc10_ = _loc5_ - 1;
      var _loc2_ = undefined;
      if(!this.map[_loc6_][_loc10_] || this.ignoreObstructions)
      {
         _loc2_ = new PathNode(_loc6_,_loc10_,node,this,10);
         if(_loc2_.pushIt)
         {
            _loc3_.push(_loc2_);
         }
      }
      if(!this.map[_loc8_][_loc10_] || this.ignoreObstructions)
      {
         _loc2_ = new PathNode(_loc8_,_loc10_,node,this,14);
         if(_loc2_.pushIt)
         {
            _loc3_.push(_loc2_);
         }
      }
      if(!this.map[_loc8_][_loc5_] || this.ignoreObstructions)
      {
         _loc2_ = new PathNode(_loc8_,_loc5_,node,this,10);
         if(_loc2_.pushIt)
         {
            _loc3_.push(_loc2_);
         }
      }
      if(!this.map[_loc8_][_loc7_] || this.ignoreObstructions)
      {
         _loc2_ = new PathNode(_loc8_,_loc7_,node,this,14);
         if(_loc2_.pushIt)
         {
            _loc3_.push(_loc2_);
         }
      }
      if(!this.map[_loc6_][_loc7_] || this.ignoreObstructions)
      {
         _loc2_ = new PathNode(_loc6_,_loc7_,node,this,10);
         if(_loc2_.pushIt)
         {
            _loc3_.push(_loc2_);
         }
      }
      if(!this.map[_loc9_][_loc7_] || this.ignoreObstructions)
      {
         _loc2_ = new PathNode(_loc9_,_loc7_,node,this,14);
         if(_loc2_.pushIt)
         {
            _loc3_.push(_loc2_);
         }
      }
      if(!this.map[_loc9_][_loc5_] || this.ignoreObstructions)
      {
         _loc2_ = new PathNode(_loc9_,_loc5_,node,this,10);
         if(_loc2_.pushIt)
         {
            _loc3_.push(_loc2_);
         }
      }
      if(!this.map[_loc9_][_loc10_] || this.ignoreObstructions)
      {
         _loc2_ = new PathNode(_loc9_,_loc10_,node,this,14);
         if(_loc2_.pushIt)
         {
            _loc3_.push(_loc2_);
         }
      }
      return _loc3_;
   };
   this.calcH = function(node)
   {
      if(!this.endNode)
      {
         return 0;
      }
      var _loc4_ = Math.abs(node.x - this.endNode.x);
      var _loc3_ = Math.abs(node.y - this.endNode.y);
      var _loc2_ = (_loc4_ + _loc3_) * 10;
      if(_loc2_ == 0 && !node.grandParent.bait)
      {
         this.endFound = true;
      }
      return _loc2_;
   };
   this.footsteps = function(finalDestination)
   {
      var _loc3_ = new Array();
      var _loc2_ = this.trail["P_" + finalDestination.x + "_" + finalDestination.y];
      if(this.bait)
      {
         _loc3_.push({x:_loc2_.x,y:_loc2_.y});
      }
      while(_loc2_.parent && _loc3_.length < this.safety)
      {
         _loc3_.push({x:_loc2_.x,y:_loc2_.y});
         _loc2_ = _loc2_.parent;
         if(_loc2_ == this.startNode)
         {
            _loc3_.push({x:_loc2_.x,y:_loc2_.y});
            break;
         }
      }
      return _loc3_.reverse();
   };
}
function PathNode(x, y, parent, grandParent, inc)
{
   this.x = x;
   this.y = y;
   this.parent = parent;
   this.grandParent = grandParent;
   this.inc = inc;
   this.g = this.parent.g + this.inc;
   this.h = this.grandParent.calcH(this);
   this.f = this.g + this.h;
   if(this.grandParent.bait)
   {
      this.f = this.g;
   }
   this.pushIt = false;
   var _loc2_ = this.grandParent.trail["P_" + this.x + "_" + this.y];
   if(!_loc2_ || this.g < _loc2_.g)
   {
      this.grandParent.trail["P_" + this.x + "_" + this.y] = this;
      this.pushIt = true;
   }
}

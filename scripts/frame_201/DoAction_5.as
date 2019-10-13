function BuildingSite(parent, type)
{
   this.parent = parent;
   this.type = type;
   this.tilePos = {x:0,y:0};
   this.stats = new BuildingStats(this);
   this.arena = this.parent.parent.arena;
   this.parent.parent.control.resetSelected();
   this.handle = function()
   {
      var _loc4_ = this.parent.parent.control.tilePos;
      this.MC.removeMovieClip();
      this.MC = this.arena.MC.createEmptyMovieClip("buildingsite",99996);
      this.MC._alpha = 50;
      var _loc6_ = 0;
      this.valid = true;
      tooFarAway = true;
      var _loc3_ = _loc4_.x + this.stats.topLeftX - this.stats.powerMargin;
      while(_loc3_ < _loc4_.x + this.stats.topLeftX + this.stats.width + this.stats.powerMargin)
      {
         var _loc2_ = _loc4_.y + this.stats.topLeftY - this.stats.powerMargin;
         while(_loc2_ < _loc4_.y + this.stats.topLeftY + this.stats.height + this.stats.powerMargin)
         {
            if(this.arena.useds[_loc3_][_loc2_].isBuilding && this.arena.useds[_loc3_][_loc2_].friend && this.arena.useds[_loc3_][_loc2_].stats.power)
            {
               tooFarAway = false;
               break;
            }
            _loc2_ = _loc2_ + 1;
         }
         _loc3_ = _loc3_ + 1;
      }
      if(!this.stats.power)
      {
         tooFarAway = false;
      }
      _loc3_ = _loc4_.x + this.stats.topLeftX;
      while(_loc3_ < _loc4_.x + this.stats.topLeftX + this.stats.width)
      {
         _loc2_ = _loc4_.y + this.stats.topLeftY;
         while(_loc2_ < _loc4_.y + this.stats.topLeftY + this.stats.height)
         {
            _loc6_ = _loc6_ + 1;
            var _loc5_ = this.MC.attachMovie("placer","placer" + _loc6_,_loc6_);
            _loc5_._x = (_loc3_ - 1) * this.arena.tileSize;
            _loc5_._y = (_loc2_ - 1) * this.arena.tileSize2;
            _loc5_.gotoAndStop("valid");
            if(tooFarAway || this.stats.refinery && !this.arena.baits[_loc3_][_loc2_] || this.arena.useds[_loc3_][_loc2_] && (!this.stats.refinery || String(this.arena.useds[_loc3_][_loc2_]) == "[object Object]" || this.arena.tiles[_loc3_][_loc2_]))
            {
               _loc5_.gotoAndStop("invalid");
               this.valid = false;
            }
            _loc2_ = _loc2_ + 1;
         }
         _loc3_ = _loc3_ + 1;
      }
   };
   this.breakGround = function()
   {
      if(!this.valid)
      {
         this.parent.parent.parent.sfx.play("INT_invalid");
         return undefined;
      }
      this.parent.parent.outcomeFutures++;
      this.parent.parent.buildings.push(new Building(this.parent.parent,this.type,this.parent.parent.control.tilePos.x,this.parent.parent.control.tilePos.y,this.parent.parent.parent.team));
      this.destroy(true);
      this.parent.parent.parent.sfx.play("INT_breakground");
      return true;
   };
   this.destroy = function(success)
   {
      this.MC.removeMovieClip();
      if(!success)
      {
         this.parent.parent.cash = this.parent.parent.cash + this.stats.cost;
         this.parent.parent.parent.sfx.play("INT_invalid");
      }
   };
}

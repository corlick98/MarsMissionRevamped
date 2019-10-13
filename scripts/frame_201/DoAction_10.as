function UnitNav(parent)
{
   this.parent = parent;
   this.stats = this.parent.stats;
   this.currentX = this.nextX = this.parent.tilePos.x;
   this.currentY = this.nextY = this.parent.tilePos.y;
   this.nextAngle = this.currentAngle = this.parent.angle;
   this.arena = this.parent.parent.arena;
   this.hesitate = random(10);
   this.bank = "straight";
   this.feeding = false;
   this.headingHome = false;
   this.walk = 0;
   this.still = 0;
   this.landerPerc = 0;
   this.progress = 0;
   this.bankChange = 0;
   this.stuck = 0;
   if(!this.stats.obstruct && !this.stats.pickup)
   {
      this.offsetX = Math.random() * 0.6 + 0.2;
      this.offsetY = Math.random() * 0.6 + 0.2;
   }
   else
   {
      this.offsetX = this.offsetY = 0.5;
   }
   this.parent.posX = (this.currentX + this.offsetX - 1) * this.arena.tileSize;
   this.parent.posY = (this.currentY + this.offsetY - 1) * this.arena.tileSize;
   this.path = new Array();
   var _loc5_ = 2;
   var _loc10_ = 1;
   while(_loc10_ <= this.stats.speed)
   {
      _loc5_ = _loc5_ * 1.2;
      _loc10_ = _loc10_ + 1;
   }
   _loc5_ = 100 / Math.round(100 / _loc5_);
   this.oincrement = _loc5_;
   this.handle = function()
   {
      if(!this.stats.speed)
      {
         return undefined;
      }
      this.target = this.parent.target;
      if(this.bankChange)
      {
         this.bankChange--;
      }
      else
      {
         this.bank = "straight";
      }
      if(this.npath && !this.progress)
      {
         this.path = this.npath.slice();
         delete this.npath;
         if(!this.target && !this.parent.stats.carrier)
         {
            this.hesitate = random(20 - this.stats.speed);
         }
         this.still = 0;
      }
      if(this.target && !this.parent.stats.pickup && !(this.parent.count % this.stats.reaction))
      {
         if(this.checkNonDestructiveTarget())
         {
            return undefined;
         }
         if(this.target.isUnit)
         {
            var _loc4_ = this.target.tilePos.x;
            var _loc3_ = this.target.tilePos.y;
            if(this.stats.repair || this.target.friend && this.target.stats.carrier)
            {
               this.target.freeBlock();
            }
            else
            {
               var _loc2_ = this.arena.closestAvailable({x:_loc4_,y:_loc3_});
               _loc4_ = _loc2_.x;
               _loc3_ = _loc2_.y;
            }
         }
         if(this.target.isBuilding)
         {
            _loc4_ = this.target.stats.dockX;
            _loc3_ = this.target.stats.dockY - this.arena.tileSize;
            if(this.stats.repair)
            {
               this.target.freeBlock();
            }
         }
         this.voyage(_loc4_,_loc3_,false);
         if(this.stats.repair)
         {
            if(this.target.isUnit)
            {
               this.target.setBlock(_loc4_,_loc3_);
            }
            else
            {
               this.target.setBlock(false);
            }
         }
         this.hesitate = 0;
         return undefined;
      }
      if(this.parent.stats.lander && (this.still || this.landerPerc))
      {
         if(this.still > 20 && (!this.stats.boomerang || this.atHome) && !this.parent.parent.arena.tiles[this.parent.tilePos.x][this.parent.tilePos.y])
         {
            this.landerPerc = this.landerPerc + this.parent.stats.speed;
         }
         else
         {
            this.landerPerc = this.landerPerc - this.parent.stats.speed;
         }
         this.landerPerc = limit(this.landerPerc,0,100);
         this.parent.stats.altitude = this.parent.stats.maxAltitude * (1 - this.landerPerc / 100);
         this.parent.stats.altitude2 = this.parent.stats.altitude / 2;
         this.parent.stats.altitudeT2 = this.parent.stats.altitude * 2;
         if(this.stats.transformer)
         {
            if(this.landerPerc > 0)
            {
               this.bank = "landing";
            }
            if(this.landerPerc == 100)
            {
               this.bank = "ground";
               if(this.parent.friend)
               {
                  this.checkCollect();
               }
            }
         }
      }
      if(this.hesitate)
      {
         this.hesitate--;
         this.still++;
         if(this.still > 100)
         {
            delete this.path;
         }
         return undefined;
      }
      this.atHome = false;
      if(this.path.length <= 1)
      {
         this.hesitate = random(10);
         if(this.stats.miner && this.headingHome || this.stats.home.stats.dockPos.x == this.parent.tilePos.x && this.stats.home.stats.dockPos.y == this.parent.tilePos.y)
         {
            this.atHome = true;
            this.parent.weaponPayload = min(++this.parent.weaponPayload,this.parent.stats.maxWeaponPayload);
            this.hesitate = 20;
            if(this.lastFed.x)
            {
               this.parent.parent.cashUp(this.parent.cargo,this.parent);
               this.parent.cargo = 0;
               this.voyage(this.lastFed.x,this.lastFed.y,false,false);
               this.feeding = true;
               this.parent.hilite = true;
            }
         }
         if(this.parent.stats.boomerang)
         {
            this.returnHome();
         }
         if(!this.parent.friend && !this.parent.stats.miner)
         {
            this.parent.hal.handle();
         }
         return undefined;
      }
      if(!this.progress && !this.startMove())
      {
         return undefined;
      }
      this.midMove();
      if(this.progress >= 99.9999999999)
      {
         this.endMove();
      }
   };
   this.startMove = function()
   {
      var _loc3_ = this.path[0];
      var _loc2_ = this.path[1];
      var _loc4_ = this.arena.tiles[_loc2_.x][_loc2_.y];
      if(_loc4_ && _loc4_ != this.parent && !this.stats.flying && !(this.stats.repair && _loc4_ == this.target))
      {
         this.stuck++;
         this.hesitate = 10;
         if(this.headingHome)
         {
            this.returnHome();
            return undefined;
         }
         if(this.target)
         {
            this.hesitate = 0;
         }
         if(this.stats.miner && this.stuck > 2)
         {
            this.voyage(this.path[this.path.length - 1].x,this.path[this.path.length - 1].y,false,this.feeding);
         }
         return false;
      }
      this.stuck = 0;
      var _loc6_ = _loc2_.x - _loc3_.x;
      var _loc5_ = _loc2_.y - _loc3_.y;
      this.currentX = _loc3_.x;
      this.currentY = _loc3_.y;
      this.nextX = _loc2_.x;
      this.nextY = _loc2_.y;
      this.parent.setBlock(this.nextX,this.nextY);
      this.currentAngle = this.nextAngle;
      this.nextAngle = this.returnAngle(_loc6_,_loc5_);
      if(_loc6_ && _loc5_)
      {
         this.increment = this.oincrement / 1.5;
      }
      else
      {
         this.increment = this.oincrement;
      }
      return true;
   };
   this.midMove = function()
   {
      var _loc5_ = this.currentX + this.progress / 100 * (this.nextX - this.currentX);
      var _loc4_ = this.currentY + this.progress / 100 * (this.nextY - this.currentY);
      this.parent.posX = (_loc5_ + this.offsetX - 1) * this.arena.tileSize;
      this.parent.posY = (_loc4_ + this.offsetY - 1) * this.arena.tileSize;
      var _loc3_ = this.nextAngle - this.currentAngle;
      if(Math.abs(_loc3_) > 0.5)
      {
         _loc3_ = (1 - Math.abs(_loc3_)) * (- _loc3_ / Math.abs(_loc3_));
      }
      if(this.stats.altitude > 0)
      {
         if(_loc3_ > 0)
         {
            this.bank = "right";
            this.bankChange = 2;
         }
         else if(_loc3_ < 0)
         {
            this.bank = "left";
            this.bankChange = 2;
         }
      }
      else
      {
         if(!(this.parent.count % 4))
         {
            this.walk++;
         }
         if(this.walk > 3)
         {
            this.walk = 0;
         }
         this.bank = this.parent.parent.walkFrames[this.walk];
      }
      var _loc2_ = this.currentAngle + min(1,this.progress / 100 * (20 / this.stats.speed)) * _loc3_;
      while(_loc2_ >= 1)
      {
         _loc2_ = _loc2_ - 1;
      }
      while(_loc2_ < 0)
      {
         _loc2_ = _loc2_ + 1;
      }
      this.parent.angle = _loc2_;
      this.progress = this.progress + this.increment;
      this.still = 0;
   };
   this.endMove = function()
   {
      this.currentX = this.nextX;
      this.currentY = this.nextY;
      this.progress = 0;
      this.path.shift();
      if(this.path.length == 1 && !this.stats.obstruct && !this.stats.flying)
      {
         var _loc3_ = this.parent.angle + (random(3) - 1) * 0.125;
         this.parent.angle = limit(_loc3_,0,0.875);
      }
      if(this.checkNonDestructiveTarget())
      {
         return undefined;
      }
      if(this.parent.friend && !this.parent.stats.flying)
      {
         this.checkCollect();
      }
      if(this.path.length > 1)
      {
         return undefined;
      }
      if(this.stats.bait && this.feeding)
      {
         if(this.arena.baits[this.currentX][this.currentY])
         {
            this.lastFed = {x:this.currentX,y:this.currentY};
            var _loc2_ = Math.floor(min(10,this.arena.baits[this.currentX][this.currentY]));
            var _loc4_ = this.arena.baits[this.currentX][this.currentY] = limit(this.arena.baits[this.currentX][this.currentY] - _loc2_,1,100);
            this.parent.cargo = this.parent.cargo + _loc2_;
            this.parent.makeNoise(this.parent.type + "_action_" + (random(3) + 1));
            if(this.parent.cargo >= this.stats.maxCargo)
            {
               this.parent.MCsprite.unit.sparks._visible = false;
               this.parent.makeNoise(this.parent.type + "_comply");
               if(!this.parent.stats.home.active || this.parent.stats.home.team != this.parent.team)
               {
                  this.parent.destroy();
                  return undefined;
               }
               this.returnHome();
               return undefined;
            }
            this.parent.MCsprite.unit.sparks._visible = true;
         }
         this.voyage(null,null,false,true);
         return undefined;
      }
   };
   this.returnAngle = function(dx, dy)
   {
      if(dx == 0 && dy == -1)
      {
         return 0;
      }
      if(dx == 1 && dy == -1)
      {
         return 0.125;
      }
      if(dx == 1 && dy == 0)
      {
         return 0.25;
      }
      if(dx == 1 && dy == 1)
      {
         return 0.375;
      }
      if(dx == 0 && dy == 1)
      {
         return 0.5;
      }
      if(dx == -1 && dy == 1)
      {
         return 0.625;
      }
      if(dx == -1 && dy == 0)
      {
         return 0.75;
      }
      if(dx == -1 && dy == -1)
      {
         return 0.875;
      }
      return this.currentAngle;
   };
   this.checkNonDestructiveTarget = function()
   {
      if(this.target && (this.arena.tiles[this.currentX][this.currentY] == this.target || this.currentX == this.target.tilePos.x && this.currentY == this.target.tilePos.y))
      {
         if(this.stats.repair)
         {
            if(this.target.team != this.parent.team)
            {
               this.parent.doInfiltrate();
               return true;
            }
            if(this.target.stats.repairable && this.target.health < this.target.stats.maxHealth)
            {
               this.parent.doRepair();
               return true;
            }
            if(!this.target.stats.carrier)
            {
               this.parent.target = false;
            }
         }
         if(this.target.stats.carrier && this.target.team == this.parent.team && (!this.target.stats.flying || this.target.nav.landerPerc == 100))
         {
            this.parent.doEmbark(false);
            return true;
         }
      }
      return false;
   };
   this.checkCollect = function()
   {
      for(var _loc3_ in this.parent.parent.units)
      {
         var _loc2_ = this.parent.parent.units[_loc3_];
         if(_loc2_.stats.pickup && _loc2_.tilePos.x == this.currentX && _loc2_.tilePos.y == this.currentY)
         {
            _loc2_.collect(this.parent);
         }
      }
   };
   this.returnHome = function()
   {
      this.parent.MCsprite.unit.sparks._visible = false;
      this.voyage(this.stats.home.stats.dockX,this.stats.home.stats.dockY,false,false);
      this.headingHome = true;
   };
   this.voyage = function(x, y, manual, bait)
   {
      bait = bait && this.stats.bait;
      this.headingHome = false;
      this.parent.hilite = manual;
      if(manual)
      {
         this.parent.MCsprite.unit.sparks._visible = false;
      }
      if(!manual && x < this.arena.tileSize && y < this.arena.tileSize2)
      {
         var _loc6_ = x;
         var _loc2_ = y;
      }
      else
      {
         var _loc8_ = this.arena.translatePos(x,y);
         _loc6_ = _loc8_.x;
         _loc2_ = _loc8_.y;
      }
      if(this.stats.flying && manual)
      {
         _loc2_ = max(_loc2_,Math.ceil(this.stats.maxAltitude * 2 / this.arena.tileSize2));
      }
      if(_loc6_ == this.nextX && _loc2_ == this.nextY)
      {
         return false;
      }
      var _loc3_ = undefined;
      this.feeding = false;
      if(_loc3_ = this.arena.pathFinder.findPath({x:this.nextX,y:this.nextY},{x:_loc6_,y:_loc2_},this.stats.flying,true,true,bait))
      {
         this.npath = _loc3_;
         var _loc7_ = _loc3_[_loc3_.length - 1];
         if(this.arena.baits[_loc7_.x][_loc7_.y] && this.stats.bait)
         {
            this.feeding = true;
         }
      }
      else if(!manual && bait)
      {
         this.returnHome();
      }
   };
   if(this.parent.stats.miner)
   {
      this.voyage(null,null,false,this.parent.stats.bait);
   }
}

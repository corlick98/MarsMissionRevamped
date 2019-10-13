function Building(parent, type, x, y, team, damage)
{
   this.isBuilding = true;
   this.parent = parent;
   this.type = type;
   this.tilePos = {x:x,y:y};
   this.active = true;
   if(!team)
   {
      this.team = this.type.substr(3);
   }
   else
   {
      this.team = team;
   }
   this.friend = this.team == this.parent.parent.team;
   this.selected = false;
   this.pulse = false;
   this.hilite = false;
   this.repairing = false;
   this.count = random(1000);
   this.stats = new BuildingStats(this);
   this.posX = this.tilePos.x * this.parent.arena.tileSize;
   this.posY = this.tilePos.y * this.parent.arena.tileSize;
   this.angle = 0;
   if(this.stats.refinery)
   {
      this.count = 10;
   }
   this.health = this.stats.maxHealth;
   if(damage)
   {
      this.health = this.stats.maxHealth * damage;
   }
   this.healthPerc = 100;
   this.weaponCharge = this.stats.maxWeaponCharge;
   this.weaponPayload = this.stats.maxWeaponPayload;
   this.MC = this.parent.arena.MC.createEmptyMovieClip("building_" + this.parent.uniqid++,this.parent.arena.MC.getNextHighestDepth());
   this.MCbaseplate = this.MC.attachMovie("baseplate","baseplate",1);
   if(this.stats.width == 1)
   {
      this.MCbaseplate.gotoAndStop(this.team + "_1");
   }
   else
   {
      this.MCbaseplate.gotoAndStop(this.team + "_2");
   }
   if(this.stats.height == 2)
   {
      this.MCbaseplate._y = - this.parent.arena.tileSize2;
   }
   this.MCbaseplate._alpha = 50;
   this.MCsprite = this.MC.attachMovie("building","building",2);
   this.MCsprite.gotoAndStop(this.type);
   this.MCsprite.building._x = this.MCsprite.shadow._x = (- this.MCsprite.building._width) / 2;
   this.MCsprite.building._y = this.MCsprite.shadow._y = (- this.MCsprite.building._height) / 2;
   this.MCsprite.building.gotoAndPlay(2);
   this.MCsprite.shadow.gotoAndPlay(2);
   this.MCsprite.shadow._alpha = 50;
   this.MCsprite.health._y = - Math.round(this.stats.height * this.parent.arena.tileSize2 * 0.5);
   this.MCsprite.health._xscale = min(500,this.stats.maxHealth * 5);
   this.MCsprite.health._alpha = 50;
   this.MCsprite.title._y = this.MCsprite.health._y + 14;
   this.MCsprite.title.message = dialogue("int_" + this.type + "_title").toUpperCase();
   this.MCsprite.repair._y = - this.parent.arena.tileSize2;
   this.MC._x = this.posX;
   this.MC._y = this.posY / 2;
   this.MC.swapDepths(this.parent.arena.getZ(this));
   this.color = new Color(this.MCsprite.building);
   this.handle = function()
   {
      this.count++;
      if(!this.target.active)
      {
         this.target = false;
      }
      this.healthPerc = Math.ceil(this.health / this.stats.maxHealth * 100);
      this.engageEnemy();
      this.draw();
      this.parent.arena.radar.addBlip(this);
      if(this.stats.refinery)
      {
         if(!(this.count % this.stats.revenueCount))
         {
            this.parent.cashUp(this.stats.revenue,this);
            this.refine();
         }
         if(!(this.count % 30))
         {
            this.makeNoise(this.type + "_action_" + (random(3) + 1));
         }
      }
      if(!(this.count % 10))
      {
         if(this.health < this.stats.maxHealth)
         {
            if(this.repairing || !this.friend && (this.parent.findBuilding("BA_" + this.parent.parent.oppo,this.parent.parent.oppo) || this.parent.findBuilding("BK_" + this.parent.parent.oppo,this.parent.parent.oppo)))
            {
               this.repairing = true;
               var _loc2_ = 20 * Math.round(1 / this.stats.maxHealth * this.stats.cost * 0.5);
               if(this.friend && this.parent.cash >= _loc2_ || !this.friend && this.parent.cashOppo >= _loc2_)
               {
                  this.hilite = true;
                  this.health = min(this.stats.maxHealth,this.health = this.health + 20);
                  if(this.friend)
                  {
                     this.parent.cash = this.parent.cash - _loc2_;
                  }
                  if(!this.friend)
                  {
                     this.parent.cashOppo = this.parent.cashOppo - _loc2_;
                  }
                  if(this.healthPerc > 25)
                  {
                     this.MCsprite.building.smoke.removeMovieClip();
                     if(!this.stats.weapon || this.stats.isHQ)
                     {
                        this.MCsprite.building.gotoAndPlay("loopstart");
                        this.MCsprite.shadow.gotoAndStop(15);
                     }
                  }
               }
               else
               {
                  this.repairing = false;
               }
            }
         }
         else
         {
            this.repairing = false;
         }
      }
   };
   this.draw = function()
   {
      if(this.stats.weapon && this.stats.rotatable)
      {
         var _loc2_ = Math.round(this.angle * 16) + 1;
         this.MCsprite.building.gotoAndStop(_loc2_);
         this.MCsprite.shadow.gotoAndStop(_loc2_);
         if(!(this.count % 4) && this.blink && (this.friend && !this.parent.powerOff || !this.friend && !this.parent.powerOffOppo))
         {
            this.angle = this.angle + sgn(Math.sin(this.count / 100)) * 0.0625;
            if(this.angle >= 1)
            {
               this.angle = this.angle - 1;
            }
            if(this.angle < 0)
            {
               this.angle = this.angle + 1;
            }
         }
      }
      this.MCsprite.health._visible = this.MCsprite.title._visible = this.selected;
      this.MCsprite.repairing._visible = this.repairing;
      if(this.parent.control.activeTarget == this)
      {
         this.MCsprite.health._visible = this.MCsprite.title._visible = true;
         this.MCsprite.health._alpha = this.MCsprite.title._alpha = 50;
      }
      if(this.selected)
      {
         this.MCsprite.health._alpha = this.MCsprite.title._alpha = 100;
      }
      this.MCsprite.health.gotoAndStop(this.healthPerc);
      if(this.hilite)
      {
         this.color.setTransform(hiliteColorTransform);
      }
      else
      {
         this.color.setTransform(resetColorTransform);
      }
      this.hilite = false;
      this.MCsprite.pulse._y = - this.stats.size2;
      this.MCsprite.pulse._visible = this.pulse;
      this.pulse = false;
   };
   this.checkForHit = function(x1, y1, x2, y2)
   {
      if(x2 == undefined)
      {
         if(x1 > (this.stats.topLeftX - 1) * this.parent.arena.tileSize && x1 < (this.stats.topLeftX + this.stats.width - 1) * this.parent.arena.tileSize && y1 > (this.stats.topLeftY - 1) * this.parent.arena.tileSize && y1 < (this.stats.topLeftY + this.stats.height - 2) * this.parent.arena.tileSize)
         {
            return this;
         }
         return false;
      }
      return false;
   };
   this.pain = function(weapon)
   {
      this.hilite = true;
      if(weapon.dmg)
      {
         this.health = this.health - weapon.dmg;
         var _loc3_ = new Array("UD_good_pain_1","UD_good_pain_2","UE_good_pain_1","UE_good_pain_1","UH_good_pain_1","UH_good_pain_1");
         this.parent.parent.sfx.play(_loc3_[random(6) + 1]);
      }
      this.healthPerc = Math.ceil(this.health / this.stats.maxHealth * 100);
      if(this.healthPerc <= 0)
      {
         this.destroy();
      }
      if(this.healthPerc <= 25)
      {
         if(!this.stats.weapon || this.stats.isHQ)
         {
            this.MCsprite.building.gotoAndStop(1);
            this.MCsprite.shadow.gotoAndStop(1);
         }
         if(!this.MCsprite.building.smoke)
         {
            this.parent.parent.sfx.play("INT_damage_" + (random(3) + 1));
            var _loc2_ = this.MCsprite.building.attachMovie("smoke","smoke",1);
            _loc2_._x = this.MCsprite.building._width / 2;
            _loc2_._y = this.MCsprite.building._height / 2;
            _loc2_._xscale = _loc2_._yscale = 200;
         }
      }
   };
   this.destroy = function(sold)
   {
      if(!this.active)
      {
         return undefined;
      }
      this.active = false;
      this.MC.removeMovieClip();
      this.parent.construction.doPrerequisites(this);
      this.freeBlock(!sold);
      if(sold)
      {
         if(this.friend)
         {
            this.parent.cash = this.parent.cash + Math.round(this.stats.cost * 0.5 * (this.healthPerc / 100));
         }
         if(!this.friend)
         {
            this.parent.cashOppo = this.parent.cashOppo + Math.round(this.stats.cost * 0.5 * (this.healthPerc / 100));
         }
      }
      if((this.friend || this.team == this.type.substr(3)) && this.parent.active)
      {
         for(var _loc3_ in this.stats.children)
         {
            var _loc2_ = this.stats.children[_loc3_];
            if(this.parent.construction.shortcuts[_loc2_].total < this.parent.construction.shortcuts[_loc2_].max)
            {
               this.parent.units.push(new Unit(this.parent,_loc2_,this.stats.dockPos.x,this.stats.dockPos.y,0.125 * random(8),this.team));
            }
         }
      }
      if(this.friend && this.stats.isHQ)
      {
         this.parent.lose();
      }
      if(!this.friend && this.stats.isHQ)
      {
         this.parent.win();
      }
   };
   this.setBlock = function(reveal)
   {
      var _loc8_ = this.stats.topLeftX;
      var _loc7_ = this.stats.topLeftX + this.stats.width;
      if(this.stats.width > 1)
      {
         _loc7_ = _loc7_ - 1;
      }
      var _loc5_ = this.stats.topLeftY;
      var _loc4_ = this.stats.topLeftY + (this.stats.height - 1);
      var _loc3_ = _loc8_;
      while(_loc3_ < _loc7_)
      {
         var _loc2_ = _loc5_;
         while(_loc2_ < _loc4_)
         {
            this.parent.arena.tiles[_loc3_][_loc2_] = this;
            if(reveal)
            {
               this.parent.arena.shroud.reveal(_loc3_,_loc2_,this.stats.spread);
            }
            _loc2_ = _loc2_ + 1;
         }
         _loc3_ = _loc3_ + 1;
      }
      this.refine();
   };
   this.refine = function()
   {
      if(!this.stats.refinery)
      {
         return undefined;
      }
      var _loc7_ = this.stats.topLeftX;
      var _loc6_ = this.stats.topLeftX + this.stats.width;
      var _loc5_ = this.stats.topLeftY;
      var _loc4_ = this.stats.topLeftY + this.stats.height;
      var _loc3_ = _loc7_;
      while(_loc3_ < _loc6_)
      {
         var _loc2_ = _loc5_;
         while(_loc2_ < _loc4_)
         {
            this.parent.arena.baits[_loc3_][_loc2_] = 10;
            _loc2_ = _loc2_ + 1;
         }
         _loc3_ = _loc3_ + 1;
      }
   };
   this.freeBlock = function(explode)
   {
      var _loc8_ = this.stats.topLeftX;
      var _loc7_ = this.stats.topLeftX + this.stats.width;
      if(this.stats.width > 1)
      {
         _loc7_ = _loc7_ - 1;
      }
      var _loc5_ = this.stats.topLeftY;
      var _loc4_ = this.stats.topLeftY + (this.stats.height - 1);
      var _loc3_ = _loc8_;
      while(_loc3_ < _loc7_)
      {
         var _loc2_ = _loc5_;
         while(_loc2_ < _loc4_)
         {
            if(explode)
            {
               this.parent.explode((_loc3_ - Math.random()) * this.parent.arena.tileSize,(_loc2_ - Math.random()) * this.parent.arena.tileSize);
               this.parent.explode((_loc3_ - Math.random()) * this.parent.arena.tileSize,(_loc2_ - Math.random()) * this.parent.arena.tileSize);
               this.parent.explode((_loc3_ - Math.random()) * this.parent.arena.tileSize,(_loc2_ - Math.random()) * this.parent.arena.tileSize);
               this.parent.explode((_loc3_ - Math.random()) * this.parent.arena.tileSize,(_loc2_ - Math.random()) * this.parent.arena.tileSize);
            }
            if(this.parent.arena.tiles[_loc3_][_loc2_] == this)
            {
               this.parent.arena.tiles[_loc3_][_loc2_] = false;
            }
            _loc2_ = _loc2_ + 1;
         }
         _loc3_ = _loc3_ + 1;
      }
   };
   this.setBlock(this.friend);
   this.engageEnemy = this.parent.engageEnemy;
   this.shoot = this.parent.shoot;
   this.makeNoise = this.parent.makeNoise;
   this.parent.construction.doPrerequisites(this);
   if(this.friend)
   {
      this.parent.camera.focus = this;
   }
   this.pain();
}

// 
function Level(parent, level){
   this.parent = parent;
   this.level = level;
   this.stats = new LevelStats(this);
   this.setup = this.stats.setup;
   this.outcome = this.stats.outcome;
   this.walkFrames = new Array("left","straight","right","straight");
   if(this.level == 10){
      SO.data.conflictGoodUnlocked = true;
   }
   if(this.level == 20){
      SO.data.conflictEvilUnlocked = true;
   }
   if(this.level == 5){
      SO.data.specialGoodUnlocked = true;
   }
   if(this.level == 15){
      SO.data.specialEvilUnlocked = true;
   }
   this.init = function(){
      _root.kvEvent(660 + this.level);
      var _loc4_ = undefined;
      this.MC = this.parent.MC.createEmptyMovieClip("level",10);
      this.active = true;
      this.uniqid = 1;
      this.powerLow = this.powerOff = false;
      this.powerLowOppo = this.powerOffOppo = false;
      this.training = false;
      this.jukebox = 1;
      this.count = 0;
      this.levelUpCounter = 0;
      this.levelUpCounterMax = 80;
      this.cash = 0;
      this.cashOppo = 0;
      this.parent.hud.displayCash = 0;
      this.indicator = false;
      this.camera = new Camera(this);
      this.fractomiser = new Fractomiser();
      this.squads = new Squads(this);
      this.arena = new Arena(this);
      this.control = new Control(this,38,39,40,37,32);
      this.construction = new Construction(this);
      this.indicators = new Array();
      this.weapons = new Array();
      this.buildings = new Array();
      this.units = new Array();
      this.setup();
      if(!this.camera.focus){
         var _loc3_ = this.findBuilding("BA_" + this.parent.team);
         this.camera.focus = _loc3_;
      }
      if(this.parent.parent.cheatCashup){
         this.cash = 50000;
      }
      if(this.parent.parent.cheatShroud){
         this.arena.shroud.clear();
      }
      this.parent.hud.showMessage(dialogue("int_level" + this.level + "_start"));
      this.parent.flash();
      this.parent.sfx.play("INT_windscape_start");
      this.parent.sfx.play("music_ingame_" + this.jukebox + "_start");
   };
   this.handle = function(){
      this.count++;
      this.handleIndicators();
      this.cleanup();
      this.control.handle();
      this.camera.handle();
      this.arena.handle();
      for(var _loc2_ in this.weapons){
         this.weapons[_loc2_].handle();
      }
      for(var _loc2_ in this.units){
         this.units[_loc2_].handle();
      }
      for(var _loc2_ in this.buildings){
         this.buildings[_loc2_].handle();
      }
      this.outcome();
      this.construction.handle();
      if(!this.active){
         this.outtro();
      }
   };
   this.outtro = function(){
      this.levelUpCounter++;
      if(this.levelUpCounter == 1){
         if(this.victory){
            this.parent.hud.showMessage(dialogue("int_level" + this.level + "_complete"));
         } else{
            this.parent.hud.showMessage(dialogue("int_levelLose"));
         }
      }
      if(this.levelUpCounter == this.levelUpCounterMax - 10){
         this.parent.flashin();
      }
      if(this.levelUpCounter == this.levelUpCounterMax){
         Mouse.show();
         var _loc4_ = this.level > 30;
         var _loc3_ = this.level == 33;
         var _loc2_ = this.level > 20 && !_loc4_;
         if(this.victory){
            if(this.level == 10 || this.level == 20){
               this.parent.parent.gameOver("complete");
            } else if(_loc2_ || _loc3_){
               this.parent.parent.gameOver(true);
            } else{
               this.parent.levelUp();
            }
         } else{
            this.parent.parent.gameOver();
         }
      }
   };
   this.win = function(){
      this.arena.shroud.clear();
      if(this.level < 21){
         if(this.level != 10 && this.level != 20){
            if(this.level < 11){
               SO.data.goodUnlocked = this.level;
            } else if(this.level < 21){
               SO.data.evilUnlocked = this.level;
            }
         }
      }
      this.victory = true;
      this.active = false;
      this.parent.sfx.play("music_ingame_" + this.jukebox + "_stop");
      this.parent.sfx.play("INT_optionsadd");
      for(var _loc3_ in this.units){
         var _loc2_ = this.units[_loc3_];
         if(_loc2_.active && !_loc2_.friend){
            _loc2_.destroy();
         }
      }
      for(var _loc3_ in this.buildings){
         _loc2_ = this.buildings[_loc3_];
         if(_loc2_.active && !_loc2_.friend){
            _loc2_.destroy();
         }
      }
   };
   this.lose = function(){
      this.active = false;
      this.victory = false;
      this.parent.sfx.play("music_ingame_" + this.jukebox + "_stop");
      this.parent.sfx.play("INT_optionsremove");
      for(var _loc3_ in this.units){
         var _loc2_ = this.units[_loc3_];
         if(_loc2_.active && _loc2_.friend){
            _loc2_.destroy();
         }
      }
      for(var _loc3_ in this.buildings){
         _loc2_ = this.buildings[_loc3_];
         if(_loc2_.active && _loc2_.friend){
            _loc2_.destroy();
         }
      }
   };
   this.destroy = function(){
      this.parent.sfx.play("music_ingame_" + this.jukebox + "_stop");
      this.parent.sfx.play("INT_windscape_stop");
   };
   this.fireWeapon = function(shooter, type, x, y, tx, ty, target){
      if(this.weapons.length > 50){
         return undefined;
      }
      if(type == "both"){
         this.weapons.push(new Weapon(this,shooter,"laser",x - 1,y - 1,tx,ty,target));
         this.weapons.push(new Weapon(this,shooter,"rocket",x - 1,y - 1,tx,ty,target));
      } else{
         this.weapons.push(new Weapon(this,shooter,type,x - 1,y - 1,tx,ty,target));
      }
   };
   this.cleanup = function(){
      this.construction.resetTotals();
      this.powerCharge = 50;
      this.powerDrain = 0;
      this.powerChargeOppo = 0;
      this.powerDrainOppo = 0;
      this.friends = 0;
      this.enemies = 0;
      this.outcomeFutures = 0;
      this.outcomeThreats = 0;
      this.arena.useds = this.arena.tiles.slice();
      for(var _loc5_ in this.arena.useds){
         this.arena.useds[_loc5_] = this.arena.useds[_loc5_].slice();
      }
      for(var _loc5_ in this.arena.baitList){
         this.arena.useds[this.arena.baitList[_loc5_].x][this.arena.baitList[_loc5_].y] = true;
      }
      var _loc2_ = undefined;
      var _loc10_ = new Array();
      _loc5_ = 0;
      while(_loc5_ < this.weapons.length){
         _loc2_ = this.weapons[_loc5_];
         if(_loc2_.active){
            _loc10_.push(_loc2_);
         }
         _loc5_ = _loc5_ + 1;
      }
      this.weapons = _loc10_;
      _loc10_ = new Array();
      _loc5_ = 0;
      while(_loc5_ < this.units.length){
         _loc2_ = this.units[_loc5_];
         if(_loc2_.active){
            _loc10_.push(_loc2_);
            if(_loc2_.friend){
               this.construction.shortcuts[_loc2_.type].total++;
            }
            if(!_loc2_.stats.altitude){
               this.arena.useds[_loc2_.tilePos.x][_loc2_.tilePos.y] = _loc2_;
            }
            if(_loc2_.stats.weapon || _loc2_.stats.repair){
               if(_loc2_.friend){
                  this.outcomeFutures++;
               } else{
                  this.outcomeThreats++;
               }
            }
            if(!_loc2_.friend){
               this.enemies++;
            } else{
               this.friends++;
            }
         }
         _loc5_ = _loc5_ + 1;
      }
      this.units = _loc10_;
      _loc10_ = new Array();
      var _loc8_ = false;
      var _loc7_ = false;
      _loc5_ = 0;
      while(_loc5_ < this.buildings.length){
         _loc2_ = this.buildings[_loc5_];
         if(_loc2_.active){
            _loc10_.push(_loc2_);
            if(_loc2_.friend){
               this.construction.shortcuts[_loc2_.type].total++;
            }
            if(_loc2_.friend){
               _loc8_ = _loc8_ || _loc2_.stats.isRadar;
               _loc7_ = _loc7_ || _loc2_.stats.isSatellite;
               if(_loc2_.stats.power > 0){
                  this.powerCharge = this.powerCharge + _loc2_.stats.power * (_loc2_.healthPerc / 100);
               }
               if(_loc2_.stats.power < 0){
                  this.powerDrain = this.powerDrain + (- _loc2_.stats.power);
               }
            } else{
               if(_loc2_.stats.power > 0){
                  this.powerChargeOppo = this.powerChargeOppo + _loc2_.stats.power * (_loc2_.healthPerc / 100);
               }
               if(_loc2_.stats.power < 0){
                  this.powerDrainOppo = this.powerDrainOppo + (- _loc2_.stats.power);
               }
            }
            var _loc4_ = _loc2_.stats.topLeftX;
            while(_loc4_ < _loc2_.stats.topLeftX + _loc2_.stats.width){
               this.arena.useds[_loc4_][_loc2_.stats.topLeftY + _loc2_.stats.height - 1] = _loc2_;
               _loc4_ = _loc4_ + 1;
            }
            var _loc3_ = _loc2_.stats.topLeftY;
            while(_loc3_ < _loc2_.stats.topLeftY + _loc2_.stats.height - 1){
               this.arena.useds[_loc2_.stats.topLeftX + _loc2_.stats.width - 1][_loc3_] = _loc2_;
               _loc3_ = _loc3_ + 1;
            }
            if(_loc2_.friend){
               this.outcomeFutures++;
            } else if(_loc2_.stats.isThreat){
               this.outcomeThreats++;
            }
         }
         _loc5_ = _loc5_ + 1;
      }
      this.buildings = _loc10_;
      var _loc12_ = this.powerLow;
      var _loc13_ = this.powerOff;
      var _loc11_ = this.powerCharge - this.powerDrain;
      this.powerLow = _loc11_ < 50;
      this.powerOff = _loc11_ < 0;
      _loc11_ = this.powerChargeOppo - this.powerDrainOppo;
      this.powerLowOppo = _loc11_ < 50;
      this.powerOffOppo = _loc11_ < 0;
      this.arena.shroud.active = !(_loc7_ && !this.powerLow);
      this.arena.radar.active = (_loc8_ || _loc7_) && !this.powerLow;
      if(!this.active){
         return undefined;
      }
      if(this.count > 200){
         if(this.powerLow && !_loc12_){
            this.parent.hud.showMessage(dialogue("int_power_low"));
            this.parent.sfx.play("INT_powerwarning");
         }
         if(!this.powerLow && _loc12_){
            this.parent.hud.showMessage(dialogue("int_power_on"));
         }
         if(this.powerOff && !_loc13_){
            this.parent.hud.showMessage(dialogue("int_power_off"));
            this.parent.sfx.play("INT_warning");
         }
      }
      if(!(this.count % 320)){
         this.friendlyTarget = false;
         var _loc9_ = 0;
         var _loc6_ = undefined;
         do{
            _loc6_ = this.buildings[random(this.buildings.length)];
            _loc9_ = _loc9_ + 1;
         } while(_loc9_ < this.buildings.length * 2 && (!_loc6_.friend || !_loc6_.stats.threat));
         if(_loc6_.friend && _loc6_.stats.threat){
            this.friendlyTarget = _loc6_;
         }
      }
   };
   this.explode = function(x, y, pulse){
      var _loc2_ = this.arena.MC.attachMovie("explosion","explosion_" + this.uniqid++,this.arena.MC.getNextHighestDepth());
      _loc2_._x = x;
      _loc2_._y = y / 2;
      var _loc3_ = this.arena.scorchMC.attachMovie("scorch","scorch" + this.arena.scorchMC.getNextHighestDepth(),this.arena.scorchMC.getNextHighestDepth());
      _loc3_._x = x;
      _loc3_._y = y / 2;
      if(pulse){
         _loc2_.gotoAndPlay("pulse");
      }
      _loc2_.swapDepths(this.arena.getZ(x,y + 100));
      this.camera.shake = this.camera.shake + 5;
   };
   this.engageEnemy = function(){
      if(!this.stats.weapon){
         return undefined;
      }
      if(this.isBuilding){
         if(this.friend && this.parent.powerOff){
            return undefined;
         }
         if(!this.friend && this.parent.powerOffOppo){
            return undefined;
         }
      }
      if(this.weaponCharge){
         this.weaponCharge--;
         return undefined;
      }
      if(this.blink){
         this.blink--;
         return undefined;
      }
      if(this.stats.boomerang && !this.target){
         return undefined;
      }
      if(this.target.stats.carrier && this.target.team == this.team){
         return undefined;
      }
      if(this.stats.flying && this.nav.landerPerc > 25 && !this.stats.transformer){
         return undefined;
      }
      var target;
      if(this.target){
         target = this.target;
      } else{
         var _loc4_ = 1;
         for(var _loc6_ in this.parent.buildings){
            var _loc3_ = this.parent.buildings[_loc6_];
            if(_loc3_.friend != this.friend){
               if(_loc3_.stats.threat >= _loc4_){
                  if(!(this.friend && !_loc3_.stats.weapon)){
                     var _loc5_ = distance(this.posX,this.posY,_loc3_.posX,_loc3_.posY);
                     if(_loc5_ < this.stats.weaponRange){
                        target = _loc3_;
                        _loc4_ = target.stats.threat;
                     }
                  }
               }
            }
         }
         for(var _loc6_ in this.parent.units){
            var _loc2_ = this.parent.units[_loc6_];
            if(_loc2_.friend != this.friend){
               if(!_loc2_.stats.pickup){
                  if(!(_loc2_.stats.flying && this.stats.weapon == "laser" && _loc2_.nav.landerPerc < 75)){
                     if(_loc2_.stats.threat >= _loc4_){
                        _loc5_ = distance(this.posX,this.posY,_loc2_.posX,_loc2_.posY);
                        if(_loc5_ < this.stats.weaponRange){
                           target = _loc2_;
                           _loc4_ = target.stats.threat;
                        }
                     }
                  }
               }
            }
         }
         if(target && this.hal && !(target.isBuilding && target.stats.weapon)){
            this.target = target;
         }
         this.blink = 10 + random(4);
      }
      if(!target){
         return undefined;
      }
      if(this.hal && this.target){
         this.hal.type = "seek";
      }
      this.shoot(target);
   };
   this.shoot = function(target){
      if(!this.stats.weapon){
         return undefined;
      }
      if(!target){
         target = this.target;
      }
      if(this.parent.training && !this.friend){
         return undefined;
      }
      this.blink = 0;
      var _loc5_ = target.posY - this.posY;
      var _loc6_ = target.posX - this.posX;
      if(_loc6_ * _loc6_ + _loc5_ * _loc5_ > this.stats.weaponRange * this.stats.weaponRange){
         return undefined;
      }
      if(this.weaponPayload <= 0){
         this.target = false;
         this.nav.returnHome();
         return undefined;
      }
      this.weaponPayload--;
      var _loc2_ = Math.atan2(_loc5_,_loc6_) / 6.283185307179586 + 0.25;
      var _loc4_ = _loc2_ - this.angle;
      if(Math.abs(_loc4_) > 0.5){
         _loc4_ = (1 - Math.abs(_loc4_)) * (- _loc4_ / Math.abs(_loc4_));
      }
      _loc2_ = this.angle + 0.5 * _loc4_;
      while(_loc2_ >= 1){
         _loc2_ = _loc2_ - 1;
      }
      while(_loc2_ < 0){
         _loc2_ = _loc2_ + 1;
      }
      this.nav.nextAngle = this.angle = _loc2_;
      this.parent.fireWeapon(this,this.stats.weapon,this.posX,this.posY - this.stats.size - this.stats.altitudeT2,target.posX,target.posY - target.stats.size - target.stats.altitudeT2,target);
      this.pulse = true;
      this.weaponCharge = this.stats.maxWeaponCharge + random(this.stats.maxWeaponCharge);
      this.makeNoise(this.type + "_action_" + (random(3) + 1));
   };
   this.makeNoise = function(id){
      if(!this.parent.arena.onDisplay(this)){
         return undefined;
      }
      this.parent.parent.sfx.play(id);
   };
   this.cashUp = function(cash, unit){
      if(unit.friend){
         this.cash = this.cash + cash * 5;
      }
      if(!unit.friend){
         this.cashOppo = this.cashOppo + cash * 5;
      }
   };
   this.findBuilding = function(type, team){
      var _loc3_ = this.buildings.length - 1;
      while(_loc3_ >= 0){
         var _loc2_ = this.buildings[_loc3_];
         if(_loc2_.active && _loc2_.type == type && (!team || _loc2_.team == team)){
            return _loc2_;
         }
         _loc3_ = _loc3_ - 1;
      }
      return false;
   };
   this.findUnit = function(type, team){
      var _loc3_ = 0;
      while(_loc3_ < this.units.length){
         var _loc2_ = this.units[_loc3_];
         if(_loc2_.active && _loc2_.type == type && (!team || _loc2_.team == team)){
            return _loc2_;
         }
         _loc3_ = _loc3_ + 1;
      }
      return false;
   };
   this.handleIndicators = function(){
      if(!this.active){
         this.indicator = false;
         return undefined;
      }
      if(!this.indicator && this.count > 60 || this.indicator.conditionMet()){
         this.indicator = this.indicators.shift();
      }
      this.control.indicatorMC._visible = this.parent.hud.MC.indicator._visible = false;
      var _loc2_ = this.indicator.MC;
      if(this.indicator){
         if(_loc2_ && this.indicator.posX){
            _loc2_._visible = true;
            _loc2_._x = this.indicator.posX;
            _loc2_._y = this.indicator.posY / 2;
            _loc2_.arrow.message = this.indicator.message;
         }
         if(this.indicator.conditionType == "selected" || this.indicator.conditionType == "voyage" || this.indicator.conditionType == "focus"){
            this.camera.focus = this.indicator;
         }
      }
      if(this.indicators.length == 0 && this.level >= 3){
         this.training = false;
      }
   };
   this.launchSuperweapon = function(x, y){
      this.parent.hud.flashthru();
      var _loc13_ = this.arena.MC.attachMovie("superweapon","superweapon",this.arena.MC.getNextHighestDepth());
      _loc13_.swapDepths(this.arena.getZ(x,y));
      _loc13_._x = x;
      _loc13_._y = y / 2;
      _loc13_ = this.arena.scorchMC.attachMovie("superweapon_scorch","scorch" + this.arena.scorchMC.getNextHighestDepth(),this.arena.scorchMC.getNextHighestDepth());
      _loc13_._x = x;
      _loc13_._y = y / 2;
      this.camera.shake = this.camera.shake + 200;
      this.parent.sfx.play("INT_superweapon");
      var _loc2_ = undefined;
      var _loc4_ = undefined;
      var _loc3_ = undefined;
      var _loc5_ = undefined;
      var _loc7_ = undefined;
      var _loc6_ = 400;
      var _loc10_ = 1000;
      for(var _loc12_ in this.buildings){
         _loc2_ = this.buildings[_loc12_];
         _loc4_ = x - _loc2_.posX;
         _loc3_ = y - _loc2_.posY;
         _loc5_ = Math.sqrt(_loc4_ * _loc4_ + _loc3_ * _loc3_);
         if(_loc5_ < _loc6_){
            _loc7_ = Math.round((1 - _loc5_ / _loc6_) * _loc10_);
            _loc2_.pain({dmg:_loc7_});
         }
      }
      for(var _loc12_ in this.units){
         _loc2_ = this.units[_loc12_];
         _loc4_ = x - _loc2_.posX;
         _loc3_ = y - _loc2_.posY;
         _loc5_ = Math.sqrt(_loc4_ * _loc4_ + _loc3_ * _loc3_);
         if(_loc5_ < _loc6_){
            _loc7_ = Math.round((1 - _loc5_ / _loc6_) * _loc10_);
            _loc2_.pain({dmg:_loc7_});
         }
      }
   };
   if(!BUILDMODE){
      var _loc26_ = this.parent.parent;
      _loc26_.state = "movie";
      _loc26_.movieName = this.level + 10;
      _loc26_.doEndMovie = function(input){
         this.game.level.init();
         this.state = "hidden";
         if(input == "skip"){
            this.sfx.play("music_movies_stop");
         }
      };
   } else{
      this.init();
   }
}

function Construction(parent)
{
   this.isConstruction = true;
   this.parent = parent;
   this.MC = this.parent.parent.hud.MC.construction;
   this.shortcuts = {};
   this.options = new Array();
   var _loc11_ = new Array("A","B","C","D","E","F","R","G","H","I","J","K","L","P");
   var _loc14_ = 0;
   while(_loc14_ < _loc11_.length)
   {
      var _loc3_ = _loc11_[_loc14_];
      this.options.push(this.shortcuts["B" + _loc3_ + "_" + this.parent.parent.team] = new BuildingStats("B" + _loc3_ + "_" + this.parent.parent.team));
      this.options.push(this.shortcuts["B" + _loc3_ + "_" + this.parent.parent.oppo] = new BuildingStats("B" + _loc3_ + "_" + this.parent.parent.oppo));
      this.options.push(this.shortcuts["U" + _loc3_ + "_" + this.parent.parent.team] = new UnitStats("U" + _loc3_ + "_" + this.parent.parent.team));
      this.options.push(this.shortcuts["U" + _loc3_ + "_" + this.parent.parent.oppo] = new UnitStats("U" + _loc3_ + "_" + this.parent.parent.oppo));
      _loc14_ = _loc14_ + 1;
   }
   this.gap = 5;
   this.maxOnScreen = 6;
   this.mugshotWidth = 50;
   this.mugshotHeight = 30;
   this.constructingBuilding = false;
   this.constructingUnit = false;
   this.speed = 8;
   if(this.parent.parent.parent.cheatBuildspeed)
   {
      this.speed = this.speed * 10;
   }
   this.scrollSpeed = 0.25;
   this.scrollBuildingsPerc = 0;
   this.scrollBuildings = 0;
   this.scrollBuildingsDir = 0;
   this.scrollUnitsPerc = 0;
   this.scrollUnits = 0;
   this.scrollUnitsDir = 0;
   this.doPrereq = false;
   this.mask = this.MC.attachMovie("blank","mask",10);
   this.mask._width = this.mugshotWidth * 2 + this.gap;
   this.mask._height = this.mugshotHeight * this.maxOnScreen;
   this.glowFilter = new flash.filters.GlowFilter(16777215,100,10,10,2,1,true);
   this.MC.setMask(this.mask);
   this.handle = function()
   {
      if(this.doPrereq)
      {
         this.doPrerequisites();
         this.doPrerequisites();
      }
      this.scroll();
      this.sufficientFunds = true;
      if(this.buildingSite)
      {
         this.buildingSite.handle();
      }
      if(!this.constructingBuilding.active)
      {
         this.cancel(this.constructingBuilding,true);
      }
      if(!this.constructingUnit.active)
      {
         this.cancel(this.constructingUnit,true);
      }
      this.construct(this.constructingBuilding);
      this.construct(this.constructingUnit);
      this.overOption = false;
      var _loc9_ = false;
      var _loc10_ = this.MC.hitTest(_xmouse,_ymouse,true);
      for(var _loc11_ in this.options)
      {
         var _loc2_ = this.options[_loc11_];
         _loc2_.MC.filters = [];
         _loc2_.MC._alpha = 100;
         _loc2_.checkMax(_loc2_.total);
         var _loc6_ = _loc2_.isBuilding && this.constructingBuilding && this.constructingBuilding != _loc2_ || _loc2_.isUnit && this.constructingUnit && this.constructingUnit != _loc2_;
         if(_loc2_.disabled || _loc6_)
         {
            _loc2_.MC._alpha = 50;
         }
         if(_loc2_.active)
         {
            if(_loc10_)
            {
               var _loc3_ = {x:_xmouse,y:_ymouse};
               _loc2_.MC.globalToLocal(_loc3_);
               if(_loc3_.x > 0 && _loc3_.x <= this.mugshotWidth && _loc3_.y > 0 && _loc3_.y <= this.mugshotHeight)
               {
                  this.overOption = _loc2_;
                  if(_loc2_.MC._alpha == 100)
                  {
                     _loc2_.MC.filters = [this.glowFilter];
                  }
                  _loc9_ = true;
                  var _loc4_ = "$" + _loc2_.cost;
                  if(_loc2_.progress)
                  {
                     var _loc5_ = String(Math.ceil(100 * _loc2_.progress / _loc2_.constructionTime));
                     if(_loc5_ >= 100)
                     {
                        _loc4_ = dialogue("int_construction_complete");
                     }
                     else
                     {
                        if(_loc5_.length < 2)
                        {
                           _loc5_ = "0" + _loc5_;
                        }
                        _loc4_ = _loc5_ + dialogue("int_construction_progress");
                        if(!this.sufficientFunds)
                        {
                           _loc4_ = dialogue("int_construction_insufficient");
                        }
                     }
                  }
                  if(_loc2_.disabled)
                  {
                     _loc4_ = dialogue("int_construction_max");
                     this.overOption = false;
                     _loc2_.MC.filters = [];
                  }
                  this.parent.arena.radar.showStats(_loc2_.title,_loc4_);
               }
            }
         }
      }
      this.parent.arena.radar.stats._visible = _loc9_;
   };
   this.scroll = function()
   {
      if(this.scrollBuildingsDir)
      {
         this.scrollBuildingsPerc = this.scrollBuildingsPerc + this.scrollSpeed * this.scrollBuildingsDir;
         if(Math.abs(this.scrollBuildingsPerc) >= 1)
         {
            this.scrollBuildings = this.scrollBuildings + this.scrollBuildingsDir;
            this.scrollBuildingsDir = this.scrollBuildingsPerc = 0;
         }
      }
      if(this.scrollUnitsDir)
      {
         this.scrollUnitsPerc = this.scrollUnitsPerc + this.scrollSpeed * this.scrollUnitsDir;
         if(Math.abs(this.scrollUnitsPerc) >= 1)
         {
            this.scrollUnits = this.scrollUnits + this.scrollUnitsDir;
            this.scrollUnitsDir = this.scrollUnitsPerc = 0;
         }
      }
      if(this.scrollBuildings < - this.buildings - this.maxOnScreen)
      {
         this.scrollBuildings = - this.buildings - this.maxOnScreen;
      }
      if(this.scrollBuildings > 0)
      {
         this.scrollBuildings = 0;
      }
      if(this.scrollUnits < - this.units - this.maxOnScreen)
      {
         this.scrollUnits = - this.units - this.maxOnScreen;
      }
      if(this.scrollUnits > 0)
      {
         this.scrollUnits = 0;
      }
      this.MCbuildings._y = (this.scrollBuildings + this.scrollBuildingsPerc) * this.mugshotHeight;
      this.MC._parent.buildings_up._visible = this.buildings > this.maxOnScreen && this.scrollBuildings < 0;
      this.MC._parent.buildings_down._visible = this.buildings > this.maxOnScreen && this.scrollBuildings > this.maxOnScreen - this.buildings;
      this.MCunits._y = (this.scrollUnits + this.scrollUnitsPerc) * this.mugshotHeight;
      this.MC._parent.units_up._visible = this.units > this.maxOnScreen && this.scrollUnits < 0;
      this.MC._parent.units_down._visible = this.units > this.maxOnScreen && this.scrollUnits > this.maxOnScreen - this.units;
   };
   this.buildMenus = function()
   {
      this.MCbuildings = this.MC.createEmptyMovieClip("buildings",1);
      this.MCunits = this.MC.createEmptyMovieClip("units",2);
      this.MCunits._x = this.gap + this.mugshotWidth;
      var _loc6_ = this.buildings;
      var _loc5_ = this.units;
      this.buildings = 0;
      this.units = 0;
      var _loc2_ = 0;
      while(_loc2_ < this.options.length)
      {
         var _loc3_ = this.options[_loc2_];
         if(_loc3_.active)
         {
            var _loc4_ = "buildings";
            if(_loc3_.isUnit)
            {
               _loc4_ = "units";
            }
            this[_loc4_]++;
            var MC = _loc3_.MC = this["MC" + _loc4_].attachMovie("mugshots","mugshot_" + _loc3_.type,_loc2_);
            MC._y = (this[_loc4_] - 1) * this.mugshotHeight;
            MC.option.gotoAndStop(_loc3_.type);
            MC.progress._visible = false;
            this.options[_loc2_].MC = MC;
            this.options[_loc2_].posX = MC._x + this["MC" + _loc4_]._x + this.MC._x + this.mugshotWidth - 10;
            this.options[_loc2_].posY = (MC._y + this["MC" + _loc4_]._y + this.MC._y) * 2 + this.mugshotHeight;
         }
         _loc2_ = _loc2_ + 1;
      }
      if(this.buildings > _loc6_ || this.units > _loc5_)
      {
         this.parent.parent.sfx.play("INT_optionsadd");
      }
      if(this.buildings < _loc6_ || this.units < _loc5_)
      {
         this.parent.parent.sfx.play("INT_optionsremove");
      }
   };
   this.doMouse = function(x, y)
   {
      if(!this.parent.training)
      {
         if(this.parent.parent.hud.MC.sell.hitTest(x,y,true))
         {
            this.parent.control.resetSelected();
            this.parent.control.advancedCursorState = "sell";
            this.parent.parent.sfx.play("INT_cursor_select");
            return true;
         }
         if(this.parent.parent.hud.MC.repair.hitTest(x,y,true))
         {
            this.parent.control.resetSelected();
            this.parent.control.advancedCursorState = "repair";
            this.parent.parent.sfx.play("INT_cursor_select");
            return true;
         }
      }
      if(!this.scrollBuildingsDir)
      {
         if(this.MC._parent.buildings_up._visible && this.MC._parent.buildings_up.hitTest(x,y,true))
         {
            this.scrollBuildingsDir = 1;
         }
         if(this.MC._parent.buildings_down._visible && this.MC._parent.buildings_down.hitTest(x,y,true))
         {
            this.scrollBuildingsDir = -1;
         }
         if(this.scrollBuildingsDir)
         {
            this.parent.parent.sfx.play("INT_cursor_select");
            this.parent.parent.sfx.play("INT_scrollv");
            return true;
         }
      }
      if(!this.scrollUnitsDir)
      {
         if(this.MC._parent.units_up._visible && this.MC._parent.units_up.hitTest(x,y,true))
         {
            this.scrollUnitsDir = 1;
         }
         if(this.MC._parent.units_down._visible && this.MC._parent.units_down.hitTest(x,y,true))
         {
            this.scrollUnitsDir = -1;
         }
         if(this.scrollUnitsDir)
         {
            this.parent.parent.sfx.play("INT_cursor_select");
            this.parent.parent.sfx.play("INT_scrollv");
            return true;
         }
      }
      if(!this.MC.hitTest(x,y,true))
      {
         return false;
      }
      current = this.overOption;
      if(!current || this.parent.control.advancedCursorState == "superweapon")
      {
         return false;
      }
      if(this.constructingBuilding == current && current.progress == current.constructionTime)
      {
         this.buildingSite = new BuildingSite(this,this.constructingBuilding.type);
         this.cancel(this.constructingBuilding);
         return undefined;
      }
      if(this.constructingUnit == current && current.progress == current.constructionTime && current.superweapon)
      {
         this.parent.control.advancedCursorState = "superweapon";
         this.cancel(this.constructingUnit);
         return undefined;
      }
      if(current.inProgress)
      {
         if(current.isBuilding)
         {
            this.cancel(this.constructingBuilding);
         }
         if(current.isUnit)
         {
            this.cancel(this.constructingUnit);
         }
         return true;
      }
      if(current.isBuilding)
      {
         if(this.constructingBuilding)
         {
            this.parent.parent.sfx.play("INT_invalid");
            return true;
         }
         if(this.parent.cash)
         {
            current.inProgress = true;
            this.constructingBuilding = current;
            this.parent.parent.sfx.play("INT_construction");
         }
         else
         {
            this.parent.parent.sfx.play("INT_nofunds");
         }
      }
      if(current.isUnit)
      {
         if(this.constructingUnit)
         {
            this.parent.parent.sfx.play("INT_invalid");
            return true;
         }
         if(this.parent.cash)
         {
            current.inProgress = true;
            this.constructingUnit = current;
            this.parent.parent.sfx.play("INT_construction");
         }
         else
         {
            this.parent.parent.sfx.play("INT_nofunds");
         }
      }
      return true;
   };
   this.cancel = function(item, refund)
   {
      if(!item)
      {
         return undefined;
      }
      item.MC.progress._visible = false;
      item.inProgress = false;
      if(item.progress < item.constructionTime || refund)
      {
         this.parent.cash = this.parent.cash + item.progress / item.constructionTime * item.cost;
      }
      item.progress = 0;
      if(item.isBuilding)
      {
         this.constructingBuilding = item = false;
      }
      if(item.isUnit)
      {
         this.constructingUnit = item = false;
      }
      this.parent.parent.sfx.play("INT_invalid");
   };
   this.construct = function(item)
   {
      if(!item)
      {
         return undefined;
      }
      if(!item.inProgress)
      {
         item.MC.progress._visible = true;
         item.MC.progress.gotoAndStop(100);
         return undefined;
      }
      var _loc3_ = this.speed;
      if(this.parent.powerLow)
      {
         _loc3_ = _loc3_ * 0.5;
      }
      _loc3_ = Math.ceil(_loc3_);
      var _loc4_ = item.progress + _loc3_ - item.constructionTime;
      if(_loc4_ > 0)
      {
         _loc3_ = _loc3_ - _loc4_;
      }
      var _loc5_ = Math.ceil(_loc3_ / item.constructionTime * item.cost);
      if(this.parent.cash < _loc5_)
      {
         this.sufficientFunds = false;
         return undefined;
      }
      this.parent.cash = this.parent.cash - _loc5_;
      item.progress = item.progress + _loc3_;
      item.progress = min(item.progress,item.constructionTime);
      var _loc6_ = Math.ceil(100 * item.progress / item.constructionTime);
      item.MC.progress._visible = true;
      item.MC.progress.gotoAndStop(_loc6_);
      if(item.progress == item.constructionTime)
      {
         item.inProgress = false;
         if(item.isUnit)
         {
            if(!item.superweapon)
            {
               this.parent.units.push(new Unit(this.parent,item.type,null,null,0.125 * random(8),this.parent.parent.team));
               this.cancel(item);
               this.parent.parent.sfx.play("INT_constructioncomplete_unit");
            }
            else
            {
               this.parent.parent.sfx.play("INT_constructioncomplete_building");
            }
         }
         else
         {
            this.parent.parent.sfx.play("INT_constructioncomplete_building");
         }
      }
   };
   this.doPrerequisites = function(obj)
   {
      if(obj)
      {
         this.doPrereq = true;
         return undefined;
      }
      this.doPrereq = false;
      for(var _loc3_ in this.options)
      {
         this.options[_loc3_].active = false;
      }
      var _loc4_ = new Array(this.parent.parent.team,this.parent.parent.oppo);
      _loc3_ = 0;
      while(_loc3_ < _loc4_.length)
      {
         var _loc2_ = _loc4_[_loc3_];
         if(this.parent.findBuilding("BA_" + _loc2_,this.parent.parent.team).friend || this.parent.findBuilding("BK_" + _loc2_,this.parent.parent.team).friend)
         {
            if(this.parent.findBuilding("BA_" + _loc2_,this.parent.parent.team).friend)
            {
               this.shortcuts["UD_" + _loc2_].active = true;
            }
            if(this.parent.findBuilding("BK_" + _loc2_,this.parent.parent.team).friend)
            {
               this.shortcuts["UP_" + _loc2_].active = true;
               this.shortcuts["BL_" + _loc2_].active = true;
            }
            this.shortcuts["BB_" + _loc2_].active = true;
            if(this.parent.findBuilding("BB_" + _loc2_,this.parent.parent.team).friend)
            {
               this.shortcuts["BC_" + _loc2_].active = true;
            }
            if(this.parent.findBuilding("BC_" + _loc2_,this.parent.parent.team).friend)
            {
               this.shortcuts["BD_" + _loc2_].active = true;
               this.shortcuts["BE_" + _loc2_].active = true;
               this.shortcuts["BF_" + _loc2_].active = true;
            }
            if(this.parent.findBuilding("BE_" + _loc2_,this.parent.parent.team).friend && this.parent.findBuilding("BF_" + _loc2_,this.parent.parent.team).friend)
            {
               this.shortcuts["BG_" + _loc2_].active = true;
               this.shortcuts["UF_" + _loc2_].active = true;
               if(this.parent.findBuilding("BG_" + _loc2_,this.parent.parent.team).friend)
               {
                  this.shortcuts["BH_" + _loc2_].active = true;
                  if(this.parent.findBuilding("BH_" + _loc2_,this.parent.parent.team).friend)
                  {
                     this.shortcuts["UK_" + _loc2_].active = true;
                  }
               }
            }
         }
         if(this.parent.findBuilding("BC_" + _loc2_,this.parent.parent.team).friend)
         {
            this.shortcuts["UA_" + _loc2_].active = true;
            this.shortcuts["UB_" + _loc2_].active = true;
            if(this.parent.findBuilding("BG_" + _loc2_,this.parent.parent.team).friend)
            {
               this.shortcuts["UC_" + _loc2_].active = true;
            }
         }
         if(this.parent.findBuilding("BE_" + _loc2_,this.parent.parent.team).friend)
         {
            this.shortcuts["UE_" + _loc2_].active = true;
            if(this.parent.findBuilding("BL_" + _loc2_,this.parent.parent.team).friend)
            {
               this.shortcuts["UR_" + _loc2_].active = true;
            }
         }
         if(this.parent.findBuilding("BF_" + _loc2_,this.parent.parent.team).friend)
         {
            this.shortcuts["UG_" + _loc2_].active = true;
            if(this.parent.findBuilding("BE_" + _loc2_,this.parent.parent.team).friend && this.parent.findBuilding("BG_" + _loc2_,this.parent.parent.team).friend)
            {
               this.shortcuts["UH_" + _loc2_].active = true;
            }
         }
         _loc3_ = _loc3_ + 1;
      }
      this.shortcuts.BL_evil.active = false;
      if(this.parent.parent.team == "good")
      {
         if(this.parent.level < 3)
         {
            this.shortcuts.BB_good.active = false;
            this.shortcuts.BC_good.active = false;
         }
         if(this.parent.level < 4)
         {
            this.shortcuts.UB_good.max = 1;
            this.shortcuts.UD_good.active = false;
            this.shortcuts.BE_good.active = false;
         }
         if(this.parent.level < 5)
         {
            this.shortcuts.BF_good.active = false;
            this.shortcuts.UG_good.active = false;
         }
         if(this.parent.level < 6)
         {
            this.shortcuts.BG_good.active = false;
         }
         if(this.parent.level < 7)
         {
            this.shortcuts.UF_good.active = false;
         }
         if(this.parent.level < 8)
         {
            this.shortcuts.BH_good.active = false;
            this.shortcuts.UH_good.active = false;
         }
         if(this.parent.level != 10 && this.parent.level != 20)
         {
            this.shortcuts.UK_good.active = false;
            this.shortcuts.UK_evil.active = false;
         }
         if(this.parent.level == 21)
         {
            this.shortcuts.UJ_good.active = true;
            this.shortcuts.BG_good.active = false;
            this.shortcuts.UF_good.active = false;
         }
         if(this.parent.level == 22)
         {
            this.shortcuts.BI_good.active = true;
            this.shortcuts.BD_good.active = false;
            this.shortcuts.BE_good.active = false;
            this.shortcuts.BF_good.active = false;
         }
         if(this.parent.level == 23)
         {
            this.shortcuts.BB_good.active = true;
            this.shortcuts.BH_good.active = true;
         }
         if(this.parent.level == 31)
         {
            this.shortcuts.BB_good.active = false;
         }
      }
      if(this.parent.parent.team == "evil")
      {
         if(this.parent.level < 14)
         {
            this.shortcuts.BC_evil.active = false;
            this.shortcuts.UD_evil.active = false;
         }
         if(this.parent.level < 15)
         {
            this.shortcuts.BF_evil.active = false;
            this.shortcuts.UB_evil.active = false;
         }
         if(this.parent.level == 15)
         {
            this.shortcuts.UA_evil.active = false;
         }
         if(this.parent.level < 17)
         {
            this.shortcuts.BE_evil.active = false;
         }
         if(this.parent.level < 19)
         {
            this.shortcuts.BH_evil.active = false;
            this.shortcuts.UH_evil.active = false;
         }
         if(this.parent.level == 28)
         {
            this.speed = 50;
            this.shortcuts.UK_evil.active = true;
         }
      }
      if(this.buildingSite && !this.shortcuts[this.buildingSite.type].active)
      {
         this.buildingSite.destroy();
      }
      this.buildMenus();
   };
   this.resetTotals = function()
   {
      for(var _loc2_ in this.options)
      {
         this.options[_loc2_].total = 0;
      }
   };
}

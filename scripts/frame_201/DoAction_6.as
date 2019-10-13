function BuildingStats(parent)
{
   this.isBuilding = true;
   this.parent = parent;
   this.type = this.parent.type;
   if(!this.parent.type)
   {
      this.type = parent;
   }
   this.active = !this.parent.isConstruction?false:true;
   this.title = dialogue("int_" + this.type + "_title");
   this.inProgress = false;
   this.progress = 0;
   this.spread = 2;
   this.weapon = false;
   this.maxWeaponCharge = 0;
   this.powerMargin = 2;
   this.altitude = 0;
   this.size = 0;
   this.repairable = true;
   this.rotatable = false;
   this.miner = false;
   this.isHQ = false;
   this.isRadar = false;
   this.isSatellite = false;
   this.maxWeaponPayload = 9999999;
   this.children = new Array();
   if(this.type == "BA_good" || this.type == "BA_evil" || this.type == "BK_good" || this.type == "BK_evil")
   {
      this.max = 1;
      this.isHQ = true;
      this.width = 2;
      this.height = 4;
      this.threat = 2;
      this.isThreat = true;
      this.cost = 3000;
      this.power = 1;
      this.maxHealth = 1500;
      this.spread = 3;
      if(this.type == "BK_good" || this.type == "BK_evil")
      {
         this.weapon = "rocket";
         this.maxWeaponCharge = 10;
         this.weaponRange = 500;
      }
   }
   if(this.type == "BB_good" || this.type == "BB_evil")
   {
      this.max = 8;
      this.width = 1;
      this.height = 2;
      this.threat = 3;
      this.isThreat = false;
      this.cost = 800;
      this.power = 200;
      this.maxHealth = 750;
      this.children.push("UA_" + this.type.substr(3));
   }
   if(this.type == "BC_good" || this.type == "BC_evil")
   {
      this.max = 2;
      this.width = 2;
      this.height = 2;
      this.threat = 3;
      this.isThreat = true;
      this.cost = 500;
      this.power = -10;
      this.maxHealth = 500;
      this.children.push("UA_" + this.type.substr(3));
   }
   if(this.type == "BD_good" || this.type == "BD_evil")
   {
      this.max = 12;
      this.width = 1;
      this.height = 2;
      this.threat = 8;
      this.isThreat = false;
      this.cost = 1500;
      this.power = -75;
      this.maxHealth = 600;
      this.weapon = "rocket";
      this.maxWeaponCharge = 4;
      this.weaponRange = 300;
      this.spread = 4;
      this.size = 90;
      this.rotatable = true;
   }
   if(this.type == "BE_good" || this.type == "BE_evil")
   {
      this.max = 2;
      this.width = 2;
      this.height = 3;
      this.threat = 3;
      this.isThreat = true;
      this.cost = 2000;
      this.power = -25;
      this.maxHealth = 1000;
      this.children.push("UA_" + this.type.substr(3));
      this.children.push("UA_" + this.type.substr(3));
   }
   if(this.type == "BF_good" || this.type == "BF_evil")
   {
      this.max = 1;
      this.width = 2;
      this.height = 3;
      this.threat = 3;
      this.isThreat = true;
      this.cost = 1000;
      this.power = -50;
      this.maxHealth = 600;
      this.isRadar = true;
      this.children.push("UA_" + this.type.substr(3));
   }
   if(this.type == "BG_good" || this.type == "BG_evil")
   {
      this.max = 1;
      this.width = 1;
      this.height = 2;
      this.threat = 5;
      this.isThreat = true;
      this.cost = 2000;
      this.power = -100;
      this.maxHealth = 500;
      this.children.push("UC_" + this.type.substr(3));
   }
   if(this.type == "BH_good" || this.type == "BH_evil")
   {
      this.max = 5;
      this.width = 1;
      this.height = 2;
      this.threat = 7;
      this.isThreat = false;
      this.cost = 1500;
      this.power = -100;
      this.maxHealth = 1000;
      this.isSatellite = true;
      this.children.push("UA_" + this.type.substr(3));
   }
   if(this.type == "BI_good" || this.type == "BI_evil")
   {
      this.max = 1;
      this.width = 4;
      this.height = 3;
      this.threat = 0;
      this.isThreat = false;
      this.cost = 19660;
      this.power = 0;
      this.maxHealth = 1000;
   }
   if(this.type == "BJ_evil")
   {
      this.max = 1;
      this.width = 1;
      this.height = 2;
      this.threat = 3;
      this.isThreat = true;
      this.cost = 1500;
      this.power = 100;
      this.maxHealth = 1000;
      this.isRadar = true;
      this.isHQ = true;
   }
   if(this.type == "BL_good")
   {
      this.max = 4;
      this.width = 2;
      this.height = 3;
      this.threat = 1;
      this.isThreat = true;
      this.cost = 3000;
      this.power = -100;
      this.power = 0;
      this.maxHealth = 3000;
      this.children.push("UA_" + this.type.substr(3));
      this.children.push("UB_" + this.type.substr(3));
      this.refinery = true;
      this.revenue = 100;
      this.revenueCount = 300;
   }
   if(this.type == "BX_good")
   {
      this.max = 1;
      this.isHQ = true;
      this.width = 2;
      this.height = 4;
      this.threat = 2;
      this.isThreat = true;
      this.cost = 3000;
      this.power = 0;
      this.maxHealth = 1500;
      this.spread = 3;
   }
   if(this.parent.friend)
   {
      if(this.parent.parent.parent.parent.cheatFirepower && this.maxWeaponCharge)
      {
         this.maxWeaponCharge = max(Math.floor(this.maxWeaponCharge = this.maxWeaponCharge / 2),2);
      }
      if(this.parent.parent.parent.parent.cheatShields)
      {
         this.maxHealth = this.maxHealth * 3;
      }
   }
   this.constructionTime = this.cost;
   this.size2 = this.size / 2;
   this.altitude2 = this.altitude / 2;
   this.altitudeT2 = this.altitude * 2;
   this.width2 = this.width / 2;
   this.height2 = this.height / 2;
   if(this.width % 2)
   {
      this.parent.tilePos.x = this.parent.tilePos.x - 0.5;
   }
   if(this.height != 2)
   {
      this.parent.tilePos.y = this.parent.tilePos.y - 1;
   }
   this.topLeftX = Math.floor(this.parent.tilePos.x - this.width2) + 1;
   this.topLeftY = Math.floor(this.parent.tilePos.y - this.height) + 3;
   if(this.height == 2)
   {
      this.topLeftY--;
   }
   this.dockX = (this.topLeftX + (this.width2 - 1)) * this.parent.parent.arena.tileSize;
   this.dockY = (this.topLeftY + (this.height - 1)) * this.parent.parent.arena.tileSize;
   this.dockPos = this.parent.parent.arena.translatePos(this.dockX,this.dockY);
   this.checkMax = function(total)
   {
      this.disabled = total >= this.max;
   };
}

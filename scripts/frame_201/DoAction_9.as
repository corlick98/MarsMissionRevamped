// Stats for each unit
function UnitStats(parent){
   this.isUnit = true;
   this.parent = parent;
   this.type = this.parent.type;
   if(!this.parent.type){
      this.type = parent;
   }
   this.active = !this.parent.isConstruction?false:true;
   this.team = this.type.substr(3);
   this.title = dialogue("int_" + this.type + "_title");
   this.inProgress = false;
   this.progress = 0;
   this.threat = 0;
   this.size = 10;
   this.vibrate = 0;
   this.speed = 1;
   this.altitude = 0;
   this.flying = false;
   this.repairable = true;
   this.obstruct = true;
   this.bait = false;
   this.miner = false;
   this.repair = false;
   this.weapon = false;
   this.maxWeaponCharge = 0;
   this.maxWeaponPayload = 9999999;
   this.reaction = 100;
   this.cost = 200;
   this.pickup = false;
   this.boomerang = false;
   this.lander = false;
   this.transformer = false;
   this.carriable = false;
   this.disabled = false;
   if(this.type == "UA_good" || this.type == "UA_evil"){
      this.max = 5;
      this.home = this.parent.parent.findBuilding("BC_" + this.team,this.parent.team);
      this.threat = 3;
      this.spread = 3;
      this.maxHealth = 125;
      this.size = 30;
      this.vibrate = 5;
      this.speed = 2;
      this.repairable = false;
      this.obstruct = false;
      this.carriable = true;
      this.weapon = "laser";
      this.maxWeaponCharge = 20;
      this.weaponRange = 200;
      this.cost = 200;
   }
   if(this.type == "UB_good" || this.type == "UB_evil"){
      this.max = 5;
      this.home = this.parent.parent.findBuilding("BC_" + this.team,this.parent.team);
      this.threat = 5;
      this.spread = 1;
      this.maxHealth = 75;
      this.size = 30;
      this.vibrate = 5;
      this.speed = 1;
      this.repairable = false;
      this.obstruct = false;
      this.carriable = true;
      this.repair = true;
      this.cost = 500;
   }
   if(this.type == "UC_good" || this.type == "UC_evil"){
      this.max = 5;
      this.home = this.parent.parent.findBuilding("BC_" + this.team,this.parent.team);
      if(this.type == "UC_evil" && this.parent.parent.findBuilding("BK_evil","evil"))
      {
         this.home = this.parent.parent.findBuilding("BK_evil","evil");
      }
      this.threat = 4;
      this.spread = 3;
      this.maxHealth = 125;
      this.altitude = 50;
      this.size = 25;
      this.vibrate = 20;
      this.speed = 5;
      this.flying = true;
      this.obstruct = false;
      this.carriable = true;
      this.weapon = "rocket";
      this.maxWeaponCharge = 20;
      this.weaponRange = 300;
      this.cost = 600;
   }
   if(this.type == "UD_good" || this.type == "UD_evil"){
      this.max = 4;
      this.home = this.parent.parent.findBuilding("BA_" + this.team,this.parent.team);
      this.threat = 2;
      this.spread = 3;
      this.maxHealth = 1500;
      this.size = 50;
      this.vibrate = 10;
      this.speed = 6;
      this.bait = true;
      this.maxCargo = 200;
      this.miner = true;
      this.cost = 1400;
   }
   if(this.type == "UE_good" || this.type == "UE_evil"){
      this.max = 5;
      this.home = this.parent.parent.findBuilding("BE_" + this.team,this.parent.team);
      this.threat = 4;
      this.spread = 2;
      this.maxHealth = 200;
      this.size = 50;
      this.vibrate = 10;
      this.speed = 10;
      this.weapon = "laser";
      this.maxWeaponCharge = 10;
      this.weaponRange = 250;
      this.cost = 600;
   }
   if(this.type == "UF_good" || this.type == "UF_evil"){
      this.max = 5;
      this.home = this.parent.parent.findBuilding("BE_" + this.team,this.parent.team);
      this.threat = 7;
      this.spread = 3;
      this.maxHealth = 800;
      this.size = 70;
      this.vibrate = 20;
      this.speed = 5;
      this.weapon = "rocket";
      this.maxWeaponCharge = 5;
      this.weaponRange = 300;
      this.cost = 1200;
   }
   if(this.type == "UG_good" || this.type == "UG_evil"){
      this.max = 4;
      this.home = this.parent.parent.findBuilding("BF_" + this.team,this.parent.team);
      this.threat = 8;
      this.spread = 4;
      this.maxHealth = 150;
      this.altitude = 100;
      this.size = 35;
      this.vibrate = 10;
      this.speed = 10;
      this.flying = true;
      this.obstruct = false;
      this.weapon = "rocket";
      this.maxWeaponCharge = 2;
      this.maxWeaponPayload = 10;
      this.weaponRange = 300;
      this.cost = 1200;
      this.boomerang = true;
      this.lander = true;
   }
   if(this.type == "UH_good" || this.type == "UH_evil"){
      this.max = 2;
      this.home = this.parent.parent.findBuilding("BE_" + this.team,this.parent.team);
      this.threat = 4;
      this.spread = 4;
      this.maxHealth = 300;
      this.altitude = 100;
      this.size = 60;
      this.vibrate = 5;
      this.speed = 6;
      this.flying = true;
      this.obstruct = false;
      this.repairable = false;
      this.cost = 1000;
      this.lander = true;
      this.carrier = true;
      this.capacity = 6;
      this.contents = new Array();
   }
   if(this.type == "UI_good" || this.type == "UI_evil" || this.type == "UO_evil"){
      this.max = 1;
      this.threat = 0;
      this.spread = 0;
      this.maxHealth = 50;
      this.altitude = 0;
      this.size = 35;
      this.vibrate = 0;
      this.speed = 0;
      this.flying = false;
      this.obstruct = false;
      this.pickup = true;
      if(this.parent.isUnit && !this.parent.tilePos.x && !this.parent.tilePos.y){
         do{
            destX = random(this.parent.parent.arena.cols);
            destY = random(this.parent.parent.arena.rows / 2);
         }while(this.parent.parent.arena.tiles[destX][destY]);
         this.parent.tilePos = {x:destX,y:destY};
      }
   }
   if(this.type == "UJ_good"){
      this.max = 1;
      this.threat = 0;
      this.spread = 0;
      this.maxHealth = 50;
      this.altitude = 0;
      this.size = 35;
      this.vibrate = 0;
      this.speed = 0;
      this.flying = false;
      this.obstruct = false;
      this.pickup = "special";
      this.cost = 5000;
      if(this.parent.isUnit){
         do{
            destX = random(this.parent.parent.arena.cols);
            destY = random(this.parent.parent.arena.rows / 2);
         }while(this.parent.parent.arena.tiles[destX][destY]);
         this.parent.tilePos = {x:destX,y:destY};
         this.parent.parent.parent.hud.showMessage(dialogue("int_level21_good_ind2"));
      }
   }
   if(this.type == "UK_good" || this.type == "UK_evil"){
      this.max = 1;
      this.spread = 3;
      this.maxHealth = 50;
      this.cost = 3000;
      this.superweapon = true;
   }
   if(this.type == "UM_evil"){
      this.max = 1;
      this.home = this.parent.parent.findBuilding("BJ_" + this.team,this.parent.team);
      this.threat = 10;
      this.spread = 3;
      this.maxHealth = 200;
      this.size = 30;
      this.vibrate = 0;
      this.speed = 6;
      this.repairable = false;
      this.obstruct = false;
      this.carriable = true;
      this.weapon = "both";
      this.maxWeaponCharge = 10;
      this.weaponRange = 100;
      this.cost = 2000;
   }
   if(this.type == "UN_evil"){
      this.max = 8;
      this.home = this.parent.parent.findBuilding("BJ_" + this.team,this.parent.team);
      this.threat = 5;
      this.spread = 1;
      this.maxHealth = 75;
      this.size = 30;
      this.vibrate = 15;
      this.speed = 3;
      this.repairable = false;
      this.obstruct = false;
      this.carriable = true;
      this.cost = 500;
   }
   if(this.type == "UP_good" || this.type == "UP_evil"){
      this.max = 2;
      this.home = this.parent.parent.findBuilding("BK_" + this.team,this.parent.team);
      this.threat = 4;
      this.spread = 4;
      this.maxHealth = 400;
      this.altitude = 60;
      this.size = 60;
      this.vibrate = 10;
      this.speed = 10;
      this.flying = true;
      this.obstruct = false;
      this.repairable = true;
      this.cost = 1500;
      this.lander = true;
      this.transformer = true;
      this.weapon = "rocket";
      this.maxWeaponCharge = 10;
      this.weaponRange = 300;
   }
   if(this.type == "UQ_evil"){
      this.max = 5;
      this.threat = 10;
      this.spread = 4;
      this.maxHealth = 500;
      this.size = 30;
      this.vibrate = 5;
      this.speed = 5;
      this.repairable = false;
      this.obstruct = false;
      this.carriable = true;
      this.weapon = "both";
      this.maxWeaponCharge = 3;
      this.weaponRange = 350;
      this.cost = 2000;
   }
   if(this.type == "UR_good"){
      this.max = 2;
      this.home = this.parent.parent.findBuilding("BE_" + this.team,this.parent.team);
      this.threat = 7;
      this.spread = 3;
      this.maxHealth = 500;
      this.size = 70;
      this.vibrate = 20;
      this.speed = 6;
      this.weapon = "rocket";
      this.maxWeaponCharge = 7;
      this.weaponRange = 300;
      this.cost = 900;
      this.repairable = false;
      this.carrier = true;
      this.capacity = 1;
      this.contents = new Array();
   }
   if(this.type == "UD_evil" || this.type == "UE_evil" || this.type == "UF_evil"){
      this.altitude = 20;
   }
   this.constructionTime = this.cost;
   this.size2 = this.size / 2;
   this.maxAltitude = this.altitude;
   this.altitude2 = this.altitude / 2;
   this.altitudeT2 = this.altitude * 2;
   this.mechanical = this.obstruct || this.flying;
   if(this.parent.friend){
      if(this.parent.parent.parent.parent.cheatFirepower && this.maxWeaponCharge){
         this.maxWeaponCharge = max(Math.floor(this.maxWeaponCharge = this.maxWeaponCharge / 2),2);
      }
      if(this.parent.parent.parent.parent.cheatShields){
         this.maxHealth = this.maxHealth * 3;
      }
   }
   this.checkMax = function(total){
      this.disabled = total >= this.max;
   };
}

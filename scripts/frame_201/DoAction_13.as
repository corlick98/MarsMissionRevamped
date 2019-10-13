function LevelStats(parent)
{
   this.parent = parent;
   this.level = this.parent.level;
   this.setup = function()
   {
      var _loc2_ = undefined;
      var _loc3_ = undefined;
      var _loc4_ = undefined;
      var _loc5_ = undefined;
      var _loc6_ = undefined;
      if(this.level == 1)
      {
         this.buildings.push(new Building(this,"BA_good",2,7));
         this.units.push(_loc2_ = new Unit(this,"UD_good",null,null,0.5));
         this.indicators.push(new Indicator(this,_loc2_,null,dialogue("int_level1_ind1"),"selected"));
         this.indicators.push(new Indicator(this,_loc2_,this.arena.tileHandles._4_7,dialogue("int_level1_ind2"),"voyage"));
         this.indicators.push(new Indicator(this,_loc2_,this.arena.tileHandles._6_6,dialogue("int_level1_ind3"),"voyage"));
         this.indicators.push(new Indicator(this,null,null,dialogue("int_level1_ind4"),"message",80));
         this.indicators.push(new Indicator(this,null,null,dialogue("int_level1_ind5"),"message",80));
         this.indicators.push(new Indicator(this,null,null,dialogue("int_level1_ind6"),"message",120));
         this.indicators.push(new Indicator(this,null,null,dialogue("int_level1_ind7"),"message"));
         this.cash = 0;
         this.training = true;
         this.jukebox = 1;
      }
      if(this.level == 2)
      {
         this.buildings.push(new Building(this,"BA_good",1,11));
         this.buildings.push(new Building(this,"BB_good",3,11));
         this.units.push(new Unit(this,"UD_good",10,5,0.5));
         this.units.push(_loc2_ = new Unit(this,"UA_good",3,9,0.25));
         this.units.push(_loc3_ = new Unit(this,"UA_good",4,9,0.5));
         this.units.push(_loc4_ = new Unit(this,"UA_good",4,9,0.125));
         this.units.push(_loc5_ = new Unit(this,"UA_good",3,9,0.375));
         this.units.push(new Unit(this,"UA_evil",15,1,0.75,null,null,"roam",10));
         this.units.push(new Unit(this,"UA_evil",13,15,0.75,null,null,"roam",20));
         this.units.push(new Unit(this,"UA_evil",15,3,0.75,null,null,"still"));
         this.indicators.push(new Indicator(this,new Array(_loc2_,_loc3_,_loc4_,_loc5_),null,dialogue("int_level2_ind1"),"selected"));
         this.indicators.push(new Indicator(this,null,null,dialogue("int_level2_ind2"),"message",80));
         this.indicators.push(new Indicator(this,null,null,dialogue("int_level2_ind3"),"message",80));
         this.indicators.push(new Indicator(this,null,null,dialogue("int_level2_ind4"),"message",80));
         this.indicators.push(new Indicator(this,null,null,dialogue("int_level2_ind5"),"message"));
         this.cash = 2000;
         this.training = true;
         this.jukebox = 2;
      }
      if(this.level == 3)
      {
         this.buildings.push(new Building(this,"BA_good",3,13));
         this.units.push(_loc2_ = new Unit(this,"UD_good",8,11,0.5,null,0.25));
         this.units.push(new Unit(this,"UE_evil",16,15,0.75,null,null,"still"));
         this.units.push(new Unit(this,"UE_evil",17,16,0.75,null,null,"still"));
         this.units.push(new Unit(this,"UE_evil",18,17,0.75,null,null,"still"));
         this.units.push(new Unit(this,"UA_evil",15,15,0.75,null,null,"roam",10));
         this.units.push(new Unit(this,"UA_evil",15,15,0.75,null,null,"roam",10));
         this.units.push(new Unit(this,"UA_evil",15,15,0.75,null,null,"roam",10));
         this.units.push(new Unit(this,"UA_evil",15,15,0.75,null,null,"roam",10));
         this.units.push(new Unit(this,"UA_evil",15,15,0.75,null,null,"roam",10));
         this.units.push(new Unit(this,"UA_evil",15,15,0.75,null,null,"roam",10));
         this.indicators.push(new Indicator(this,_loc2_,null,dialogue("int_level3_ind1"),"selected"));
         this.indicators.push(new Indicator(this,_loc2_,this.arena.tileHandles._4_14,dialogue("int_level3_ind2"),"voyage"));
         this.indicators.push(new Indicator(this,"BB_good",null,dialogue("int_level3_ind3"),"construction"));
         this.indicators.push(new Indicator(this,"BC_good",null,dialogue("int_level3_ind4"),"construction"));
         this.indicators.push(new Indicator(this,"UB_good",null,dialogue("int_level3_ind5"),"construction"));
         this.indicators.push(new Indicator(this,"find:UB_good",null,dialogue("int_level3_ind6"),"selected"));
         this.indicators.push(new Indicator(this,"find:UB_good",_loc2_,dialogue("int_level3_ind7"),"voyage"));
         this.indicators.push(new Indicator(this,null,null,dialogue("int_level3_ind8"),"message"));
         this.cash = 4000;
         this.training = true;
         this.jukebox = 3;
      }
      if(this.level == 4)
      {
         this.buildings.push(new Building(this,"BA_good",2,4));
         this.buildings.push(new Building(this,"BB_good",1,4));
         this.buildings.push(new Building(this,"BF_good",4,4));
         this.buildings.push(new Building(this,"BD_good",8,5));
         this.units.push(new Unit(this,"UD_good",10,4,0.5));
         this.units.push(_loc2_ = new Unit(this,"UE_good",27,12,0.25));
         this.units.push(_loc3_ = new Unit(this,"UI_evil",28,12,0.75));
         this.units.push(new Unit(this,"UE_evil",30,12,0.75,null,0.75,"still"));
         this.units.push(new Unit(this,"UA_evil",27,7,0.5,null,null,"still"));
         this.units.push(new Unit(this,"UE_evil",23,14,0.25,null,null,"still"));
         this.units.push(new Unit(this,"UA_evil",23,15,0.25,null,null,"still",600));
         this.units.push(new Unit(this,"UA_evil",23,15,0.25,null,null,"still",600));
         this.units.push(new Unit(this,"UA_evil",23,15,0.25,null,null,"still",1000));
         this.units.push(new Unit(this,"UA_evil",23,15,0.25,null,null,"still",2000));
         this.units.push(new Unit(this,"UA_evil",23,15,0.25,null,null,"still",2000));
         this.units.push(new Unit(this,"UE_evil",23,6,0.75,null,0.75,"still"));
         this.units.push(new Unit(this,"UE_evil",24,6,0.75,null,0.75,"still"));
         this.units.push(new Unit(this,"UA_evil",25,1,0.25,null,null,"still",600));
         this.units.push(new Unit(this,"UA_evil",25,1,0.25,null,null,"still",600));
         this.units.push(new Unit(this,"UA_evil",25,1,0.25,null,null,"still",1000));
         this.units.push(new Unit(this,"UA_evil",25,1,0.25,null,null,"still",2000));
         this.units.push(new Unit(this,"UA_evil",25,1,0.25,null,null,"still",2000));
         this.units.push(new Unit(this,"UE_evil",30,1,0.25,null,null,"still",2500));
         this.units.push(new Unit(this,"UE_evil",30,2,0.25,null,null,"still",2600));
         this.indicators.push(new Indicator(this,_loc2_,null,dialogue("int_level4_ind1"),"selected"));
         this.indicators.push(new Indicator(this,_loc2_,_loc3_,dialogue("int_level4_ind2"),"voyage"));
         this.indicators.push(new Indicator(this,null,null,dialogue("int_level4_ind3"),"message",60));
         this.indicators.push(new Indicator(this,null,null,dialogue("int_level4_ind4"),"message",200));
         this.arena.shroud.reveal(6,1,4);
         this.arena.shroud.reveal(3,8,4);
         this.arena.shroud.reveal(3,12,4);
         this.arena.shroud.reveal(10,8,3);
         this.arena.shroud.reveal(15,10,3);
         this.arena.shroud.reveal(20,8,3);
         this.arena.shroud.reveal(25,10,3);
         this.arena.shroud.reveal(28,14,2);
         this.camera.focus = _loc2_;
         this.cash = 2000;
         this.training = true;
         this.jukebox = 4;
      }
      if(this.level == 5)
      {
         this.buildings.push(new Building(this,"BA_" + this.parent.team,2,4));
         this.units.push(new Unit(this,"UD_good",null,null,0.5,null));
         this.units.push(new Unit(this,"UE_good",4,3,0.5));
         this.units.push(new Unit(this,"UA_good",4,5,0.25));
         this.units.push(new Unit(this,"UA_good",4,5,0.5));
         this.units.push(new Unit(this,"UA_good",4,5,0.75));
         this.units.push(new Unit(this,"UF_evil",15,5,0.75,null,null,"roam",10));
         this.units.push(new Unit(this,"UF_evil",15,4,0.5,null,null,"still",1000));
         this.units.push(new Unit(this,"UF_evil",19,9,0.75,null,null,"still",2000));
         this.units.push(new Unit(this,"UA_evil",18,19,0.75,null,null,"roam",2));
         this.units.push(new Unit(this,"UA_evil",18,20,0.75,null,null,"roam",2));
         this.units.push(new Unit(this,"UF_evil",19,19,0.75,null,null,"still"));
         this.arena.shroud.reveal(5,10,4);
         this.arena.shroud.reveal(19,19,4);
         this.cash = 8000;
         this.jukebox = 1;
      }
      if(this.level == 6)
      {
         this.buildings.push(_loc3_ = new Building(this,"BA_good",4,15));
         this.buildings.push(new Building(this,"BB_good",1,15));
         this.buildings.push(new Building(this,"BG_good",1,13));
         this.units.push(new Unit(this,"UD_good",null,null,0.5,null));
         this.units.push(new Unit(this,"UC_good",6,14,0.5,null));
         this.units.push(new Unit(this,"UC_good",6,15,0.5,null));
         this.units.push(new Unit(this,"UC_good",6,16,0.5,null));
         this.units.push(new Unit(this,"UC_good",6,15,0.5,null));
         this.units.push(new Unit(this,"UC_good",6,16,0.5,null));
         this.buildings.push(_loc2_ = new Building(this,"BC_evil",15,5));
         this.buildings.push(new Building(this,"BD_evil",11,7));
         this.buildings.push(new Building(this,"BD_evil",14,12));
         this.buildings.push(new Building(this,"BB_evil",15,2));
         this.units.push(new Unit(this,"UC_evil",null,null,null,null,null,"still",30,true));
         this.units.push(new Unit(this,"UC_evil",null,null,null,null,null,"still",35,true));
         this.units.push(new Unit(this,"UC_evil",null,null,null,null,null,"still",40,true));
         this.indicators.push(new Indicator(this,null,null,dialogue("int_level6_ind1"),"message",80));
         this.indicators.push(new Indicator(this,_loc3_,null,null,"focus"));
         this.indicators.push(new Indicator(this,null,null,dialogue("int_level6_ind2"),"message",80));
         this.arena.shroud.reveal(16,5,4);
         this.camera.focus = _loc2_;
         this.cash = 4000;
         this.cashOppo = 20000;
         this.jukebox = 2;
      }
      if(this.level == 7)
      {
         this.buildings.push(new Building(this,"BA_good",5,27));
         this.units.push(new Unit(this,"UD_good",13,26,0.5,null));
         this.units.push(new Unit(this,"UF_good",6,24,0.0625,null));
         this.units.push(new Unit(this,"UF_good",7,24,0.125,null));
         this.units.push(new Unit(this,"UF_good",7,25,0.1875,null));
         this.units.push(new Unit(this,"UA_good",4,24));
         this.units.push(new Unit(this,"UA_good",4,24));
         this.units.push(new Unit(this,"UA_good",7,27));
         this.units.push(new Unit(this,"UA_good",7,27));
         this.buildings.push(new Building(this,"BD_evil",15,8));
         this.buildings.push(new Building(this,"BD_evil",18,14));
         this.buildings.push(new Building(this,"BE_evil",19,4));
         this.buildings.push(new Building(this,"BB_evil",21,3));
         this.buildings.push(new Building(this,"BC_evil",19,7));
         this.buildings.push(new Building(this,"BB_evil",21,7));
         this.units.push(new Unit(this,"UA_evil",19,6,null,null,null,"roam",6,true));
         this.units.push(new Unit(this,"UA_evil",19,6,null,null,null,"roam",6,true));
         this.units.push(new Unit(this,"UA_evil",19,6,null,null,null,"roam",6,true));
         this.units.push(new Unit(this,"UA_evil",19,6,null,null,null,"roam",6,true));
         this.units.push(new Unit(this,"UA_evil",19,6,null,null,null,"roam",6,true));
         this.units.push(new Unit(this,"UC_evil",null,null,null,null,null,"still",1000,true));
         this.units.push(new Unit(this,"UC_evil",null,null,null,null,null,"still",1000,true));
         this.units.push(new Unit(this,"UC_evil",null,null,null,null,null,"still",1000,true));
         this.units.push(new Unit(this,"UE_evil",5,3,0.5,null,null,"still",null,true));
         this.units.push(new Unit(this,"UE_evil",21,24,0.75,null,null,"still",null,true));
         this.units.push(new Unit(this,"UF_evil",17,11,0.625,null,null,"still",null,true));
         this.units.push(new Unit(this,"UI_evil",4,7));
         this.units.push(new Unit(this,"UI_evil",11,9));
         this.units.push(new Unit(this,"UI_evil",21,17));
         this.cash = 4000;
         this.cashOppo = 20000;
         this.jukebox = 3;
      }
      if(this.level == 8)
      {
         this.buildings.push(new Building(this,"BA_good",2,25,"evil",0.25));
         this.buildings.push(new Building(this,"BC_good",13,14,"evil",0.25));
         this.units.push(_loc2_ = new Unit(this,"UA_good",13,6,0.5,null));
         this.units.push(new Unit(this,"UA_good",12,5,0.5,null));
         this.units.push(new Unit(this,"UA_good",14,5,0.5,null));
         this.units.push(new Unit(this,"UB_good",13,4,0.5,null));
         this.units.push(new Unit(this,"UB_good",13,4,0.5,null));
         this.units.push(new Unit(this,"UH_good",14,29,0.625));
         this.units.push(new Unit(this,"UI_good",10,7,0.5,null,null,null,"UE_good"));
         this.units.push(new Unit(this,"UI_good",8,3,0.5,null,null,null,"UF_good"));
         this.units.push(new Unit(this,"UI_good",8,29,0.25,null,null,null,"UC_good"));
         this.buildings.push(new Building(this,"BD_evil",4,7));
         this.buildings.push(new Building(this,"BD_evil",6,15));
         this.buildings.push(new Building(this,"BD_evil",8,24));
         this.buildings.push(new Building(this,"BB_evil",4,25,"evil"));
         this.buildings.push(new Building(this,"BB_evil",4,23,"evil"));
         this.units.push(new Unit(this,"UA_evil",12,15,null,null,null,"roam",4));
         this.units.push(new Unit(this,"UA_evil",12,15,null,null,null,"roam",4));
         this.units.push(new Unit(this,"UF_evil",2,17,0.125,null,null,"still"));
         this.units.push(new Unit(this,"UE_evil",3,15,0.125,null,null,"still"));
         this.units.push(new Unit(this,"UE_evil",10,26,0,null,null,"still"));
         this.units.push(new Unit(this,"UE_evil",2,11,0.375,null,null,"still"));
         this.units.push(new Unit(this,"UA_evil",3,25,null,null,null,"roam",6));
         this.units.push(new Unit(this,"UA_evil",3,25,null,null,null,"roam",6));
         this.units.push(new Unit(this,"UI_evil",15,15));
         this.units.push(new Unit(this,"UI_evil",14,16));
         this.units.push(new Unit(this,"UI_evil",6,27));
         this.units.push(new Unit(this,"UI_evil",1,17));
         this.indicators.push(new Indicator(this,null,null,dialogue("int_level8_ind1"),"message",80));
         this.indicators.push(new Indicator(this,null,null,dialogue("int_level8_ind2"),"message",80));
         this.indicators.push(new Indicator(this,null,null,dialogue("int_level8_ind3"),"message",80));
         this.camera.focus = _loc2_;
         this.cash = 0;
         this.jukebox = 4;
      }
      if(this.level == 9)
      {
         this.buildings.push(new Building(this,"BG_good",10,26));
         this.buildings.push(new Building(this,"BB_good",11,26));
         this.units.push(_loc3_ = new Unit(this,"UB_good",9,26,0.5,null));
         this.units.push(new Unit(this,"UH_good",7,26,0.625,null));
         this.units.push(new Unit(this,"UI_good",3,2,0.5,null,null,null,"UF_good"));
         this.units.push(new Unit(this,"UI_good",4,16,0.5,null,null,null,"UC_good"));
         this.units.push(new Unit(this,"UI_good",12,17,0.5,null,null,null,"UC_good"));
         this.units.push(new Unit(this,"UI_good",14,27,0.5,null,null,null,"UC_good"));
         this.units.push(new Unit(this,"UI_good",14,12,0.5,null,null,null,"UC_good"));
         this.units.push(new Unit(this,"UI_good",7,16,0.5,null,null,null,"UC_good"));
         this.buildings.push(_loc2_ = new Building(this,"BG_evil",8,4));
         this.buildings.push(new Building(this,"BD_evil",7,3));
         this.buildings.push(new Building(this,"BD_evil",7,5));
         this.buildings.push(new Building(this,"BD_evil",9,3));
         this.buildings.push(new Building(this,"BD_evil",9,5));
         this.buildings.push(new Building(this,"BB_evil",13,5));
         this.buildings.push(new Building(this,"BB_evil",13,2));
         this.buildings.push(new Building(this,"BB_evil",15,5));
         this.buildings.push(new Building(this,"BB_evil",15,2));
         this.buildings.push(new Building(this,"BB_evil",14,3));
         this.buildings.push(new Building(this,"BB_evil",1,2));
         this.buildings.push(new Building(this,"BB_evil",1,5));
         this.indicators.push(new Indicator(this,_loc3_,null,null,"focus"));
         this.indicators.push(new Indicator(this,null,null,dialogue("int_level9_ind1"),"message",80));
         this.indicators.push(new Indicator(this,_loc3_,null,dialogue("int_level9_ind2"),"selected"));
         this.indicators.push(new Indicator(this,_loc3_,this.units[1],dialogue("int_level9_ind3"),"voyage"));
         this.indicators.push(new Indicator(this,null,null,dialogue("int_level9_ind4"),"message",160));
         this.indicators.push(new Indicator(this,null,null,dialogue("int_level9_ind5"),"message"));
         this.arena.shroud.reveal(8,6,3);
         this.camera.focus = _loc2_;
         this.cash = 0;
         this.jukebox = 1;
      }
      if(this.level == 10)
      {
         this.buildings.push(new Building(this,"BB_good",25,23));
         this.buildings.push(new Building(this,"BD_good",8,23));
         this.buildings.push(_loc4_ = new Building(this,"BD_good",26,23));
         this.buildings.push(_loc5_ = new Building(this,"BA_good",5,20));
         this.units.push(new Unit(this,"UF_good",5,22,0.375));
         this.units.push(new Unit(this,"UE_good",6,22,0.625));
         this.units.push(new Unit(this,"UC_good",4,20,0.375));
         this.units.push(new Unit(this,"UC_good",7,20,0.625));
         this.units.push(new Unit(this,"UD_good",13,26,0.5));
         this.units.push(new Unit(this,"UI_good",27,3,0.5,null,null,null,"UB_good"));
         this.units.push(new Unit(this,"UI_good",21,21,0.5,null,null,null,"UD_good"));
         this.units.push(new Unit(this,"UI_good",10,10,0.5,null,null,null,"UF_good"));
         this.buildings.push(_loc3_ = new Building(this,"BA_evil",25,12));
         this.buildings.push(new Building(this,"BD_evil",30,14));
         this.buildings.push(new Building(this,"BD_evil",21,12));
         this.buildings.push(new Building(this,"BD_evil",22,12));
         this.buildings.push(new Building(this,"BD_evil",24,15));
         this.buildings.push(new Building(this,"BD_evil",25,15));
         this.buildings.push(new Building(this,"BD_evil",5,7));
         this.buildings.push(new Building(this,"BB_evil",6,7));
         this.buildings.push(new Building(this,"BD_evil",7,7));
         this.buildings.push(new Building(this,"BD_evil",23,2));
         this.buildings.push(new Building(this,"BC_evil",25,2));
         this.buildings.push(new Building(this,"BG_evil",28,2));
         this.buildings.push(new Building(this,"BH_evil",29,2));
         this.buildings.push(new Building(this,"BE_evil",25,7));
         this.buildings.push(new Building(this,"BF_evil",28,5));
         this.buildings.push(new Building(this,"BB_evil",23,7));
         this.buildings.push(new Building(this,"BB_evil",23,9));
         this.buildings.push(new Building(this,"BB_evil",28,13));
         this.buildings.push(new Building(this,"BB_evil",28,11));
         this.buildings.push(new Building(this,"BB_evil",29,11));
         this.buildings.push(new Building(this,"BB_evil",28,9));
         this.buildings.push(new Building(this,"BB_evil",29,9));
         this.buildings.push(new Building(this,"BB_evil",28,7));
         this.buildings.push(new Building(this,"BB_evil",29,7));
         this.units.push(new Unit(this,"UD_evil",20,6));
         this.units.push(new Unit(this,"UD_evil",4,5));
         this.units.push(new Unit(this,"UG_evil",null,null,null,null,null,null,null,true));
         this.units.push(new Unit(this,"UG_evil",null,null,null,null,null,null,null,true));
         this.units.push(new Unit(this,"UC_evil",26,8,null,null,null,"roam",8,true));
         this.units.push(new Unit(this,"UC_evil",26,8,null,null,null,"roam",8,true));
         this.units.push(new Unit(this,"UF_evil",15,15,null,null,null,"roam",6,false));
         this.units.push(new Unit(this,"UF_evil",16,16,null,null,null,"roam",6,true));
         this.units.push(new Unit(this,"UE_evil",null,null,null,null,null,"still",1000,false));
         this.units.push(new Unit(this,"UE_evil",null,null,null,null,null,"still",2000,true));
         this.units.push(new Unit(this,"UA_evil",25,29,null,null,null,"roam",2,true));
         this.units.push(new Unit(this,"UA_evil",6,2,null,null,null,"roam",2,true));
         this.units.push(new Unit(this,"UA_evil",26,8,null,null,null,"roam",8,true));
         this.units.push(new Unit(this,"UB_evil",null,null,null,null,null,"seek",null,true));
         this.units.push(new Unit(this,"UI_evil",28,26,0.5));
         this.units.push(new Unit(this,"UI_evil",3,5,0.5));
         this.indicators.push(new Indicator(this,_loc3_,null,null,"focus"));
         this.indicators.push(new Indicator(this,null,null,dialogue("int_level10_ind1"),"message",80));
         this.indicators.push(new Indicator(this,_loc4_,null,null,"focus"));
         this.indicators.push(new Indicator(this,null,null,dialogue("int_level10_ind2"),"message",80));
         this.indicators.push(new Indicator(this,_loc5_,null,null,"focus"));
         this.indicators.push(new Indicator(this,null,null,dialogue("int_level10_ind3"),"message",80));
         this.arena.shroud.reveal(25,11,2);
         this.arena.shroud.reveal(2,20,4);
         this.arena.shroud.reveal(2,26,4);
         this.arena.shroud.reveal(7,26,4);
         this.camera.focus = _loc5_;
         this.cash = 10000;
         this.cashOppo = 20000;
         this.jukebox = 4;
      }
      if(this.level == 11)
      {
         this.buildings.push(new Building(this,"BA_good",-10,-10));
         this.buildings.push(_loc4_ = new Building(this,"BX_good",4,8));
         this.units.push(_loc3_ = new Unit(this,"UA_evil",11,5,0.5));
         this.units.push(new Unit(this,"UB_good",3,7,null,null,null,"roam",6,true));
         this.units.push(new Unit(this,"UA_good",3,5,null,null,null,"roam",4,true));
         this.units.push(new Unit(this,"UA_good",3,5,null,null,null,"roam",4,true));
         this.units.push(new Unit(this,"UI_good",4,9,0.5));
         this.indicators.push(new Indicator(this,_loc4_,null,null,"focus"));
         this.indicators.push(new Indicator(this,null,null,dialogue("int_level11_ind1"),"message",80));
         this.indicators.push(new Indicator(this,_loc3_,null,dialogue("int_level11_ind2"),"selected"));
         this.indicators.push(new Indicator(this,_loc3_,this.arena.tileHandles._9_7,dialogue("int_level11_ind3"),"voyage"));
         this.indicators.push(new Indicator(this,_loc3_,this.arena.tileHandles._7_7,dialogue("int_level11_ind4"),"voyage"));
         this.indicators.push(new Indicator(this,null,null,dialogue("int_level11_ind5"),"message",180));
         this.indicators.push(new Indicator(this,this.arena.tileHandles._6_8,null,null,"focus"));
         this.indicators.push(new Indicator(this,null,null,dialogue("int_level11_ind6"),"message"));
         this.arena.shroud.reveal(5,6,3);
         this.arena.shroud.reveal(12,2,2);
         this.arena.shroud.reveal(9,7,2);
         this.camera.focus = _loc3_;
         this.cash = 0;
         this.cashOppo = 999999900;
         this.training = true;
         this.jukebox = 4;
      }
      if(this.level == 12)
      {
         this.units.push(_loc2_ = new Unit(this,"UD_good",4,4,0.25,null,0.3));
         _loc2_.stats.maxCargo = 999999900;
         _loc2_.stats.repair = true;
         this.units.push(new Unit(this,"UA_good",3,4,0.75,null,null,"guard",_loc2_));
         this.units.push(new Unit(this,"UA_good",5,4,0.75,null,null,"guard",_loc2_));
         this.units.push(new Unit(this,"UA_good",4,3,0.75,null,null,"roam",8));
         this.units.push(new Unit(this,"UA_good",4,5,0.75,null,null,"roam",8));
         this.units.push(_loc4_ = new Unit(this,"UA_evil",9,12,0.8125));
         this.units.push(_loc3_ = new Unit(this,"UA_evil",10,12,0.875));
         this.units.push(_loc5_ = new Unit(this,"UA_evil",11,12,0.9375));
         this.units.push(new Unit(this,"UI_evil",1,4,0.5,null,null,null,"UA_evil"));
         this.indicators.push(new Indicator(this,_loc2_,null,null,"focus"));
         this.indicators.push(new Indicator(this,null,null,dialogue("int_level12_ind1"),"message",120));
         this.indicators.push(new Indicator(this,new Array(_loc3_,_loc4_,_loc5_),null,dialogue("int_level12_ind2"),"selected"));
         this.indicators.push(new Indicator(this,null,null,dialogue("int_level12_ind3"),"message",80));
         this.indicators.push(new Indicator(this,null,null,dialogue("int_level12_ind4"),"message",80));
         this.indicators.push(new Indicator(this,null,null,dialogue("int_level12_ind5"),"message",80));
         this.indicators.push(new Indicator(this,null,null,dialogue("int_level12_ind6"),"message"));
         this.arena.shroud.reveal(5,2,3);
         this.arena.shroud.reveal(5,4,3);
         this.camera.focus = _loc3_;
         this.cash = 0;
         this.cashOppo = 999999900;
         this.training = true;
         this.jukebox = 1;
      }
      if(this.level == 13)
      {
         this.buildings.push(new Building(this,"BA_evil",9,4));
         this.units.push(_loc2_ = new Unit(this,"UD_evil",null,null,0.75));
         this.units.push(new Unit(this,"UA_evil",8,5,0.625));
         this.units.push(new Unit(this,"UA_evil",8,4,0.5));
         this.units.push(new Unit(this,"UA_good",2,6,0.25,null,null,"still"));
         this.units.push(new Unit(this,"UA_good",4,11,0.75,null,null,"roam",2));
         this.units.push(new Unit(this,"UI_evil",6,10,0.5,null,null,null,"UA_evil"));
         this.indicators.push(new Indicator(this,null,null,dialogue("int_level13_ind1"),"message",80));
         this.indicators.push(new Indicator(this,"BB_evil",null,dialogue("int_level13_ind2"),"construction"));
         this.indicators.push(new Indicator(this,null,null,dialogue("int_level13_ind3"),"message",60));
         this.indicators.push(new Indicator(this,_loc2_,null,dialogue("int_level13_ind4"),"selected"));
         this.indicators.push(new Indicator(this,_loc2_,this.arena.tileHandles._7_5,dialogue("int_level13_ind5"),"voyage"));
         this.indicators.push(new Indicator(this,_loc2_,this.arena.tileHandles._5_6,dialogue("int_level13_ind6"),"voyage"));
         this.indicators.push(new Indicator(this,null,null,dialogue("int_level13_ind7"),"message",80));
         this.indicators.push(new Indicator(this,null,null,dialogue("int_level13_ind8"),"message",80));
         this.indicators.push(new Indicator(this,null,null,dialogue("int_level13_ind9"),"message"));
         this.cash = 800;
         this.training = true;
         this.jukebox = 2;
      }
      if(this.level == 14)
      {
         this.buildings.push(_loc3_ = new Building(this,"BA_evil",7,5));
         this.buildings.push(new Building(this,"BB_evil",9,5));
         this.buildings.push(new Building(this,"BB_good",2,23));
         this.buildings.push(_loc2_ = new Building(this,"BC_good",6,23));
         this.units.push(new Unit(this,"UD_evil",3,2));
         this.units.push(_loc4_ = new Unit(this,"UE_evil",5,23,0.3125));
         this.units.push(new Unit(this,"UA_good",9,25,0.75,null,null,"still",20));
         this.units.push(new Unit(this,"UA_good",9,25,0.75,null,null,"still",40));
         this.units.push(new Unit(this,"UA_good",9,25,0.75,null,null,"still",60));
         this.units.push(new Unit(this,"UA_good",9,25,0.75,null,null,"still",80));
         this.units.push(new Unit(this,"UA_good",9,25,0.75,null,null,"still",100));
         this.units.push(new Unit(this,"UA_good",10,25,0.75,null,null,"still",1000));
         this.units.push(new Unit(this,"UA_good",10,25,0.75,null,null,"still",1000));
         this.units.push(new Unit(this,"UA_good",10,25,0.75,null,null,"still",1000,true));
         this.units.push(new Unit(this,"UA_good",10,25,0.75,null,null,"still",1000,true));
         this.units.push(new Unit(this,"UA_good",10,25,0.75,null,null,"still",1000,true));
         this.units.push(new Unit(this,"UE_good",1,9,0.25,null,null,"still",2000));
         this.units.push(new Unit(this,"UE_good",2,25,0.25,null,null,"still",3000));
         this.units.push(new Unit(this,"UE_good",10,24,0.75,null,null,"still",4000));
         this.units.push(new Unit(this,"UI_good",1,8,0.5,null,null,null,"UE_evil"));
         this.indicators.push(new Indicator(this,_loc4_,null,dialogue("int_level14_ind1"),"selected"));
         this.indicators.push(new Indicator(this,_loc4_,this.arena.tileHandles._8_6,dialogue("int_level14_ind2"),"voyage"));
         this.indicators.push(new Indicator(this,null,null,dialogue("int_level14_ind3"),"message",60));
         this.indicators.push(new Indicator(this,this.arena.tileHandles._6_5,null,null,"focus"));
         this.indicators.push(new Indicator(this,"BC_evil",null,dialogue("int_level14_ind4"),"construction"));
         this.indicators.push(new Indicator(this,"UA_evil",null,dialogue("int_level14_ind5"),"construction"));
         this.indicators.push(new Indicator(this,"BD_evil",null,dialogue("int_level14_ind6"),"construction"));
         this.indicators.push(new Indicator(this,null,null,dialogue("int_level14_ind7"),"message"));
         this.arena.shroud.reveal(6,6,4);
         this.arena.shroud.reveal(8,12,4);
         this.arena.shroud.reveal(7,19,3);
         this.camera.focus = _loc2_;
         this.cash = 3000;
         this.cashOppo = 5000;
         this.training = true;
         this.jukebox = 3;
      }
      if(this.level == 15)
      {
         this.buildings.push(_loc3_ = new Building(this,"BC_evil",27,5));
         this.buildings.push(new Building(this,"BB_evil",29,5));
         this.buildings.push(new Building(this,"BD_good",7,2));
         this.buildings.push(new Building(this,"BD_good",7,8));
         this.buildings.push(new Building(this,"BB_good",-10,-10));
         this.units.push(_loc4_ = new Unit(this,"UE_evil",26,5,0.3125,null,0.2));
         this.units.push(new Unit(this,"UA_good",15,9,null,null,null,"still"));
         this.units.push(new Unit(this,"UA_good",20,3,null,null,null,"still"));
         this.units.push(new Unit(this,"UA_good",23,9,null,null,null,"still"));
         this.units.push(new Unit(this,"UA_good",13,4,null,null,null,"still"));
         this.units.push(new Unit(this,"UA_good",13,4,null,null,null,"still"));
         this.units.push(new Unit(this,"UA_good",14,10,null,null,null,"still"));
         this.units.push(new Unit(this,"UA_good",14,10,null,null,null,"still"));
         this.units.push(new Unit(this,"UA_good",10,6,null,null,null,"still"));
         this.units.push(new Unit(this,"UA_good",19,6,null,null,null,"still"));
         this.units.push(new Unit(this,"UF_good",3,5,0.75,null,null,"roam",4));
         this.units.push(new Unit(this,"UI_good",2,2,0.5,null,null,null,"UE_evil"));
         this.units.push(new Unit(this,"UI_good",2,3,0.5,null,null,null,"UE_evil"));
         this.units.push(new Unit(this,"UI_good",2,4,0.5,null,null,null,"UE_evil"));
         this.units.push(new Unit(this,"UI_good",2,7,0.5,null,null,null,"UE_evil"));
         this.units.push(new Unit(this,"UI_good",2,8,0.5,null,null,null,"UE_evil"));
         this.units.push(new Unit(this,"UI_good",2,9,0.5,null,null,null,"UE_evil"));
         this.indicators.push(new Indicator(this,"UB_evil",null,dialogue("int_level15_ind1"),"construction"));
         this.indicators.push(new Indicator(this,"find:UB_evil",null,dialogue("int_level15_ind2"),"selected"));
         this.indicators.push(new Indicator(this,"find:UB_evil",_loc4_,dialogue("int_level15_ind3"),"voyage"));
         this.indicators.push(new Indicator(this,null,null,dialogue("int_level15_ind4"),"message"));
         this.arena.shroud.reveal(28,5,4);
         this.arena.shroud.reveal(28,6,4);
         this.arena.shroud.reveal(3,5,4);
         this.arena.shroud.reveal(4,5,4);
         this.arena.shroud.reveal(3,6,4);
         this.arena.shroud.reveal(4,6,4);
         this.camera.focus = _loc3_;
         this.cash = 3100;
         this.cashOppo = 0;
         this.training = true;
         this.jukebox = 4;
      }
      if(this.level == 16)
      {
         this.buildings.push(_loc3_ = new Building(this,"BA_evil",20,5));
         this.buildings.push(_loc4_ = new Building(this,"BF_evil",18,5));
         this.buildings.push(new Building(this,"BB_evil",18,2));
         this.buildings.push(new Building(this,"BB_evil",19,2));
         this.buildings.push(new Building(this,"BD_evil",8,9));
         this.buildings.push(new Building(this,"BD_evil",15,19));
         this.buildings.push(new Building(this,"BD_good",4,16));
         this.buildings.push(new Building(this,"BD_good",5,16));
         this.buildings.push(new Building(this,"BD_good",6,19));
         this.buildings.push(new Building(this,"BD_good",7,19));
         this.buildings.push(new Building(this,"BB_good",2,21));
         this.buildings.push(new Building(this,"BB_good",3,21));
         this.buildings.push(new Building(this,"BB_good",1,19));
         this.buildings.push(new Building(this,"BB_good",2,19));
         this.buildings.push(new Building(this,"BC_good",3,19));
         this.buildings.push(new Building(this,"BG_good",6,17));
         this.units.push(new Unit(this,"UD_evil",20,9,0.5));
         this.units.push(new Unit(this,"UC_good",null,null,null,null,null,"still",300,true));
         this.units.push(new Unit(this,"UC_good",null,null,null,null,null,"still",500,true));
         this.units.push(new Unit(this,"UC_good",null,null,null,null,null,"still",3000,true));
         this.units.push(new Unit(this,"UC_good",5,19,null,null,null,"roam",6,true));
         this.units.push(new Unit(this,"UC_good",5,19,null,null,null,"roam",6,true));
         this.units.push(new Unit(this,"UF_good",5,19,null,null,null,"roam",8));
         this.indicators.push(new Indicator(this,null,null,dialogue("int_level16_ind1"),"message",120));
         this.camera.focus = this.arena.tileHandles._20_4;
         this.cash = 4000;
         this.cashOppo = 250000;
         this.jukebox = 2;
      }
      if(this.level == 17)
      {
         this.buildings.push(_loc2_ = new Building(this,"BA_evil",28,12,null,0.25));
         this.friendlyTarget = _loc2_;
         this.buildings.push(_loc2_ = new Building(this,"BA_good",-10,-10));
         _loc2_.stats.isThreat = false;
         this.buildings.push(new Building(this,"BC_good",6,10));
         this.buildings.push(new Building(this,"BB_good",2,14));
         this.buildings.push(new Building(this,"BD_good",6,7));
         this.buildings.push(new Building(this,"BD_good",6,13));
         this.units.push(new Unit(this,"UF_evil",27,10,0.75));
         this.units.push(new Unit(this,"UE_evil",27,11,0.75));
         this.units.push(new Unit(this,"UI_good",8,4,0.5,null,null,null,"UF_evil"));
         this.units.push(new Unit(this,"UI_good",21,13,0.5,null,null,null,"UF_evil"));
         this.units.push(new Unit(this,"UI_evil",14,2,0.5,null,null,null,1200));
         this.units.push(new Unit(this,"UE_good",4,10,null,null,null,"roam",8));
         this.units.push(new Unit(this,"UB_good",null,null,null,null,null,"seek",null,true));
         this.units.push(new Unit(this,"UB_good",null,null,null,null,null,"seek",null,true));
         this.units.push(new Unit(this,"UB_good",null,null,null,null,null,"still",50,true));
         this.units.push(new Unit(this,"UB_good",null,null,null,null,null,"still",50,true));
         this.units.push(new Unit(this,"UB_good",null,null,null,null,null,"still",100,true));
         this.units.push(new Unit(this,"UB_good",null,null,null,null,null,"still",100,true));
         this.units.push(new Unit(this,"UB_good",null,null,null,null,null,"still",150,true));
         this.units.push(new Unit(this,"UB_good",null,null,null,null,null,"still",150,true));
         this.units.push(new Unit(this,"UB_good",null,null,null,null,null,"still",200,true));
         this.units.push(new Unit(this,"UB_good",null,null,null,null,null,"still",200,true));
         this.units.push(new Unit(this,"UB_good",null,null,null,null,null,"still",250,true));
         this.units.push(new Unit(this,"UB_good",null,null,null,null,null,"still",250,true));
         this.units.push(new Unit(this,"UB_good",null,null,null,null,null,"still",300,true));
         this.units.push(new Unit(this,"UB_good",null,null,null,null,null,"still",300,true));
         this.units.push(new Unit(this,"UB_good",null,null,null,null,null,"still",350,true));
         this.units.push(new Unit(this,"UB_good",null,null,null,null,null,"still",350,true));
         this.cash = 0;
         this.cashOppo = 250000;
         this.jukebox = 1;
      }
      if(this.level == 18)
      {
         this.buildings.push(new Building(this,"BA_evil",12,5));
         this.buildings.push(new Building(this,"BG_evil",11,3));
         this.buildings.push(new Building(this,"BB_evil",11,5));
         this.buildings.push(_loc2_ = new Building(this,"BA_good",-10,-10));
         _loc2_.stats.isThreat = false;
         this.buildings.push(new Building(this,"BD_good",5,20));
         this.buildings.push(new Building(this,"BD_good",16,20));
         this.buildings.push(new Building(this,"BB_good",10,15));
         this.buildings.push(new Building(this,"BB_good",11,15));
         this.buildings.push(new Building(this,"BD_good",10,21));
         this.buildings.push(new Building(this,"BD_good",11,21));
         this.buildings.push(new Building(this,"BD_good",10,23));
         this.buildings.push(new Building(this,"BD_good",11,23));
         this.buildings.push(new Building(this,"BB_good",10,25));
         this.buildings.push(new Building(this,"BB_good",11,25));
         this.buildings.push(new Building(this,"BF_good",10,28));
         this.buildings.push(new Building(this,"BD_good",8,27));
         this.buildings.push(new Building(this,"BB_good",9,27));
         this.buildings.push(new Building(this,"BB_good",12,27));
         this.buildings.push(new Building(this,"BD_good",13,27));
         this.buildings.push(new Building(this,"BB_good",4,28));
         this.buildings.push(new Building(this,"BB_good",5,28));
         this.buildings.push(new Building(this,"BB_good",16,28));
         this.buildings.push(new Building(this,"BB_good",17,28));
         this.buildings.push(new Building(this,"BG_good",18,28));
         this.buildings.push(new Building(this,"BE_good",4,25));
         this.buildings.push(new Building(this,"BC_good",16,25));
         this.units.push(new Unit(this,"UC_evil",11,7));
         this.units.push(new Unit(this,"UC_evil",12,8));
         this.units.push(new Unit(this,"UC_evil",13,7));
         this.units.push(new Unit(this,"UD_evil",15,8,0.5));
         this.units.push(new Unit(this,"UC_good",5,26,null,null,null,"roam",6));
         this.units.push(new Unit(this,"UA_good",5,26,null,null,null,"roam",6,true));
         this.units.push(new Unit(this,"UC_good",15,26,null,null,null,"roam",6));
         this.units.push(new Unit(this,"UA_good",15,26,null,null,null,"roam",6,true));
         this.units.push(new Unit(this,"UF_good",7,22,0.0625,null,null,"still"));
         this.units.push(new Unit(this,"UF_good",14,22,0.9375,null,null,"still"));
         this.units.push(new Unit(this,"UE_good",8,21,0.9375,null,null,"still",2500));
         this.units.push(new Unit(this,"UE_good",13,21,0.0625,null,null,"still",7500,true));
         this.units.push(new Unit(this,"UF_good",7,27,0,null,null,"still",5000));
         this.units.push(new Unit(this,"UF_good",14,27,0,null,null,"still",10000));
         this.units.push(new Unit(this,"UG_good",null,null,null,null,null,null,null,true));
         this.units.push(new Unit(this,"UG_good",null,null,null,null,null,null,null,true));
         this.units.push(new Unit(this,"UA_good",15,26,null,null,null,"still",100,true));
         this.units.push(new Unit(this,"UA_good",15,26,null,null,null,"still",100,true));
         this.units.push(new Unit(this,"UA_good",15,26,null,null,null,"still",100,true));
         this.units.push(new Unit(this,"UB_good",15,26,null,null,null,"still",100,true));
         this.units.push(new Unit(this,"UB_good",15,26,null,null,null,"still",100,true));
         this.units.push(new Unit(this,"UI_evil",7,29,0.5,null,null,null,10000));
         this.units.push(new Unit(this,"UI_evil",14,29,0.5,null,null,null,10000));
         this.camera.focus = this.arena.tileHandles._12_4;
         this.cash = 2000;
         this.cashOppo = 250000;
         this.jukebox = 3;
      }
      if(this.level == 19)
      {
         this.rejig = function(what)
         {
            what.nav.offsetX = what.nav.offsetY = 0.5;
            what.posX = (what.nav.currentX - 0.5) * what.nav.arena.tileSize;
            what.posY = (what.nav.currentY - 0.5) * what.nav.arena.tileSize;
         };
         this.construction.shortcuts.UA_evil.max = 10;
         this.buildings.push(new Building(this,"BB_evil",4,3));
         this.buildings.push(new Building(this,"BG_evil",7,3));
         this.buildings.push(new Building(this,"BC_evil",5,23,"good",0.2));
         this.buildings.push(new Building(this,"BC_good",-10,-10));
         this.buildings.push(new Building(this,"BD_good",4,12,null,0.8));
         this.buildings.push(new Building(this,"BD_good",3,13));
         this.buildings.push(new Building(this,"BB_good",3,11));
         this.buildings.push(new Building(this,"BB_good",2,11));
         this.buildings.push(new Building(this,"BB_good",2,13));
         this.buildings.push(new Building(this,"BD_good",1,13));
         this.buildings.push(new Building(this,"BD_good",10,13));
         this.buildings.push(new Building(this,"BB_good",9,11));
         this.buildings.push(new Building(this,"BB_good",9,13));
         this.buildings.push(new Building(this,"BB_good",8,11));
         this.buildings.push(new Building(this,"BD_good",8,13));
         this.buildings.push(new Building(this,"BD_good",7,12,null,0.8));
         this.buildings.push(_loc3_ = new Building(this,"BH_good",6,28));
         this.buildings.push(new Building(this,"BB_good",5,28));
         this.buildings.push(new Building(this,"BD_good",4,28));
         this.buildings.push(new Building(this,"BD_good",7,28));
         this.units.push(_loc2_ = new Unit(this,"UH_evil",6,3,0.5625));
         this.rejig(_loc2_);
         _loc2_.stats.capacity = 9;
         this.units.push(new Unit(this,"UA_evil",5,4));
         this.units.push(new Unit(this,"UA_evil",5,4));
         this.units.push(new Unit(this,"UA_evil",5,4));
         this.units.push(new Unit(this,"UA_evil",5,5));
         this.units.push(new Unit(this,"UA_evil",5,5));
         this.units.push(new Unit(this,"UA_evil",5,5));
         this.units.push(new Unit(this,"UB_evil",4,5));
         this.units.push(new Unit(this,"UB_evil",4,5));
         this.units.push(new Unit(this,"UA_evil",6,5));
         this.units.push(new Unit(this,"UA_evil",6,5));
         this.units.push(new Unit(this,"UA_evil",6,5));
         this.units.push(new Unit(this,"UB_evil",7,5));
         this.units.push(_loc2_ = new Unit(this,"UB_evil",7,5));
         this.rejig(_loc2_);
         this.units.push(new Unit(this,"UE_good",10,27,0.875,null,null,"still"));
         this.units.push(new Unit(this,"UE_good",1,27,0.125,null,null,"still"));
         this.units.push(new Unit(this,"UA_good",10,22,null,null,null,"roam",2));
         this.units.push(new Unit(this,"UA_good",1,22,null,null,null,"roam",2));
         this.units.push(new Unit(this,"UI_good",1,17,0.5,null,null,null,8000));
         this.units.push(new Unit(this,"UI_good",3,3,0.5,null,null,null,2000));
         this.units.push(new Unit(this,"UC_good",5,29,null,null,null,"still",4000));
         this.indicators.push(new Indicator(this,null,null,dialogue("int_level19_ind1"),"message",80));
         this.indicators.push(new Indicator(this,this.arena.tileHandles._6_13,null,null,"focus"));
         this.indicators.push(new Indicator(this,null,null,dialogue("int_level19_ind2"),"message",80));
         this.indicators.push(new Indicator(this,_loc3_,null,null,"focus"));
         this.indicators.push(new Indicator(this,null,null,dialogue("int_level19_ind3"),"message",80));
         this.indicators.push(new Indicator(this,this.arena.tileHandles._6_4,null,null,"focus"));
         this.indicators.push(new Indicator(this,null,null,"","message",1000));
         this.indicators.push(new Indicator(this,null,null,dialogue("int_level19_ind4"),"message"));
         this.arena.shroud.reveal(2,13,3);
         this.arena.shroud.reveal(6,11,4);
         this.arena.shroud.reveal(9,13,3);
         this.arena.shroud.reveal(6,28,2);
         this.camera.focus = this.arena.tileHandles._6_4;
         this.cash = 0;
         this.cashOppo = 250000;
         this.jukebox = 2;
      }
      if(this.level == 20)
      {
         this.buildings.push(_loc5_ = new Building(this,"BA_evil",25,12));
         this.buildings.push(new Building(this,"BB_evil",6,7));
         this.buildings.push(_loc4_ = new Building(this,"BD_evil",5,7));
         this.buildings.push(new Building(this,"BD_evil",23,7));
         this.units.push(new Unit(this,"UE_evil",25,9,0.375));
         this.units.push(new Unit(this,"UF_evil",26,9,0.625));
         this.units.push(new Unit(this,"UC_evil",24,11,0.375));
         this.units.push(new Unit(this,"UC_evil",27,11,0.625));
         this.units.push(new Unit(this,"UD_evil",18,5,0.5));
         this.units.push(new Unit(this,"UI_good",4,28,0.5,null,null,null,"UB_evil"));
         this.units.push(new Unit(this,"UI_good",21,21,0.5,null,null,null,"UF_evil"));
         this.units.push(new Unit(this,"UI_good",10,10,0.5,null,null,null,"UD_evil"));
         this.buildings.push(_loc3_ = new Building(this,"BA_good",5,20));
         this.buildings.push(new Building(this,"BD_good",1,16));
         this.buildings.push(new Building(this,"BD_good",10,18));
         this.buildings.push(new Building(this,"BD_good",9,18));
         this.buildings.push(new Building(this,"BD_good",7,15));
         this.buildings.push(new Building(this,"BD_good",6,15));
         this.buildings.push(new Building(this,"BD_good",26,23));
         this.buildings.push(new Building(this,"BB_good",25,23));
         this.buildings.push(new Building(this,"BD_good",24,23));
         this.buildings.push(new Building(this,"BD_good",8,28));
         this.buildings.push(new Building(this,"BC_good",5,28));
         this.buildings.push(new Building(this,"BG_good",3,28));
         this.buildings.push(new Building(this,"BH_good",2,28));
         this.buildings.push(new Building(this,"BE_good",5,24));
         this.buildings.push(new Building(this,"BF_good",2,26));
         this.buildings.push(new Building(this,"BB_good",8,23));
         this.buildings.push(new Building(this,"BB_good",8,21));
         this.buildings.push(new Building(this,"BB_good",3,17));
         this.buildings.push(new Building(this,"BB_good",3,19));
         this.buildings.push(new Building(this,"BB_good",2,19));
         this.buildings.push(new Building(this,"BB_good",2,21));
         this.buildings.push(new Building(this,"BB_good",3,21));
         this.buildings.push(new Building(this,"BB_good",3,23));
         this.buildings.push(new Building(this,"BB_good",2,23));
         this.units.push(new Unit(this,"UD_good",11,25));
         this.units.push(new Unit(this,"UD_good",27,26));
         this.units.push(new Unit(this,"UG_good",null,null,null,null,null,null,null,true));
         this.units.push(new Unit(this,"UG_good",null,null,null,null,null,null,null,true));
         this.units.push(new Unit(this,"UC_good",5,24,null,null,null,"roam",8,true));
         this.units.push(new Unit(this,"UC_good",5,24,null,null,null,"roam",8,true));
         this.units.push(new Unit(this,"UF_good",15,15,null,null,null,"roam",6,false));
         this.units.push(new Unit(this,"UF_good",14,14,null,null,null,"roam",6,true));
         this.units.push(new Unit(this,"UE_good",null,null,null,null,null,"still",1000,false));
         this.units.push(new Unit(this,"UE_good",null,null,null,null,null,"still",2000,true));
         this.units.push(new Unit(this,"UA_good",6,2,null,null,null,"roam",2,true));
         this.units.push(new Unit(this,"UA_good",25,29,null,null,null,"roam",2,true));
         this.units.push(new Unit(this,"UA_good",5,22,null,null,null,"roam",8,true));
         this.units.push(new Unit(this,"UB_good",null,null,null,null,null,"seek",null,true));
         this.units.push(new Unit(this,"UI_evil",28,26,0.5));
         this.units.push(new Unit(this,"UI_evil",3,5,0.5));
         this.indicators.push(new Indicator(this,_loc3_,null,null,"focus"));
         this.indicators.push(new Indicator(this,null,null,dialogue("int_level20_ind1"),"message",80));
         this.indicators.push(new Indicator(this,_loc4_,null,null,"focus"));
         this.indicators.push(new Indicator(this,null,null,dialogue("int_level20_ind2"),"message",80));
         this.indicators.push(new Indicator(this,_loc5_,null,null,"focus"));
         this.indicators.push(new Indicator(this,null,null,dialogue("int_level20_ind3"),"message",80));
         this.arena.shroud.reveal(6,19,2);
         this.arena.shroud.reveal(29,11,4);
         this.arena.shroud.reveal(29,5,4);
         this.arena.shroud.reveal(24,5,4);
         this.camera.focus = _loc5_;
         this.cash = 10000;
         this.cashOppo = 20000;
         this.jukebox = 4;
      }
      if(this.level == 21)
      {
         this.buildings.push(new Building(this,"BA_good",10,27));
         this.units.push(new Unit(this,"UD_good"));
         this.buildings.push(new Building(this,"BA_evil",-10,-10));
         this.buildings.push(new Building(this,"BC_evil",13,4));
         this.buildings.push(new Building(this,"BD_evil",12,3));
         this.buildings.push(new Building(this,"BD_evil",15,3));
         this.buildings.push(new Building(this,"BB_evil",13,2));
         this.buildings.push(new Building(this,"BB_evil",14,2));
         this.units.push(new Unit(this,"UA_evil",null,null,null,null,null,null,null,true));
         this.units.push(new Unit(this,"UA_evil",null,null,null,null,null,null,null,true));
         this.units.push(new Unit(this,"UA_evil",null,null,null,null,null,null,null,true));
         this.units.push(new Unit(this,"UA_evil",null,null,null,null,null,null,null,true));
         this.units.push(new Unit(this,"UA_evil",null,null,null,null,null,null,null,true));
         this.indicators.push(new Indicator(this,null,null,dialogue("int_level21_ind1"),"message",80));
         this.cash = 2000;
         this.cashOppo = 999999900;
         this.jukebox = 2;
      }
      if(this.level == 22)
      {
         this.buildings.push(new Building(this,"BA_good",2,4));
         this.buildings.push(new Building(this,"BC_evil",25,2));
         this.units.push(new Unit(this,"UD_good",4,11,0.5));
         this.units.push(new Unit(this,"UA_good",4,6,0.375));
         this.units.push(new Unit(this,"UA_good",4,6,0.375));
         this.buildings.push(new Building(this,"BA_evil",18,4));
         this.buildings.push(new Building(this,"BB_evil",17,2));
         this.buildings.push(new Building(this,"BB_evil",17,4));
         this.buildings.push(new Building(this,"BC_evil",15,3));
         this.buildings.push(new Building(this,"BD_evil",18,7));
         this.buildings.push(new Building(this,"BD_evil",15,7));
         this.buildings.push(new Building(this,"BD_evil",13,13));
         this.units.push(new Unit(this,"UD_evil",17,11,0.5));
         this.units.push(new Unit(this,"UD_evil",16,12,0.5));
         this.units.push(new Unit(this,"UB_evil",null,null,null,null,null,null,null,true));
         this.units.push(new Unit(this,"UB_evil",null,null,null,null,null,null,null,true));
         this.units.push(new Unit(this,"UB_evil",null,null,null,null,null,null,null,true));
         this.units.push(new Unit(this,"UB_evil",null,null,null,null,null,null,null,true));
         this.units.push(new Unit(this,"UB_evil",null,null,null,null,null,null,null,true));
         this.units.push(new Unit(this,"UA_evil",null,null,null,null,null,null,null,true));
         this.units.push(new Unit(this,"UA_evil",null,null,null,null,null,null,null,true));
         this.units.push(new Unit(this,"UI_evil",19,13,5));
         this.units.push(new Unit(this,"UI_evil",18,14,5));
         this.units.push(new Unit(this,"UI_good",19,14,0.5,null,null,null,"UF_good"));
         this.units.push(new Unit(this,"UI_evil",17,15,5));
         this.units.push(new Unit(this,"UI_evil",18,15,5));
         this.units.push(new Unit(this,"UI_evil",19,15,5));
         this.indicators.push(new Indicator(this,null,null,dialogue("int_level22_ind1"),"message"));
         this.indicators.push(new Indicator(this,null,null,dialogue("int_level22_ind2"),"message",240));
         this.indicators.push(new Indicator(this,null,null,dialogue("int_level22_ind2"),"message",1));
         this.arena.shroud.reveal(5,6,4);
         this.cash = 2000;
         this.cashOppo = 30000;
         this.jukebox = 1;
      }
      if(this.level == 23)
      {
         this.buildings.push(new Building(this,"BB_good",8,3));
         this.buildings.push(new Building(this,"BB_good",8,5));
         this.buildings.push(new Building(this,"BB_good",8,7));
         this.buildings.push(new Building(this,"BD_good",7,9));
         this.buildings.push(new Building(this,"BD_good",9,9));
         this.units.push(_loc2_ = new Unit(this,"UE_good",8,10,0.5));
         this.buildings.push(new Building(this,"BF_evil",1,29));
         this.units.push(new Unit(this,"UG_evil",null,null,null,null,null,null,null,true));
         this.units.push(new Unit(this,"UG_evil",null,null,null,null,null,null,null,true));
         this.units.push(new Unit(this,"UG_evil",null,null,null,null,null,null,null,true));
         this.units.push(new Unit(this,"UG_evil",null,null,null,null,null,null,null,true));
         this.units.push(new Unit(this,"UI_evil",8,18,5,null,null,null,500,true));
         this.indicators.push(new Indicator(this,null,null,dialogue("int_level23_ind1"),"message"));
         this.camera.focus = _loc2_;
         this.cash = 1000;
         this.cashOppo = 999999900;
         this.jukebox = 2;
      }
      if(this.level == 24)
      {
         this.units.push(_loc2_ = new Unit(this,"UE_good",15,28,0));
         this.units.push(new Unit(this,"UI_good",6,22,5,null,null,null,"UA_good"));
         this.units.push(new Unit(this,"UI_good",12,22,5,null,null,null,"UA_good"));
         this.units.push(new Unit(this,"UI_good",15,5,5,null,null,null,"UF_good"));
         this.units.push(new Unit(this,"UI_good",3,11,5,null,null,null,"UB_good"));
         this.buildings.push(new Building(this,"BC_evil",1,29));
         this.units.push(new Unit(this,"UF_evil",12,3,0.5,null,null,"still"));
         this.units.push(new Unit(this,"UE_evil",6,11,0.5,null,null,"still"));
         this.units.push(new Unit(this,"UE_evil",21,14,0.625,null,null,"still"));
         this.units.push(new Unit(this,"UE_evil",6,18,0.625,null,null,"still"));
         this.units.push(new Unit(this,"UE_evil",21,25,0.75,null,null,"still"));
         this.units.push(new Unit(this,"UA_evil",3,25,0.25,null,null,"still"));
         this.indicators.push(new Indicator(this,null,null,dialogue("int_level24_ind1"),"message"));
         this.arena.shroud.reveal(15,30,4);
         this.camera.focus = _loc2_;
         this.cash = 0;
         this.cashOppo = 0;
         this.jukebox = 2;
      }
      if(this.level == 26)
      {
         this.buildings.push(new Building(this,"BA_good",-10,-10));
         this.units.push(_loc2_ = new Unit(this,"UA_evil",15,28,0.0625));
         this.units.push(new Unit(this,"UI_evil",23,27,0.5,null,null,null,"UA_evil"));
         this.units.push(new Unit(this,"UI_good",4,26,0.5,null,null,null,"UE_evil"));
         this.units.push(new Unit(this,"UI_evil",7,13,0.5,null,null,null,"UB_evil"));
         this.units.push(new Unit(this,"UI_evil",22,5,0.5,null,null,null,"UB_evil"));
         this.units.push(new Unit(this,"UI_good",28,26,0.5,null,null,null,"UC_evil"));
         this.units.push(new Unit(this,"UI_good",29,14,0.5,null,null,null,"UE_evil"));
         this.units.push(new Unit(this,"UI_good",17,21,0.5,null,null,null,"UC_evil"));
         this.units.push(new Unit(this,"UI_evil",28,7,0.5,null,null,null,"UA_evil"));
         this.units.push(new Unit(this,"UI_evil",29,7,0.5,null,null,null,"UA_evil"));
         this.units.push(new Unit(this,"UI_evil",29,15,0.5,null,null,null,"UA_evil"));
         this.units.push(new Unit(this,"UI_evil",28,15,0.5,null,null,null,"UA_evil"));
         this.units.push(new Unit(this,"UI_evil",4,5,0.5,null,null,null,1000));
         this.units.push(new Unit(this,"UE_good",11,17,0.5,null,null,"still",10000));
         this.units.push(new Unit(this,"UA_good",27,19,0.5625,null,null,"still",10000));
         this.units.push(new Unit(this,"UA_good",27,24,0.875,null,null,"still",10000));
         this.units.push(new Unit(this,"UA_good",17,15,0,null,null,"roam",2));
         this.units.push(new Unit(this,"UA_good",17,20,0,null,null,"roam",2));
         this.units.push(new Unit(this,"UA_good",5,26,0.25,null,null,"still",10000));
         this.units.push(new Unit(this,"UC_good",21,14,0.4375,null,null,"still",10000));
         this.units.push(new Unit(this,"UC_good",23,14,0.5625,null,null,"still",10000));
         this.units.push(new Unit(this,"UC_good",29,9,0,null,null,"roam",6));
         this.units.push(new Unit(this,"UF_good",10,5,0.25,null,null,"still",10000));
         this.indicators.push(new Indicator(this,null,null,dialogue("int_level26_ind1"),"message",120));
         this.camera.focus = _loc2_;
         this.cash = 0;
         this.cashOppo = 50000;
         this.jukebox = 3;
      }
      if(this.level == 27)
      {
         this.rejig = function(what)
         {
            what.nav.offsetX = what.nav.offsetY = 0.5;
            what.posX = (what.nav.currentX - 0.5) * what.nav.arena.tileSize;
            what.posY = (what.nav.currentY - 0.5) * what.nav.arena.tileSize;
            what.stats.obstruct = true;
            what.setBlock(what.tilePos.x,what.tilePos.y);
         };
         this.buildings.push(new Building(this,"BB_evil",-10,-10));
         this.buildings.push(new Building(this,"BH_evil",-10,-10));
         this.units.push(_loc2_ = new Unit(this,"UB_evil",2,2,0.5));
         this.rejig(_loc2_);
         this.units.push(_loc2_ = new Unit(this,"UC_evil",3,2,0.5));
         this.rejig(_loc2_);
         this.units.push(_loc2_ = new Unit(this,"UE_evil",4,2,0.5));
         this.rejig(_loc2_);
         this.units.push(_loc3_ = _loc2_ = new Unit(this,"UD_evil",5,2,0.5));
         this.rejig(_loc2_);
         _loc2_.stats.miner = _loc2_.stats.bait = _loc2_.nav.path = false;
         this.units.push(_loc2_ = new Unit(this,"UF_evil",6,2,0.5));
         this.rejig(_loc2_);
         this.units.push(_loc2_ = new Unit(this,"UE_evil",7,2,0.5));
         this.rejig(_loc2_);
         this.units.push(_loc2_ = new Unit(this,"UC_evil",8,2,0.5));
         this.rejig(_loc2_);
         this.units.push(_loc2_ = new Unit(this,"UB_evil",9,2,0.5));
         this.rejig(_loc2_);
         this.units.push(_loc2_ = new Unit(this,"UA_evil",2,3,0.5));
         this.rejig(_loc2_);
         this.units.push(_loc2_ = new Unit(this,"UA_evil",3,3,0.5));
         this.rejig(_loc2_);
         this.units.push(_loc2_ = new Unit(this,"UA_evil",4,3,0.5));
         this.rejig(_loc2_);
         this.units.push(_loc2_ = new Unit(this,"UA_evil",5,3,0.5));
         this.rejig(_loc2_);
         this.units.push(_loc2_ = new Unit(this,"UA_evil",6,3,0.5));
         this.rejig(_loc2_);
         this.units.push(_loc2_ = new Unit(this,"UA_evil",7,3,0.5));
         this.rejig(_loc2_);
         this.units.push(_loc2_ = new Unit(this,"UA_evil",8,3,0.5));
         this.rejig(_loc2_);
         this.units.push(_loc2_ = new Unit(this,"UA_evil",9,3,0.5));
         this.rejig(_loc2_);
         this.units.push(_loc2_ = new Unit(this,"UF_good",2,9,0,null,null,"still",10000));
         this.rejig(_loc2_);
         this.units.push(_loc2_ = new Unit(this,"UC_good",3,9,0,null,null,"still",10000));
         this.rejig(_loc2_);
         this.units.push(_loc2_ = new Unit(this,"UE_good",4,9,0,null,null,"still",10000));
         this.rejig(_loc2_);
         this.units.push(_loc2_ = new Unit(this,"UD_good",5,9,0,null,null,"still",10000));
         this.rejig(_loc2_);
         _loc2_.stats.miner = _loc2_.stats.bait = _loc2_.nav.path = _loc2_.nav.npath = false;
         this.units.push(_loc2_ = new Unit(this,"UF_good",6,9,0,null,null,"still",10000));
         this.rejig(_loc2_);
         this.units.push(_loc2_ = new Unit(this,"UE_good",7,9,0,null,null,"still",10000));
         this.rejig(_loc2_);
         this.units.push(_loc2_ = new Unit(this,"UC_good",8,9,0,null,null,"still",10000));
         this.rejig(_loc2_);
         this.units.push(_loc2_ = new Unit(this,"UF_good",9,9,0,null,null,"still",10000));
         this.rejig(_loc2_);
         this.units.push(_loc2_ = new Unit(this,"UA_good",2,8,0,null,null,"still",10000));
         this.rejig(_loc2_);
         this.units.push(_loc2_ = new Unit(this,"UA_good",3,8,0,null,null,"still",10000));
         this.rejig(_loc2_);
         this.units.push(_loc2_ = new Unit(this,"UA_good",4,8,0,null,null,"still",10000));
         this.rejig(_loc2_);
         this.units.push(_loc2_ = new Unit(this,"UA_good",5,8,0,null,null,"still",10000));
         this.rejig(_loc2_);
         this.units.push(_loc2_ = new Unit(this,"UA_good",6,8,0,null,null,"still",10000));
         this.rejig(_loc2_);
         this.units.push(_loc2_ = new Unit(this,"UA_good",7,8,0,null,null,"still",10000));
         this.rejig(_loc2_);
         this.units.push(_loc2_ = new Unit(this,"UA_good",8,8,0,null,null,"still",10000));
         this.rejig(_loc2_);
         this.units.push(_loc2_ = new Unit(this,"UA_good",9,8,0,null,null,"still",10000));
         this.rejig(_loc2_);
         this.indicators.push(new Indicator(this,null,null,dialogue("int_level27_ind1"),"message",120));
         this.camera.focus = _loc3_;
         this.cash = 0;
         this.cashOppo = 0;
         this.jukebox = 4;
      }
      if(this.level == 28)
      {
         this.units.push(_loc3_ = new Unit(this,"UQ_evil",28,3,0.5));
         this.buildings.push(new Building(this,"BK_good",4,27));
         this.buildings.push(new Building(this,"BB_good",6,27));
         this.buildings.push(new Building(this,"BB_good",3,27));
         this.buildings.push(new Building(this,"BB_good",18,4));
         this.buildings.push(new Building(this,"BB_good",15,4));
         this.buildings.push(new Building(this,"BB_good",24,17));
         this.buildings.push(new Building(this,"BB_good",25,17));
         this.buildings.push(new Building(this,"BB_good",2,4));
         this.buildings.push(new Building(this,"BB_good",3,10));
         this.buildings.push(new Building(this,"BC_good",27,27));
         this.buildings.push(new Building(this,"BD_good",4,19));
         this.buildings.push(new Building(this,"BD_good",5,19));
         this.buildings.push(new Building(this,"BD_good",16,9));
         this.buildings.push(new Building(this,"BD_good",8,7));
         this.buildings.push(new Building(this,"BE_good",16,5));
         this.buildings.push(new Building(this,"BG_good",29,27));
         this.buildings.push(new Building(this,"BL_good",19,20));
         this.units.push(new Unit(this,"UA_good",25,8,0,null,null,_loc3_,null));
         this.units.push(new Unit(this,"UA_good",28,8,0,null,null,_loc3_,null));
         this.units.push(new Unit(this,"UA_good",26,9,0,null,null,_loc3_,null));
         this.units.push(new Unit(this,"UA_good",28,9,0,null,null,_loc3_,null));
         this.units.push(new Unit(this,"UA_good",26,10,0,null,null,_loc3_,null));
         this.units.push(new Unit(this,"UA_good",27,10,0,null,null,_loc3_,null));
         this.units.push(new Unit(this,"UA_good",28,10,0,null,null,_loc3_,null));
         this.units.push(new Unit(this,"UC_good",19,3,0.25,null,null,"still",random(1000)));
         this.units.push(new Unit(this,"UC_good",18,29,0,null,null,"still",random(1000)));
         this.units.push(new Unit(this,"UA_good",8,21,0,null,null,"still",random(1000)));
         this.units.push(new Unit(this,"UA_good",5,5,0,null,null,"still",random(1000)));
         this.units.push(new Unit(this,"UA_good",21,26,0,null,null,"still",random(1000)));
         this.units.push(new Unit(this,"UE_good",26,28,0,null,null,_loc3_));
         this.units.push(new Unit(this,"UC_good",26,13,0.125,null,null,"still",10000));
         this.units.push(new Unit(this,"UC_good",29,13,0.875,null,null,"still",10000));
         this.units.push(new Unit(this,"UC_good",27,25,0.1875,null,null,"roam",2));
         this.units.push(new Unit(this,"UC_good",28,25,0.8666666666666667,null,null,"roam",2));
         this.units.push(new Unit(this,"UC_good",2,15,0.1875,null,null,"still",10000));
         this.units.push(new Unit(this,"UC_good",4,15,0.0625,null,null,"still",10000));
         this.units.push(new Unit(this,"UC_good",6,15,0.9375,null,null,"still",10000));
         this.units.push(new Unit(this,"UC_good",8,15,0.8125,null,null,"still",10000));
         this.units.push(new Unit(this,"UR_good",16,27,0,null,null,"roam",6));
         this.units.push(new Unit(this,"UP_good",13,20,0,null,null,"roam",10));
         this.units.push(new Unit(this,"UE_good",16,5,0,null,null,"roam",6));
         this.units.push(new Unit(this,"UI_good",24,17,0.5,null,null,null,1500));
         this.units.push(new Unit(this,"UI_good",18,4,0.5,null,null,null,1500));
         this.units.push(new Unit(this,"UI_good",29,27,0.5,null,null,null,1500));
         this.units.push(new Unit(this,"UI_good",3,10,0.5,null,null,null,1500));
         this.indicators.push(new Indicator(this,null,null,dialogue("int_level28_ind1"),"message",120));
         this.camera.focus = _loc3_;
         this.cash = 0;
         this.cashOppo = 999999900;
         this.jukebox = 2;
      }
      if(this.level == 29)
      {
         this.rejig = function(what, x, y)
         {
            what.nav.offsetX = x;
            what.nav.offsetY = y;
            what.posX = (what.nav.currentX - (1 - x)) * what.nav.arena.tileSize;
            what.posY = (what.nav.currentY - (1 - y)) * what.nav.arena.tileSize;
         };
         this.buildings.push(new Building(this,"BJ_evil",12,11));
         this.units.push(_loc3_ = new Unit(this,"UM_evil",12,12,0.75));
         this.rejig(_loc3_,0.5,0.5);
         this.units.push(_loc2_ = new Unit(this,"UN_evil",11,12,0.625));
         this.rejig(_loc2_,0.8,0.6);
         this.units.push(_loc2_ = new Unit(this,"UN_evil",11,12,0.625));
         this.rejig(_loc2_,1,0.8);
         this.units.push(_loc2_ = new Unit(this,"UN_evil",11,13,0.625));
         this.rejig(_loc2_,0.6,0);
         this.units.push(_loc2_ = new Unit(this,"UN_evil",11,13,0.625));
         this.rejig(_loc2_,0.8,0.2);
         this.units.push(_loc2_ = new Unit(this,"UN_evil",11,13,0.625));
         this.rejig(_loc2_,0.4,0.4);
         this.units.push(_loc2_ = new Unit(this,"UN_evil",11,13,0.625));
         this.rejig(_loc2_,0.6,0.6);
         this.units.push(_loc2_ = new Unit(this,"UN_evil",11,13,0.625));
         this.rejig(_loc2_,0.2,0.8);
         this.units.push(_loc2_ = new Unit(this,"UN_evil",11,13,0.625));
         this.rejig(_loc2_,0.4,1);
         this.units.push(new Unit(this,"UO_evil",2,7,null,null,null,null,"powerup"));
         this.units.push(new Unit(this,"UO_evil",3,17,null,null,null,null,"powerup"));
         this.units.push(new Unit(this,"UO_evil",15,3,null,null,null,null,"powerup"));
         this.units.push(new Unit(this,"UO_evil",17,5,null,null,null,null,"powerup"));
         this.units.push(new Unit(this,"UO_evil",21,13,null,null,null,null,"powerup"));
         this.units.push(new Unit(this,"UO_evil",12,21,null,null,null,null,"powerup"));
         this.units.push(new Unit(this,"UO_evil",11,10,null,null,null,null,"powerup"));
         this.buildings.push(new Building(this,"BD_evil",17,11,this.parent.oppo));
         this.buildings.push(new Building(this,"BB_evil",15,19,this.parent.oppo));
         this.buildings.push(new Building(this,"BD_good",6,11,this.parent.oppo));
         this.buildings.push(new Building(this,"BB_good",8,19,this.parent.oppo));
         this.units.push(new Unit(this,"UF_good",6,5,0.4375,this.parent.oppo,null,"still"));
         this.units.push(new Unit(this,"UC_good",5,15,0.4375,this.parent.oppo,null,"roam",4));
         this.units.push(new Unit(this,"UC_good",5,15,0.4375,this.parent.oppo,null,"roam",4));
         this.units.push(new Unit(this,"UC_good",5,15,0.4375,this.parent.oppo,null,"roam",4));
         this.units.push(new Unit(this,"UA_good",11,5,0.4375,this.parent.oppo,null,"roam",2));
         this.units.push(new Unit(this,"UA_evil",13,5,0.5625,this.parent.oppo,null,"roam",2));
         this.units.push(new Unit(this,"UE_good",9,19,0.25,this.parent.oppo,null,"still"));
         this.units.push(new Unit(this,"UE_evil",14,19,0.75,this.parent.oppo,null,"still"));
         this.units.push(new Unit(this,"UF_evil",21,16,0.8125,this.parent.oppo,null,"still"));
         this.units.push(new Unit(this,"UF_evil",18,15,0.9375,this.parent.oppo,null,"still"));
         this.units.push(new Unit(this,"UA_evil",19,7,0.125,this.parent.oppo,null,"roam",4));
         this.units.push(new Unit(this,"UA_evil",19,7,0.125,this.parent.oppo,null,"roam",4));
         this.units.push(new Unit(this,"UA_evil",19,7,0.125,this.parent.oppo,null,"roam",4));
         this.units.push(new Unit(this,"UC_evil",20,11,0.125,this.parent.oppo,null,"roam",6));
         this.units.push(new Unit(this,"UC_evil",20,11,0.125,this.parent.oppo,null,"roam",6));
         this.units.push(new Unit(this,"UC_evil",20,11,0.125,this.parent.oppo,null,"roam",6));
         this.units.push(new Unit(this,"UA_good",22,22,0.125,null,null,"still"));
         this.indicators.push(new Indicator(this,null,null,dialogue("int_level29_ind1"),"message"));
         this.indicators.push(new Indicator(this,null,null,dialogue("int_level29_ind2"),"message",120));
         this.indicators.push(new Indicator(this,_loc3_,null,null,"focus"));
         this.camera.focus = _loc3_;
         this.cash = 0;
         this.cashOppo = 999999900;
         this.jukebox = 2;
         this.arena.doSnow();
      }
      if(this.level == 31)
      {
         this.buildings.push(new Building(this,"BA_evil",-10,-10));
         this.buildings.push(_loc3_ = new Building(this,"BK_good",7,4));
         this.units.push(_loc4_ = new Unit(this,"UP_good",11,7,0.625));
         this.units.push(new Unit(this,"UB_good",6,3,0.3125));
         this.units.push(new Unit(this,"UB_good",9,4,0.75));
         this.units.push(new Unit(this,"UI_good",8,8,null,null,null,null,500));
         this.units.push(new Unit(this,"UI_good",9,6,null,null,null,null,500));
         this.units.push(new Unit(this,"UI_good",7,5,null,null,null,null,500));
         this.units.push(new Unit(this,"UI_good",2,26,null,null,null,null,500));
         this.units.push(new Unit(this,"UI_good",10,29,null,null,null,null,500,true));
         this.units.push(new Unit(this,"UI_good",6,29,null,null,null,null,500));
         this.units.push(new Unit(this,"UI_good",14,18,null,null,null,null,500));
         this.units.push(new Unit(this,"UI_good",14,28,null,null,null,null,1000));
         this.units.push(new Unit(this,"UI_good",1,17,null,null,null,null,500));
         this.units.push(new Unit(this,"UI_good",14,7,null,null,null,null,500));
         this.units.push(new Unit(this,"UI_good",11,26,null,null,null,null,1000));
         this.units.push(new Unit(this,"UI_good",2,8,null,null,null,null,500));
         this.units.push(new Unit(this,"UI_good",6,18,null,null,null,null,500));
         this.units.push(new Unit(this,"UI_good",2,29,null,null,null,null,500));
         this.units.push(new Unit(this,"UA_evil",8,18,0,null,null,_loc3_,null));
         this.units.push(new Unit(this,"UA_evil",8,16,0,null,null,_loc3_,null));
         this.units.push(new Unit(this,"UA_evil",8,17,0,null,null,_loc3_,null));
         this.units.push(new Unit(this,"UA_evil",1,19,0,null,null,_loc3_,null));
         this.units.push(new Unit(this,"UA_evil",2,19,0,null,null,_loc3_,null));
         this.units.push(new Unit(this,"UA_evil",3,19,0,null,null,_loc3_,null));
         this.units.push(new Unit(this,"UA_evil",14,8,null,null,null,"still"));
         this.units.push(new Unit(this,"UA_evil",15,7,null,null,null,"still"));
         this.units.push(new Unit(this,"UA_evil",1,15,null,null,null,"still"));
         this.units.push(new Unit(this,"UA_evil",9,29,null,null,null,"still"));
         this.units.push(new Unit(this,"UA_evil",14,12,null,null,null,"still"));
         this.units.push(new Unit(this,"UA_evil",1,29,null,null,null,"still"));
         this.units.push(new Unit(this,"UC_evil",3,8,null,null,null,"roam",4));
         this.units.push(new Unit(this,"UE_evil",8,17,null,null,null,"roam",6));
         this.units.push(new Unit(this,"UC_evil",2,26,null,null,null,"roam",4));
         this.units.push(new Unit(this,"UC_evil",14,28,null,null,null,"roam",4));
         this.units.push(new Unit(this,"UP_evil",8,26,null,null,null,"roam",4));
         this.units.push(_loc5_ = new Unit(this,"UP_evil",13,18,0.5625,null,null,"still"));
         this.units.push(new Unit(this,"UP_evil",3,18,0.125,null,null,"still"));
         this.indicators.push(new Indicator(this,this.arena.tileHandles._9_8,null,null,"focus"));
         this.indicators.push(new Indicator(this,null,null,dialogue("int_level31_ind1"),"message",80));
         this.indicators.push(new Indicator(this,_loc4_,null,null,"focus"));
         this.indicators.push(new Indicator(this,null,null,dialogue("int_level31_ind2"),"message",80));
         this.indicators.push(new Indicator(this,_loc5_,null,null,"focus"));
         this.indicators.push(new Indicator(this,null,null,dialogue("int_level31_ind3"),"message",80));
         this.indicators.push(new Indicator(this,this.arena.tileHandles._8_18,null,null,"focus"));
         this.indicators.push(new Indicator(this,null,null,dialogue("int_level31_ind4"),"message",80));
         this.indicators.push(new Indicator(this,_loc4_,null,null,"focus"));
         this.indicators.push(new Indicator(this,null,null,dialogue("int_level31_ind4"),"message"));
         this.arena.shroud.reveal(13,18,3);
         this.arena.shroud.reveal(8,7,3);
         this.arena.shroud.reveal(8,18,4);
         this.camera.focus = _loc3_;
         this.cash = 0;
         this.jukebox = 1;
      }
      if(this.level == 32)
      {
         this.buildings.push(new Building(this,"BA_evil",-10,-10));
         this.buildings.push(new Building(this,"BB_good",24,4));
         this.buildings.push(new Building(this,"BD_good",25,4));
         this.buildings.push(new Building(this,"BF_good",26,4));
         this.buildings.push(_loc3_ = new Building(this,"BK_good",22,4));
         this.buildings.push(_loc4_ = new Building(this,"BL_good",22,17,null,0.8));
         _loc4_.repairing = true;
         this.specialBuilding = _loc4_;
         this.units.push(_loc6_ = new Unit(this,"UA_good",4,4,0.625));
         this.units.push(new Unit(this,"UB_good",4,2,0.4375));
         this.units.push(new Unit(this,"UB_good",3,2,0.375));
         this.units.push(new Unit(this,"UR_good",22,7,0.5625));
         this.units.push(new Unit(this,"UR_good",21,5,0.6875));
         this.buildings.push(_loc5_ = new Building(this,"BK_evil",22,27));
         this.units.push(new Unit(this,"UC_evil",null,null,null,null,null,_loc4_,null,true));
         this.units.push(new Unit(this,"UC_evil",null,null,null,null,null,_loc4_,null,true));
         this.units.push(new Unit(this,"UC_evil",null,null,null,null,null,_loc4_,null,true));
         this.units.push(new Unit(this,"UF_evil",28,11,0.875,null,null,"still"));
         this.units.push(new Unit(this,"UP_evil",27,13,0.625,null,null,"still"));
         this.units.push(new Unit(this,"UF_evil",19,14,0.9375,null,null,"still"));
         this.units.push(new Unit(this,"UP_evil",17,13,0.1875,null,null,"still"));
         this.units.push(new Unit(this,"UE_evil",13,7,0.75,null,null,"still",5000));
         this.units.push(new Unit(this,"UE_evil",2,18,0.1875,null,null,"still",8000));
         this.units.push(new Unit(this,"UE_evil",15,22,0.875,null,null,"still"));
         this.units.push(new Unit(this,"UF_evil",11,15,0.5625,null,null,"still"));
         this.units.push(new Unit(this,"UA_evil",9,26,0.1875,null,null,"roam",4));
         this.units.push(new Unit(this,"UA_evil",3,11,0.0625,null,null,"still"));
         this.units.push(new Unit(this,"UA_evil",3,25,null,null,null,"roam",2));
         this.units.push(new Unit(this,"UA_evil",10,4,null,null,null,"roam",6));
         this.units.push(new Unit(this,"UA_evil",8,12,null,null,null,"roam",4));
         this.units.push(new Unit(this,"UA_evil",12,10,null,null,null,"roam",6));
         this.units.push(new Unit(this,"UA_evil",17,6,null,null,null,"still"));
         this.units.push(new Unit(this,"UA_evil",28,18,null,null,null,"roam",2));
         this.units.push(new Unit(this,"UI_good",6,6,null,null,null,null,"UR_good"));
         this.units.push(new Unit(this,"UI_good",2,28,null,null,null,null,10000));
         this.units.push(new Unit(this,"UI_good",10,22,null,null,null,null,"UC_good"));
         this.indicators.push(new Indicator(this,_loc5_,null,null,"focus"));
         this.indicators.push(new Indicator(this,null,null,dialogue("int_level32_ind1"),"message",80));
         this.indicators.push(new Indicator(this,_loc4_,null,null,"focus"));
         this.indicators.push(new Indicator(this,null,null,dialogue("int_level32_ind2"),"message",120));
         this.indicators.push(new Indicator(this,_loc3_,null,null,"focus"));
         this.indicators.push(new Indicator(this,null,null,dialogue("int_level32_ind3"),"message",60));
         this.indicators.push(new Indicator(this,_loc6_,null,null,"focus"));
         this.indicators.push(new Indicator(this,null,null,dialogue("int_level32_ind4"),"message"));
         this.arena.shroud.reveal(22,27,4);
         this.arena.shroud.reveal(22,22,4);
         this.arena.shroud.reveal(23,13,3);
         this.camera.focus = _loc5_;
         this.cash = 2000;
         this.cashOppo = 999999900;
         this.jukebox = 4;
      }
      if(this.level == 33)
      {
         this.buildings.push(new Building(this,"BB_evil",-10,-10));
         this.buildings.push(new Building(this,"BB_evil",-10,-10));
         this.buildings.push(new Building(this,"BK_good",11,4));
         this.units.push(new Unit(this,"UI_good",6,12,null,null,null,null,2000));
         this.units.push(new Unit(this,"UI_good",17,13,null,null,null,null,2000));
         this.units.push(new Unit(this,"UI_good",10,5,null,null,null,null,"UE_good"));
         this.units.push(new Unit(this,"UI_good",11,6,null,null,null,null,"UF_good"));
         this.units.push(new Unit(this,"UI_good",12,6,null,null,null,null,"UF_good"));
         this.units.push(new Unit(this,"UI_good",13,5,null,null,null,null,"UE_good"));
         this.units.push(new Unit(this,"UC_good",10,5,0.625));
         this.units.push(new Unit(this,"UR_good",11,7,0.5625));
         this.units.push(new Unit(this,"UR_good",12,7,0.4375));
         this.units.push(new Unit(this,"UC_good",13,5,0.375));
         this.units.push(new Unit(this,"UI_good",2,11,null,null,null,null,"UP_good"));
         this.units.push(new Unit(this,"UI_good",21,11,null,null,null,null,"UP_good"));
         this.units.push(new Unit(this,"UI_good",2,14,null,null,null,null,"UF_good"));
         this.units.push(new Unit(this,"UI_good",21,14,null,null,null,null,"UF_good"));
         if(random(2) == 1)
         {
            this.units.push(new Unit(this,"UO_evil",3,27,null,null,null,null,"UQ_evil_oppo"));
            this.units.push(new Unit(this,"UO_evil",20,27,null,null,null,null,10000));
         }
         else
         {
            this.units.push(new Unit(this,"UO_evil",3,27,null,null,null,null,10000));
            this.units.push(new Unit(this,"UO_evil",20,27,null,null,null,null,"UQ_evil_oppo"));
         }
         this.units.push(new Unit(this,"UP_evil",5,9,0.125,null,null,"still"));
         this.units.push(new Unit(this,"UA_evil",4,8,null,null,null,"still"));
         this.units.push(new Unit(this,"UA_evil",5,8,null,null,null,"still"));
         this.units.push(new Unit(this,"UA_evil",6,8,null,null,null,"still"));
         this.units.push(new Unit(this,"UA_evil",4,9,null,null,null,"still"));
         this.units.push(new Unit(this,"UA_evil",6,9,null,null,null,"still"));
         this.units.push(new Unit(this,"UA_evil",4,10,null,null,null,"still"));
         this.units.push(new Unit(this,"UA_evil",5,10,null,null,null,"still"));
         this.units.push(new Unit(this,"UA_evil",6,10,null,null,null,"still"));
         this.units.push(new Unit(this,"UP_evil",18,9,0.375,null,null,"still"));
         this.units.push(new Unit(this,"UC_evil",17,8,null,null,null,"still"));
         this.units.push(new Unit(this,"UC_evil",18,8,null,null,null,"still"));
         this.units.push(new Unit(this,"UC_evil",19,8,null,null,null,"still"));
         this.units.push(new Unit(this,"UC_evil",17,9,null,null,null,"still"));
         this.units.push(new Unit(this,"UC_evil",19,9,null,null,null,"still"));
         this.units.push(new Unit(this,"UC_evil",17,10,null,null,null,"still"));
         this.units.push(new Unit(this,"UC_evil",18,10,null,null,null,"still"));
         this.units.push(new Unit(this,"UC_evil",19,10,null,null,null,"still"));
         this.units.push(new Unit(this,"UP_evil",5,16,0.875,null,null,"still"));
         this.units.push(new Unit(this,"UF_evil",4,15,null,null,null,"still"));
         this.units.push(new Unit(this,"UF_evil",5,15,null,null,null,"still"));
         this.units.push(new Unit(this,"UF_evil",6,15,null,null,null,"still"));
         this.units.push(new Unit(this,"UF_evil",4,16,null,null,null,"still"));
         this.units.push(new Unit(this,"UF_evil",6,16,null,null,null,"still"));
         this.units.push(new Unit(this,"UF_evil",4,17,null,null,null,"still"));
         this.units.push(new Unit(this,"UF_evil",5,17,null,null,null,"still"));
         this.units.push(new Unit(this,"UF_evil",6,17,null,null,null,"still"));
         this.units.push(new Unit(this,"UP_evil",18,16,0.625,null,null,"still"));
         this.units.push(new Unit(this,"UE_evil",17,15,null,null,null,"still"));
         this.units.push(new Unit(this,"UE_evil",18,15,null,null,null,"still"));
         this.units.push(new Unit(this,"UE_evil",19,15,null,null,null,"still"));
         this.units.push(new Unit(this,"UE_evil",17,16,null,null,null,"still"));
         this.units.push(new Unit(this,"UE_evil",19,16,null,null,null,"still"));
         this.units.push(new Unit(this,"UE_evil",17,17,null,null,null,"still"));
         this.units.push(new Unit(this,"UE_evil",18,17,null,null,null,"still"));
         this.units.push(new Unit(this,"UE_evil",19,17,null,null,null,"still"));
         this.buildings.push(new Building(this,"BD_evil",11,12));
         this.buildings.push(new Building(this,"BD_evil",12,12));
         this.indicators.push(new Indicator(this,null,null,dialogue("int_level33_ind1"),"message",80));
         this.indicators.push(new Indicator(this,null,null,dialogue("int_level33_ind2"),"message",80));
         this.cash = 6000;
         this.jukebox = 3;
      }
   };
   this.outcome = function()
   {
      if(!this.active)
      {
         return undefined;
      }
      if(this.level == 1 || this.level == 11 || this.level == 26)
      {
         if(this.cash >= 1)
         {
            this.win();
         }
      }
      if(this.level == 6)
      {
         if(!this.findBuilding("BC_evil"))
         {
            this.win();
         }
      }
      if(this.level == 9)
      {
         if(this.findBuilding("BG_evil").friend)
         {
            this.win();
         }
         if(!this.findBuilding("BG_evil"))
         {
            this.lose();
         }
      }
      if(this.level == 10 || this.level == 20)
      {
         if(!(this.count % 5000) && this.friendlyTarget.active && this.findBuilding("BH_" + this.parent.oppo) && !this.findBuilding("BH_" + this.parent.oppo).friend)
         {
            this.parent.sfx.play("music_ingame_" + this.jukebox + "_stop");
            do
            {
               var newjuke = random(4) + 1;
            }
            while(newjuke == this.jukebox);
            
            this.jukebox = newjuke;
            this.parent.sfx.play("music_ingame_" + this.jukebox + "_start");
            this.launchSuperweapon(this.friendlyTarget.posX,this.friendlyTarget.posY);
         }
      }
      if(this.level == 15)
      {
         var _loc5_ = this.findUnit("UE_evil");
         if(!_loc5_)
         {
            this.lose();
         }
      }
      if(this.level == 19)
      {
         if(this.findBuilding("BH_good").friend)
         {
            this.win();
         }
         if(!this.findBuilding("BC_evil").friend && !this.findUnit("UB_evil"))
         {
            this.lose();
         }
         if(!this.findBuilding("BH_good"))
         {
            this.lose();
         }
      }
      if(this.level == 22)
      {
         var _loc2_ = this.findBuilding("BI_good");
         if(this.indicators.length == 2 && _loc2_)
         {
            this.indicator = false;
            this.training = true;
            for(var _loc4_ in this.units)
            {
               this.units[_loc4_].target = false;
               this.units[_loc4_].nav.hesitate = 1000;
               this.units[_loc4_].weaponCharge = 1000;
            }
            this.units.push(new Unit(this,"UB_good",9,13,0,this.parent.team,null,_loc2_));
            this.units.push(new Unit(this,"UB_good",9,13,0,this.parent.team,null,_loc2_));
            this.units.push(new Unit(this,"UB_good",9,13,0,this.parent.team,null,_loc2_));
            this.units.push(new Unit(this,"UB_good",9,13,0,this.parent.team,null,_loc2_));
            this.units.push(new Unit(this,"UB_good",9,13,0,this.parent.team,null,_loc2_));
            this.units.push(new Unit(this,"UB_evil",12,13,0,this.parent.team,null,_loc2_));
            this.units.push(new Unit(this,"UB_evil",12,13,0,this.parent.team,null,_loc2_));
            this.units.push(new Unit(this,"UB_evil",12,13,0,this.parent.team,null,_loc2_));
            this.units.push(new Unit(this,"UB_evil",12,13,0,this.parent.team,null,_loc2_));
            this.units.push(new Unit(this,"UB_evil",12,13,0,this.parent.team,null,_loc2_));
         }
         else if(this.indicators.length == 0 && !this.indicator)
         {
            this.camera.focus = _loc2_;
            this.win();
         }
      }
      if(this.level == 23)
      {
         if(!this.powerLow && this.construction.shortcuts.BH_good.total >= 4)
         {
            this.camera.focus = this.arena.tileHandles._8_7;
            this.win();
         }
      }
      if(this.level == 24)
      {
         _loc5_ = this.findUnit("UE_good");
         if(_loc5_.tilePos.x == 12 && _loc5_.tilePos.y == 2)
         {
            this.win();
         }
         if(!_loc5_)
         {
            this.lose();
         }
      }
      if(this.level == 27)
      {
         if(!this.findUnit("UD_good"))
         {
            this.win();
         }
         if(!this.findUnit("UD_evil"))
         {
            this.lose();
         }
      }
      if(this.level == 29)
      {
         var _loc7_ = this.findBuilding("BJ_evil");
         var _loc6_ = this.findUnit("UM_evil");
         var _loc8_ = this.findUnit("UO_evil");
         if(!_loc7_)
         {
            this.lose();
         }
         if(!_loc6_)
         {
            this.lose();
         }
         if(!this.findUnit("UN_evil"))
         {
            this.lose();
         }
         if(!_loc8_)
         {
            if(this.indicators.length == 2)
            {
               this.indicator = false;
               this.training = true;
               for(var _loc4_ in this.units)
               {
                  if(this.units[_loc4_].friend)
                  {
                     this.units[_loc4_].nav.returnHome();
                  }
               }
               this.training = true;
               this.camera.focus = _loc7_;
            }
            else if(this.indicators.length == 0 && !this.indicator && _loc6_.nav.path.length < 4)
            {
               this.win();
            }
         }
      }
      if(this.level == 31)
      {
         var _loc9_ = this.findBuilding("BL_good");
         if(_loc9_)
         {
            this.win();
         }
      }
      if(this.level == 32)
      {
         if(this.specialBuilding.health == this.specialBuilding.stats.maxHealth)
         {
            this.win();
         }
         if(!this.specialBuilding.active)
         {
            this.lose();
         }
      }
      if(this.level > 1)
      {
         if(!this.outcomeThreats)
         {
            this.win();
         }
      }
      if(this.outcomeFutures == 1)
      {
         var _loc3_ = 0;
         if(this.construction.constructingBuilding)
         {
            _loc3_ = _loc3_ + this.construction.constructingBuilding.cost * (this.construction.constructingBuilding.progress / this.construction.constructingBuilding.constructionTime);
         }
         if(this.construction.constructingUnit)
         {
            _loc3_ = _loc3_ + this.construction.constructingUnit.cost * (this.construction.constructingUnit.progress / this.construction.constructingUnit.constructionTime);
         }
         if(this.construction.buildingSite)
         {
            _loc3_ = _loc3_ + this.construction.buildingSite.stats.cost;
         }
         if(this.findBuilding("BA_" + this.parent.team).friend && !this.findUnit("UD_" + this.parent.team).friend && this.cash + _loc3_ < this.construction.shortcuts["UD_" + this.parent.team].cost)
         {
            this.outcomeFutures--;
         }
         if(this.findBuilding("BK_" + this.parent.team).friend && this.cash + _loc3_ < this.construction.shortcuts["UP_" + this.parent.team].cost)
         {
            this.outcomeFutures--;
         }
      }
      if(!this.outcomeFutures)
      {
         this.lose();
      }
   };
}

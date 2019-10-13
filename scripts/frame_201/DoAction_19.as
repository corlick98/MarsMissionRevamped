// Shows premade images like splash screens and instructions
// Controls entering cheats and starting the game
function Panel(){
   this.MC = _root.attachMovie("panel","panel",2);
   this.MC.parent = this;
   this.count = 0;
   this.state = "splash";
   this.instructionsPage = 1;
   this.instructionsPages = 3;
   this.movieName = "";
   this.codes = new Array();
   this.codes[1] = "mars";
   this.codes[2] = "powerup";
   this.codes[3] = "niceman";
   this.codes[4] = "buggy";
   this.codes[5] = "flyboy";
   this.codes[6] = "range";
   this.codes[7] = "stomp";
   this.codes[8] = "ufo";
   this.codes[9] = "elton";
   this.codes[10] = "eclipse";
   this.codes[21] = "pizza";
   this.codes[22] = "match";
   this.codes[23] = "manic";
   this.codes[24] = "amaze";
   this.codes[31] = "drill";
   this.codes[32] = "cavein";
   this.codes[33] = "jacks";
   this.codes[11] = "earth";
   this.codes[12] = "zapper";
   this.codes[13] = "extra";
   this.codes[14] = "retreat";
   this.codes[15] = "doctor";
   this.codes[16] = "scramble";
   this.codes[17] = "flow";
   this.codes[18] = "redalert";
   this.codes[19] = "5050";
   this.codes[20] = "nightfall";
   this.codes[26] = "temple";
   this.codes[27] = "checkmate";
   this.codes[28] = "theylive";
   this.codes[29] = "santa";
   this.level = 0;
   this.sfx = new SFX(this);
   this.sfx.play("music_intro_start");
   this.MC.title = dialogue("game_title").toUpperCase();
   this.handle = function(){
      if(this.state != this.prevState){
         this.count = 0;
      }
      this.count++;
      this.draw();
      this.game.handle();
      this.sfx.handle();
      this.prevState = this.state;
   };
   this.draw = function(){
      this.MC.gotoAndStop(this.state);
      if(this.state == "hidden"){
         this.MC._visible = false;
         _quality = "low";
      } else{
         this.MC._visible = true;
         _quality = "high";
      }
      if(this.state == "instructions"){
         this.MC.gotoAndStop(this.state + this.instructionsPage);
      }
      if(this.state == "startgame"){
         this.realStartGame();
      }
      if(this.state == "movie" && !this.MC.movieholder.movie){
         this.MC.movieholder.attachMovie("movie","movie",1);
         this.MC.code_giveaway.code.message = this.codes[this.game.level.level];
      }
      if(this.state == "splash"){
         if(this.MC.splash.glow.message._currentframe == 1){
            this.MC.splash.glow.ava._visible = true;
         }
         if(!this.MC.splash.scorePopup){
            if(dialogue("int_disableEvilSpecial") == "TRUE"){
               SO.data.specialEvilUnlocked = false;
            }
            this.MC.splash.bottom.code._visible = true;
            if(String(Selection.getFocus()) != String(this.MC.splash.bottom.code.codeentry)){
               Selection.setFocus(this.MC.splash.bottom.code.codeentry);
            }
            this.MC.splash.side_good.start_button.gotoAndStop("active");
            if(SO.data.goodUnlocked){
               this.MC.splash.side_good.continue_button.gotoAndStop("active");
            }
            if(SO.data.specialGoodUnlocked){
               this.MC.splash.side_good.special_button.gotoAndStop("active");
            }
            if(SO.data.conflictGoodUnlocked){
               this.MC.splash.side_good.conflict_button.gotoAndStop("active");
            }
            this.MC.splash.side_evil.start_button.gotoAndStop("active");
            if(SO.data.evilUnlocked){
               this.MC.splash.side_evil.continue_button.gotoAndStop("active");
            }
            if(SO.data.specialEvilUnlocked){
               this.MC.splash.side_evil.special_button.gotoAndStop("active");
            }
            if(SO.data.conflictEvilUnlocked){
               this.MC.splash.side_evil.conflict_button.gotoAndStop("active");
            }
            if(dialogue("int_disableEvil") == "TRUE"){
               this.MC.splash.side_evil.start_button.gotoAndStop("inactive");
               this.MC.splash.side_evil.continue_button.gotoAndStop("inactive");
               this.MC.splash.side_evil.conflict_button.gotoAndStop("inactive");
               this.MC.splash.side_evil.special_button.gotoAndStop("inactive");
            } else{
               this.MC.splash.snipe._visible = false;
            }
            if(dialogue("int_gameCompleteSaveScore") != "FALSE"){
               this.MC.splash.bottom.hiscore_button.gotoAndStop("active");
            } else{
               this.MC.splash.bottom.hiscore_button._visible = false;
               this.MC.splash.bottom.code._x = 140;
            }
         } else{
            this.MC.splash.side_good.start_button.gotoAndStop("inactive");
            this.MC.splash.side_good.continue_button.gotoAndStop("inactive");
            this.MC.splash.side_good.conflict_button.gotoAndStop("inactive");
            this.MC.splash.side_good.special_button.gotoAndStop("inactive");
            this.MC.splash.side_evil.start_button.gotoAndStop("inactive");
            this.MC.splash.side_evil.continue_button.gotoAndStop("inactive");
            this.MC.splash.side_evil.conflict_button.gotoAndStop("inactive");
            this.MC.splash.side_evil.special_button.gotoAndStop("inactive");
            this.MC.splash.bottom.hiscore_button.gotoAndStop("inactive");
            this.MC.splash.bottom.code._visible = false;
         }
      }
   };
   this.startGame = function(team){
      this.state = "startgame";
      this.team = team;
      this.count = 0;
   };
   this.realStartGame = function(){
      if(this.count < 0)
      {
         return undefined;
      }
      this.state = "hidden";
      this.game = new Game(this,this.team,this.level);
   };
   this.pressSplash = function(){
      this.sfx.play("music_intro_start");
      this.state = "splash";
   };
   this.splashOptionOver = function(option, team){
      if(dialogue("int_disableEvil") == "TRUE" && team == "evil"){
         return undefined;
      }
      var _loc2_ = "";
      if(option == "reset"){
         option = "start";
      }
      this.MC.splash.glow.gotoAndStop(option);
      if(option == "conflict" && !SO.data["conflict" + ucfirst(team) + "Unlocked"]){
         _loc2_ = dialogue("int_" + team + "_locked_conflict");
      }
      if(option == "special" && !SO.data["special" + ucfirst(team) + "Unlocked"]){
         _loc2_ = dialogue("int_" + team + "_locked_special");
      }
      if(this.MC.splash.glow.message._currentframe < 35){
         this.MC.splash.glow.message.gotoAndPlay(35);
      }
      this.MC.splash.glow.locked._visible = false;
      if(_loc2_.length > 0){
         this.MC.splash.glow.locked._visible = true;
         this.MC.splash.glow.ava._visible = false;
         this.MC.splash.glow.message.gotoAndPlay(2);
         this.MC.splash.glow.message.message.message = _loc2_.toUpperCase();
      }
   };
   this.pressInstructions = function(){
      this.state = "instructions";
      this.instructionsPage = 1;
   };
   this.pressNext = function(){
      if(this.instructionsPage < this.instructionsPages){
         this.instructionsPage++;
      }
   };
   this.pressPrevious = function(){
      if(this.instructionsPage > 1){
         this.instructionsPage--;
      }
   };
   this.pressStart = function(team){
      if(team == "good"){
         this.level = 0;
         SO.data.goodUnlocked = 0;
      }
      if(team == "evil"){
         this.level = 10;
         SO.data.evilUnlocked = 0;
      }
      this.startGame(team);
   };
   this.pressSpecial = function(team){
      if(team == "good"){
         this.level = 30;
         this.startGame(team);
      }
      if(team == "evil"){
         this.level = 27;
         this.startGame(team);
      }
   };
   this.pressHiscore = function(){
      getScores(this.MC.splash);
   };
   this.pressContinue = function(team){
      if(team == "good"){
         this.level = SO.data.goodUnlocked;
      }
      if(team == "evil"){
         this.level = SO.data.evilUnlocked;
      }
      this.startGame(team);
   };
   this.pressConflict = function(team){
      if(team == "good"){
         this.level = 9;
      }
      if(team == "evil"){
         this.level = 19;
      }
      this.startGame(team);
   };
   this.pressAgain = function(){
      this.sfx.play("music_intro_start");
      this.state = "splash";
   };
   this.gameOver = function(win){
      if(win != "quit"){
         if(win){
            if(win == "complete"){
               this.state = "gameComplete";
               this.MC.title = dialogue("int_gameComplete1").toUpperCase();
               if(dialogue("int_gameCompleteSaveScore") != "FALSE"){
                  if(!_level0.username.length){
                     this.MC.title = this.MC.title + ("<BR><BR>" + dialogue("int_gameComplete2").toUpperCase());
                  } else if(this.cheatsEnabled()){
                     this.MC.title = this.MC.title + ("<BR><BR>" + dialogue("int_gameComplete4").toUpperCase());
                  } else{
                     this.MC.title = this.MC.title + ("<BR><BR>" + dialogue("int_gameComplete3").toUpperCase());
                     var _loc3_ = Math.round(300000000 / this.game.level.count);
                     sendScore(_loc3_);
                  }
               }
            } else{
               this.state = "gameWin";
               this.MC.title = dialogue("int_gameWin").toUpperCase();
            }
         } else{
            this.state = "gameLose";
            this.MC.title = dialogue("int_gameLose").toUpperCase();
         }
         this.sfx.play("INT_collect");
      } else{
         this.pressSplash();
      }
      this.game.destroy();
      delete this.game;
   };
   this.enterCode = function(code){
      var _loc3_ = false;
      if(code == "fullscreen"){
         Stage.displayState = "fullScreen";
         _loc3_ = "cheatFullscreen";
      }
      if(code == "fatwallet"){
         this.cheatCashup = true;
         _loc3_ = "cheatCashup";
         _root.kvEvent(696);
      }
      if(code == "299792458" || code == "quickbuild"){
         this.cheatBuildspeed = true;
         _loc3_ = "cheatBuildspeed";
         _root.kvEvent(697);
      }
      if(code == "awesome"){
         this.cheatFirepower = true;
         _loc3_ = "cheatFirepower";
         _root.kvEvent(698);
      }
      if(code == "n00b" || code == "newbie"){
         this.cheatShields = true;
         _loc3_ = "cheatShields";
         _root.kvEvent(699);
      }
      if(code == "clearskies"){
         this.cheatShroud = true;
         _loc3_ = "cheatShroud";
         _root.kvEvent(700);
      }
      if(code == "moneypenny"){
         this.cheatCashup = true;
         this.cheatBuildspeed = true;
         this.cheatFirepower = true;
         this.cheatShields = true;
         this.cheatShroud = true;
         _loc3_ = "cheatAll";
      }
      if(code == "1337"){
         this.resetCheats();
         _loc3_ = "cheatReset";
      }
      for(var _loc6_ in this.codes){
         if(code.toLowerCase() == this.codes[_loc6_]){
            _loc3_ = _loc6_;
            break;
         }
      }
      this.MC.splash.bottom.code.code = "";
      this.MC.splash.bottom.code.gotoAndPlay("result");
      if(_loc3_){
         this.sfx.play("INT_collect");
         if(_loc3_.substr(0,5) == "cheat"){
            this.MC.splash.bottom.code.result = dialogue("int_code_" + _loc3_).toUpperCase();
         } else{
            this.MC.splash.bottom.code.result = dialogue("int_code_valid").toUpperCase();
            this.level = _loc3_ - 1;
            var _loc5_ = "good";
            if(_loc3_ > 10){
               _loc5_ = "evil";
            }
            if(_loc3_ > 20 && _loc3_ < 26){
               _loc5_ = "good";
            }
            if(_loc3_ > 30 && _loc3_ < 36){
               _loc5_ = "good";
            }
            this.startGame(_loc5_);
         }
      } else{
         this.sfx.play("INT_invalid");
         this.MC.splash.bottom.code.result = dialogue("int_code_invalid").toUpperCase();
      }
      if(code == "credits"){
         this.MC.splash.bottom.code.result = "www.4T2.co.uk";
         getUrl("http://www.4T2.co.uk/", "_blank");
      }
      if(code == "beeblebrox"){
         this.MC.splash.bottom.code.result = "TESTMODE";
         TESTMODE = true;
      }
   };
   this.resetCheats = function(){
      this.cheatCashup = false;
      this.cheatBuildspeed = false;
      this.cheatFirepower = false;
      this.cheatShields = false;
      this.cheatShroud = false;
   };
   this.cheatsEnabled = function(){
      return this.cheatCashup || this.cheatBuildspeed || this.cheatFirepower || this.cheatShields || this.cheatShroud;
   };
   this.resetCheats();
   if(BUILDMODE){
      this.level = 32;
      this.startGame("good");
   }
}

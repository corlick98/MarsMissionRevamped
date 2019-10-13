function Hud(parent)
{
   this.parent = parent;
   this.MC = this.parent.MC.attachMovie("hud","hud",9996);
   this.MC.gotoAndStop(this.parent.team);
   this.MC.training.gotoAndStop(this.parent.team);
   this.MC.indicator.arrow.gotoAndStop(this.parent.team);
   this.MC.indicator._visible = false;
   this.MC.buildings_up._visible = this.MC.buildings_down._visible = this.MC.units_up._visible = this.MC.units_down._visible = false;
   this.MC.popup.gotoAndStop("end");
   this.MC.messageUp.stop();
   this.MC.parent = this;
   this.displayCash = 0;
   this.handle = function()
   {
      this.doCash();
      this.doPower();
      this.draw();
   };
   this.draw = function()
   {
      if(CHEATMODE)
      {
         this.MC.readout = this.parent.level.count + ": " + VERSION + ": " + this.parent.fps + " FPS";
      }
      this.MC.cash = "$" + this.displayCash;
      this.MC.training._visible = this.parent.level.training;
      this.MC.deselect = "";
      if(this.parent.level.construction.buildingSite)
      {
         this.MC.deselect = dialogue("int_buildingsite_deselect").toUpperCase();
      }
      else if(this.parent.level.control.selected.length)
      {
         this.MC.deselect = dialogue("int_deselect").toUpperCase();
      }
   };
   this.doCash = function()
   {
      var _loc2_ = this.parent.level.cash;
      if(_loc2_ == this.displayCash)
      {
         return undefined;
      }
      if(Math.round(_loc2_) > Math.round(this.displayCash))
      {
         this.parent.sfx.play("INT_cashup_6");
      }
      if(this.displayCash < _loc2_ - 5000)
      {
         this.displayCash = this.displayCash + 5000;
      }
      if(this.displayCash < _loc2_ - 500)
      {
         this.displayCash = this.displayCash + 500;
      }
      if(this.displayCash < _loc2_ - 50)
      {
         this.displayCash = this.displayCash + 50;
      }
      if(this.displayCash < _loc2_ - 5)
      {
         this.displayCash = this.displayCash + 5;
      }
      if(this.displayCash < _loc2_)
      {
         this.displayCash++;
      }
      if(this.displayCash > _loc2_ + 500)
      {
         this.displayCash = this.displayCash - 500;
      }
      if(this.displayCash > _loc2_ + 50)
      {
         this.displayCash = this.displayCash - 50;
      }
      if(this.displayCash > _loc2_ + 5)
      {
         this.displayCash = this.displayCash - 5;
      }
      if(this.displayCash > _loc2_)
      {
         this.displayCash--;
      }
   };
   this.doPower = function()
   {
      var _loc2_ = min(0.2,90 / max(this.parent.level.powerCharge,this.parent.level.powerDrain));
      var _loc3_ = "yellow";
      if(this.parent.level.powerLow)
      {
         _loc3_ = "red";
      }
      this.MC.power.red._yscale = this.MC.power.yellow._yscale = 0;
      this.MC.power.green._yscale = this.parent.level.powerCharge * _loc2_;
      this.MC.power[_loc3_]._yscale = this.parent.level.powerDrain * _loc2_;
   };
   this.flash = function()
   {
      this.MC.flasher.gotoAndPlay(1);
   };
   this.flashin = function()
   {
      this.MC.flasher.gotoAndPlay("fadein");
   };
   this.flashthru = function()
   {
      this.MC.flasher.gotoAndPlay("fadethru");
   };
   this.showMessage = function(message)
   {
      this.MC.messageUp.gotoAndPlay(2);
      this.MC.messageUp.play();
      this.MC.messageUp.message.message = message.toUpperCase();
   };
   this.popup = function()
   {
      this.parent.sfx.mute(true);
      this.MC.popup.gotoAndPlay(1);
   };
   this.pressRestart = function()
   {
      this.parent.sfx.mute(false);
      this.parent.currentLevel--;
      this.MC.popup.gotoAndPlay("out");
      this.parent.active = true;
      this.parent.levelUp();
   };
   this.pressQuit = function()
   {
      this.parent.sfx.mute(false);
      this.parent.parent.gameOver("quit");
   };
   this.pressResume = function()
   {
      this.parent.sfx.mute(false);
      this.parent.active = true;
      this.MC.popup.gotoAndPlay("out");
      Mouse.hide();
   };
}

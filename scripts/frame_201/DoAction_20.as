VERSION = "v6.4";
BUILDMODE = false;
TESTMODE = false;
Stage.scaleMode = "showAll";
getURL("FSCommand:allowscale",false);
getURL("FSCommand:showmenu",false);
getURL("FSCommand:trapallkeys",true);
_quality = "medium";
function GotoLEGO()
{
   getUrl("http://www.lego.com", "_blank");
}
if(!_level0.xmlurl.length)
{
   _level0.xmlurl = "dialogue.xml";
}
if(!_level0.gamename.length)
{
   _level0.gamename = "CrystalAlienConflict";
}
GAMEID = "legocrystalien";
SEED = VID.substr(VID.length - 1,1);
RAD = 0.017453292519943295;
SCREENX = 600;
SCREENY = 400;
SCREENX2 = 300;
SCREENY2 = 200;
CHEATMODE = false;
if(BUILDMODE)
{
   CHEATMODE = true;
}
MOUSEDOWN = false;
MOUSESCROLL = 0;
SO = SharedObject.getLocal(GAMEID);
if(SO.data.goodUnlocked > 4 || SO.data.conflictGoodUnlocked)
{
   SO.data.specialGoodUnlocked = true;
}
if(SO.data.evilUnlocked > 14 || SO.data.conflictEvilUnlocked)
{
   SO.data.specialEvilUnlocked = true;
}
initDialogue();
onEnterFrame = function()
{
   panel.handle();
   if(MOUSESCROLL > 0)
   {
      MOUSESCROLL--;
   }
   if(MOUSESCROLL < 0)
   {
      MOUSESCROLL++;
   }
};
onMouseDown = function()
{
   MOUSEDOWN = true;
};
onMouseUp = function()
{
   MOUSEDOWN = false;
};
var mouseListener = new Object();
mouseListener.onMouseWheel = function(delta)
{
   MOUSESCROLL = delta * 2;
};
Mouse.addListener(mouseListener);
var my_cm = new ContextMenu();
my_cm.customItems.push(new ContextMenuItem("www.lego.com",GotoLEGO));
my_cm.hideBuiltInItems();
this.menu = my_cm;
stop();

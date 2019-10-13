i = -16734;
createEmptyMovieClip("kv_mc",i);
kv_mc.kv_v = {c:195,td:"195.memecounter.com"};
System.security.allowDomain(kv_mc.kv_v.td);
kv_mc.kv_v.c_so = SharedObject.getLocal(kv_mc.kv_v.c,"/");
kv_mc.kv_v.d = !_root.ori_dom?_root._url.split("/")[0].indexOf("http") != -1?_root._url.split("/")[2].split("?")[0]:"Local":_root.ori_dom;
kv_mc.kv_v.fpv = getVersion().split(" ")[1].split(",")[0];
kv_mc.kv_v.lurl = "http://" + kv_mc.kv_v.td + "/tracker.php" + "?c=" + kv_mc.kv_v.c + "&r=" + Math.floor(Math.random() * 10000000000) + "&d=" + kv_mc.kv_v.d + "&u=" + (!kv_mc.kv_v.c_so.data.u?"":"1") + "&p=" + kv_mc.kv_v.fpv;
kv_mc.kv_v.c_so.data.u = true;
kv_mc.kv_v.c_so.flush();
kv_mc.kv_v.t_mc = kv_mc.createEmptyMovieClip("kv_tracker",i - 1);
kv_mc.kv_v.l_mcl = new MovieClipLoader();
if(kv_mc.kv_v.l_mcl.loadClip)
{
   kv_mc.kv_v.l_mcl.loadClip(kv_mc.kv_v.lurl,kv_mc.kv_v.t_mc);
}
else
{
   loadMovie(kv_mc.kv_v.lurl,kv_mc.kv_v.t_mc);
}

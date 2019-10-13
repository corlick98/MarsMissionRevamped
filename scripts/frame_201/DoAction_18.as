// Main game l
function Game(parent, team, level)
{
   this.parent = parent;
   this.team = team;
   this.oppo = "evil";
   if(this.team == "evil")
   {
      this.oppo = "good";
   }
   this.score = 0;
   this.active = true;
   this.MC = _root.createEmptyMovieClip("Game",1);
   this.mask = this.MC.attachMovie("blank","blank",9999);
   this.mask._width = SCREENX;
   this.mask._height = SCREENY;
   this.flasher = this.MC.attachMovie("flash","flash",9997);
   this.flasher._width = SCREENX;
   this.flasher._height = SCREENY;
   this.MC.setMask(this.mask);
   this.hud = new Hud(this);
   this.sfx = this.parent.sfx;
   this.currentLevel = level;
   this.data = {tiles:"0AAAAAAAA AAAAAAAAAAAAAAA    AAAAAAAAAAAAAAAAA 1A A".split("",10000),map1:"++-1/-$$$$$.,0.#PPPPO%+,/,&PPPP%*+*+,&PP)/-$$.-\'PP%+\'  (\'PP)0.     )&%,/   )&%,/**   %,/+**+   %+***+*".split("",10000),map2:"00+-\'            -\'      PP   )!\'      )&PP )/*       (1&P %**       P(\'  (5<                                                 E>B       P   PDJ?      PP    EMC      P)    DCP     PP%            P)/            P%+            O%*".split("",10000),map3:"55O  ($.#         PDLK    P(1&         PDJ     P(\'         PPD                  PP                               PPP               PPPEB        )&     PE>K?      !!01&    PAGIC      $$1/#   PEM@CP        ($\'  PPDCP                      )&P                 %#PP        )&      (\'P         %,&                 %*#          )      %+#         )/      %*,&       P%+     )/**#       )/*     %+**#       %+*".split("",10000),map4:"?0-$\'     PP(.****,!/*,/***; PPP\'       PPP(.************;  PP        PPPP($$.*****-.*-5             PPP   ($$.**#6<7               P       6<<7                                             )&                            (1&                            (\'          )!!&                    )!!4 )/-$\'P            EB    )/**;P($\'PPP            AHB   %***;PP                EKF?  )/**+;                PPAFFHB %****;           PO  PPEKFFF?)/****;           )".split("",10000),map5:"55     P%#                 )/#                 (.,&                 (.#                  %#         2:       %#        )/*       %#        %**      )/#P       %**      %-\'PP     )/**      %#PPPPP )!/***      (\'PPPP)!/*****!!&     PPPP%*******+*,!&    PPP($.***-$**+-\'      PPP%**-\'O+-$\'        PP6<<7  $\'                )!>B             )!!/*G?             %****F?             %****@C             %****".split("",10000),map6:"22  ($$\'EKF?(\'    O      AFF?             AGF?             AFFH>B           AFFFF?P          DJFI@LB      )&  PAF? A?     )0\'  PAF? A?   ) (\'   PD@L>MC   %      PPPAF?E>>B(       PPAFHM@JH>       PPDJF? AFF       PPPAF? AFF       PPPAFH>KFF        PEKFFFFGF        PAFFFFFFF      )&PAFFFFFFF".split("",10000),map7:"7?           %#                    %#                    %#         PP)!&      %,&        PP%Q#      (.,&        )0$\'      P(.#        (\'        PP%,&               )!&P%*#             8!/*#P%*#             =***7 ($\'             9$.*;                   ($\'         )                )!!& %      )&)&      %**,!/      (10\'      %*-$$.       (\'       ($\'  %                     %                    )/                    %+                    ($        )&    PP              %#  PPPPPP            (\'  PPPEBP               PPE>MCPP     )&        PD@CPP      (\'        PPPPPP                  PPP                             E>BP                  AGHB  )!&          O".split("",10000),map8:"0?****#   %#  ($$*+*-\'   %#     **-\'    %#     $.#   )!/#      %#   %-$\'  S   (1!& (\'         %*#            %*#            ($\'      )&             %#             (1!!            ($$&              #   )!&        #   %*#        \'   %*#            %-\'            %#   EBP       (1!& DLB        %*# PDL>BE     (.# PPAFHK      %# PPDJGF      %,& PPAFF      %*# PPAFF      %*# PEKFF      %-\' PAFFG      %,& EKFI@     )0$\' AGIC      %#   DJ?       %#    A? O".split("",10000),map9:"0?*+*-\'     %*******# )!!!&(.*****-\'8/***# %*****7 =****# %*****; 9.***# %****-5  %***# %***$1&  (.*-\' (.*- (\'   %*#   %*#      ($\')& ($\'  )!!&   (\' )& )!/**#)&  )!0\' 0$$.-1/,&)/*#  #P)0\'%**,/*+,& # %#P%+-$.-$.# ,!/,!0$\'P%#O%,&****-\'PP (1!/*,+***#PE>>B%******-$\'PAFG?($.-$**#E>>KFFHB (\' $$\'AFFFFFF?  P)BPPAFFI@JILBPP%H>>KFIC DCAHBP(FFFFIC    AFHBPFFFF?     DJICPFFI@C     PDCPPFF?        PPPPFF? )& )&  PPPPFIC)0\')0\' )&PPPF? %# (\' )/# PPF? %#    %*#PPP".split("",10000),map10:"??O        DJFF?    (.*-$$$$$$$.          DJG?     (.#       %           D@CP     (\'       %            PPPPP            %  PPPPPPP  PPPPEBP           %  P)!!!&PPPPPPPAHBPP         %  P%***#E>>>>>>KF?PP)&       %  P%***#AGFI@@JFF?PP%#       %  P($$$\'D@@C  AGICPP%#       %  PPPPPPP     DJ?PPP%#       %   P         8&DCPP)/,&      %   P         =,!4 P%**#      %   PPPPPP    =**; P%**#     )/PPPP)!!&P    =**; P($$1!!&  %*!!!!/**#P    =**; PPPP%**,!!/**-$$.**#PPPP =**;    P%**-$$$$*#  ($$1!!&P =**;    P($$\'PPPP-\'     %**#P =**;    PPPPPPP  #      %**#P 9$.;         P   #      (.-\'PPEB(5         P   #       %#PPPAHB     PPPPPPP  #       %#PPEKG?  E>>B)!!!&P  #       %#PPAFFH>>KFG?%***#P  #       (\'PPAFI@@@@@@C%***#P  #         PPDJ?PPPPPPP($$$\'P  #           PDCPPPP  PPPPPPP  #            PPPPP            #       )&     PE>B           #       %,&     AGHB          ,!!!!!!!/Q,&    AFFHB        O".split("",10000),map11:".--.,0.,&P)/#%*#%+,/+,!/*#%*,/-$$.***-\'(.*-\'  (.*-\'  %.#    %+#   %%#    ($\'   (/#          )*#    )!!&  %*#    %-.# O%-1&)!!01/,&)/,/,0.*,/+*#%*-.-\'(.****#%*".split("",10000),map12:"./-$$.+-$\'D@CDJ#PP($\'P    OD,&PPPPP     E*#PPPP      D<7PPP                                 )            %            %&      2::3)/,!!&  )/**,/*.+*,!!/******%***********-/*-.*******-\'".split("",10000),map13:".,*#   %-$$$$$.*,!!!/#     %*-.***#     %-\'%*+-\'     %#P($$\'      %# PPP )!!!!!/\'   )!/+*+*+*B PP($.-$.+*+?PPPPP%,&%*-$?PPPP %*,/*#OHB)!!!/****,!".split("",10000),map14:"+:-$\'($$.**,#PP   ($.*#P      (.\'        %&        %#        (,&       )*,!&     %***# P)4 (<<<7 P%;       )/;       %-5  B    67   ?  PPP P O?PPPEBPPPEHB PDCPPEKF?     PAFG?     EKFF?    EKIJIC    AGHKC2:::3D@JF)/***,!&D@%******,!!%*********%*********".split("",10000),map15:"?+-$$$$.*;          AFF?($\'($$$.#    %*;          D@J?       (#    %*;            DC       )# PP ($5  )&                 %#PPPP     %,&                %#PPPP     %*#                %# PP )!4  ($\'          EB    %#    %*;       )&      A?    %#    %*;       %,&     AHB   (,!!!!/*;      )/*#   E>KF?)!!&".split("",10000),map16:"77%-$$.****-$.*-$$$\'($$./#OP%**-$\' %+#       %*,!!/-$\'   (.#       %*+-$$\'      (\'       %**#EBP E>>BP         %-$\'AHBPAGF? EB       %\'E>KF? AFFH>KHB      (>KFFF?PDJFFFFGHB )&  )FFFFF?P AFFFFFF? %#P %FFFGICP AI@JFFFHB%# )/FFIJ?PPPA?PAFFFF?%#P%-FILML>>>KH>KGFFIC(\' %,F?DCAFFFFGFI@@J?P   %*FH>>KFFFFFF?)&AH>BP)/*FI@@@JFFFFF?(\'AFIC %*+@C   DJFFFFH>>KF?P %*-      DJFFFFFFFFHB (.#       AI@JFFI@@@C  (1       A?EMJF? )&PP  %       A?DLKF? (\'P   %      EKH>KFF?PPPP )!0&     AFFFFFFHBPP )/*,".split("",10000),map17:"?3-\'=**#($.*************,!/****,# =**,&O(.****+***************# =***,!&%**********+*********# 9.****,0$$.*****-$.****-.*-.#  %*****#  %***-$\' %*+**#6<7%#  ($$.**#  ($.*#   ($.**#   (#     ($$\')&  ($\'     %**#  )&#         (\'          ($$\'  (\'#             P              )#            PNP             %#             P    )!&       %1&                 %*# )!&   %(\'    )!!4     )!& %*,!/*#   %&     %**;     %*,!/*****,4  %#   )!/**;   )!/**********;  %#)!!/***-52:3%***+****-.**; )/,/*+****,!/*,/**+**-$$1/*-5 %+*****-.**********+*#)&%+*,!!/-".split("",10000),map18:"5?+*-$\'($.*#%*-$$\'(.***-\'    %-\'($\'    ($$-\'     (\'          )\'                  %                   %               EB  %               DLBP(           )!&PEK?PPPP  E>BP P)/*#PD@CPPBPPPAG?PPP(.*#PPPPPPHBPPD@L>BPP($\'PPPPPP@CPPPEM@CPPPPPPPPPPEPPPPPDCPPPPPPPPP  PAPP   PP 8!!4      EKP       =**;     PAFB       =**;    E>KF?       9$$5    AFGF?P              DJFFHB )!& P    P )!&D@JFHB%*#P )!!& P%*# OAGF?%*# P%**#P %*# PAFIC6<7  %**#  6<7 EKF?P     %**#     EKFFHB     %**#     AFFI@C     %**#     D@JHB     8/**,4     PAF?P    =****;     EKGHB    =****;     DJFIC    9.**-5     EKJH>>>>>B($.#E>>>>>KF".split("",10000),map19:"+?+,!/#%+,!&*-$$\'($.*,-\'     ($.\'EB    EB(>K?    AHBJFH>>>>M@LAI@JFGICPDK?EM@@L>BP@LK?  DJHBBD@C   D@L?        AC        D                    )&        (\'           EB )!&    DC ($\'                       )!!&)&    ($$\'(\'  &        E\'        D           8!!!!!!4  =******;  9.****-5O!&%****#)!.#($$$$\'%-".split("",10000),map20:"??O        DJFF?    (.*-$$$$$$$.          DJG?     (.#       %           D@CP     (\'       %            PPPPP            %  PPPPPPP  PPPPEBP           %  P)!!!&PPPPPPPAHBPP         %  P%***#E>>>>>>KF?PP)&       %  P%***#AGFI@@JFF?PP%#       %  P($$$\'D@@C  AGICPP%#       %  PPPPPPP     DJ?PPP%#       %   P         8&DCPP)/,&      %   P         =,!4 P%**#      %   PPPPPP    =**; P%**#     )/PPPP)!!&P    =**; P($$1!!&  %*!!!!/**#P    =**; PPPP%**,!!/**-$$.**#PPPP =**;    P%**-$$$$*#  ($$1!!&P =**;    P($$\'PPPP-\'     %**#P =**;    PPPPPPP  #      %**#P 9$.;         P   #      (.-\'PPEB(5         P   #       %#PPPAHB     PPPPPPP  #       %#PPEKG?  E>>B)!!!&P  #       %#PPAFFH>>KFG?%***#P  #       (\'PPAFI@@@@@@C%***#P  #         PPDJ?PPPPPPP($$$\'P  #           PDCPPPP  PPPPPPP  #            PPPPP            #       )&     PE>B           #       %,&     AGHB          ,!!!!!!!/Q,&    AFFHB        O".split("",10000),map21:";>FFFFFFFFFI@@@@@@JFFFFFFFFFFFFFFFFI@C  O   D@JFFFFFFFFFFFFI@C          D@JFFFFFFFFFIC   )&    )&   DJFFFFFFFIC   )/,&  )/,&   DJFFFFFIC    (.-\'P (.-\'    DJFFFF?      (\'P P (\'      AFFFIC     P P P P P      DJFF?  )& P P P P P P  )&  AFIC )/,& P PPPPP P P)/,& DJ?  (.-\'P PPPPPPP P (.-\'  A?   (\'P P PPPPPPP P (\'   A?    P P PPE>BPP P P     A?     P P EKG?PPP P      A?   )& P EKGF?PP P P)&   A?  )/,& EKGGF?P P P)/,&  AHB (.-\'EKGIJF?     (.-\' EKG?  (\'EKGICAF?      (\'  AGGHB  EKGIC D@C         EKGFG? EKGIC       )&     AGFFGH>KGIC       )/,&   EKGFFFGGGIC    E>B (.-\'  EKGFFFFFFIC     AG?  (\'  EKGFFFFFFIC      AF?    E>KGFFFFFFIC   )&  AF?  E>KGGFFFFFFF?    (\'  AFH>>KGGFFFFFFFFFH>>B     AFFGGGFFFFFFFFFFFFGGH>B   AFFFFFFFFFFFFFFFFFFFGGH>>>KFFFFFFFFFFFFFF".split("",10000),map22:"51I@@@JFGFFFFFFGFI@@@J?   D@JFFFFFFI@C   A?     D@JGGI@C     A?      PD@@C       A?   )&P P)&   )&   A?   (\' )!/,!& (\'   AHB    P%****#     EKIC   P %****#     DJC  PP P%****#  PP  D& PPPP 6<)&<7 PPPP )#PPPPPP  %#  PPPPPP%#PPPPPP  %#  PPPPPP%# PPPP   %#   PPPP %#  PP   )/,&   PP  %#      )/**,&     O%,!!!!!!/****,!!!!!!/".split("",10000),map23:"0?                    )!!!&          %***#          %***#          %+*+#      EB  %***#  EB  DLB %***# EMC   DC %+*+# DC       %***#          %***#          (.*-\'           %*#            %*#            %*#        )&  %*#        %#  %*#  )&    %#  %*#  %#    %,!!/*#  %#    %Q-$.*# 8/#    (.# 6<7 9.#    )/#     )0\'    %*#     (1&    %*,&     %#   )/**#     (1& B%***,4     %# ?%+***;     %# C(.+*-5   )!0\'   ($$1!!!!0$\'    E>B($$$$\'      AFH>>>>>B   O".split("",10000),map24:"8?********#     %****************,!&R)!/******************# %***-$.*****-$$$$$$$.# %-$$\' ($$.**#       %# %#       %**# )!!!& %# %,!!!!!& %**# %-$.# %# ($$$$$.# %**# %# %# %#       %# %**# %# %# %,!!!!!& %# %**# %# (\' ($$$$$$\' %# %**# %#             %# %**,!/# )!!!!!!!!!!!/# %**-$$\' ($$.-$$$$$$$$\' %**#       %#          %**# )!!!& %# )!!!!!!!!/**# %-$.# %# ($$$$$$$$.**# %#N%# %#          %**# (\' %# %,!!!!!!!!& %**#    %# ($$.-$$$$.# %**,!!!!/#    %#    %# %**-$$$$.# )& %# )& %# %**#   O%# %# %# %# %# %**# )!!/# %,!/# %# %# %**# ($$$\' ($$$\' %# (\' %**#             %#    %**,!!!!!!!!!!!& %,!!!!/**************# %*******************-\' (.*****************-\'   (.****************#    O%*****".split("",10000),map26:"??)&%-$$$$$$$$$.!!!!!!!!!!!!!!!&%#%#PPPPP P P%-.-$$.-.-$$.+++#%#%,4PEBPP P %,/,!!/,/,&O(.**,%#%+;PA?P P P%******-$.,!!/**-%#%*;PA?PP P %******# %******,%#%+;PA?P P P(.*****# %***-$$.%#%-5PDCPP P P($$$$$\' ($$$\'  %%#%#PPPPP P P P P P P        %%#%,!!!!!!!!!!!!!!!!& )!!!!& %%#($$$$.-$.*-.******# %-$.-\' %%,!!!!!/,!/*,/******# %#O%#  %($$$.-$$$$$$$.******# %,!/,& %!!& %#       %*-$.*-\' (.**-\' %$.,!/#  EB   %-\' (.#   %**#  %!/-$$\' PDL>B %#   %#   %**#  %-.,!!& PEM@C (\' P (\'   %**,!!/#($$.#  DC     E>B     %*-$$.-# )&%#         D@C     %*#  %#,!/#%,!!!& )!!& P )&   %*#  %,-$.#(.***# %**#   %#   ($\'  ($# %,!/-$.# ($.,& )/#      PE>>,!/***#O%#   %*,!/*# PP   PD@@-.-$$.,!/# )!/*****# EB )&  )!#%#P %***# %*******# DC %#  %*#%#  ($$$\' ($$$$$$$\'    %#  %*#%#                     %#  %*#%#  )!!!!!!&   )!!!!& )/,!!/-#%#P %******,& )/****,!/**-$.#,/,!!/*+++***# %**++*****+,!/#-$.-$$$.+++**# %**+++++++-$$$\'".split("",10000),map27:"++-$$$$$$$$.# P P P P%#P P P P %# P P P P%#P P P P %# P P P P%#P P P P %# P P P P%#P P P P %,!!!!!!!!/".split("",10000),map28:"??.+#%*-$\'8!!!/,!!!/#DJFF?%-$\'%*/*#($\'  =*********,&AFIC(\'  (.-$\'     9$$$.******#AF?      %#      PE>>B%******#AF?)&    %\'       AFF?%******#AG?(\'    %BP      AFG?%******#DJHB     (HBEB)&  AFF?%******,&AF?     )F?DC(\'  DJF?%*******#AF?P   )/@CP   )!&AF?%****-.*#AFHBP  %*!&    %+#AF?%****,/*#DJF?P  %*-\'    ($\'AF?%*******,&AF?)& (.#)& EB  PAF?($.****-$\'AF?(1& %\'(\' DC  EKIC  %*-$$\'E>KG?P(\' %EB  PP  AF? P 6<7E>>KFI@C    %MC      AF? E>B  D@@JF?)&    %?     EBDJH>KG?  EBPAF?(\')!& (C     DCPAFFFIC  A?PAF?  %+# )B      PEKI@@C)& DCPAF?  ($\' %? 2::3  AF?  P(\' PPPDJHB    )/C)/**,& AIC      PPPEKF?P   %* %****# A?P      PPPAFFHB EB(. %***-\' AH>B      PPDJFICPDC)/ %***#P AFF? 2::3 PEBAF?EBP %* (.**#PPDJF? %**,4 A?AF?DC  (. )/**,&PPAF? (.**; DCAG?P    % %****#E>KG? 8/**;  PD@C     % %****#AFI@C =**-5           ( %****#AF?PPO=**,!&          ) ($$$$\'AFHBPP9.***#)!!!&    )/B      AFF?)&)/***#%-$.,!&)!/*".split("",10000),map29:"77******-.*-$$.*-.************#(.#  %-\'%************# (\'  (\' %**********-$\'        ($.*****-$.# )&      )& %-$.*-\' (\' %,!&  )!/# (\' (.#     (.*#  %*-\'     %,!&    (.#  %-\'    )!/-$\'     (\'  (\'     ($.#   )!&        )!&   %,!!!/*,!&    )!/*,!!!/-$$$.*-$\'    ($.*-$$$.#   ($\'        ($\'   %,!&     )&  )&     )!/-$\'    )/#  %,&    ($.#     )/*#  %*,&     %,& )& %-$\'  ($.# )&O)/*,!/# (\'      (\' %,!/*****,!&        )!/**********# )&  )& %************#)/#  %,&%************,/*,!!/*,/******".split("",10000),map31:"0?-$$.#%,/,/-$$.-# P(\'($$.-\' O(1\'       (\'  )!/            %**2::3        (.*%**#        )/*/+*,4       %******;      P%**.*+-5       ($.%**#       P  %(.*#)&PEB EBP ( 6<7(\'EKH>MC  )& P PEKFGF? P %,!&P D@JI@CP  (*-\' P PDCP  2:3*#   PPPP P)/*,*# )&PPPP )/***$\' (\' PPPP%****  P  PPPP (.**->B E>BEBPEB($.,J?PAGHKH>KH>B(.DCEKFFFFFFFILB(PEKIJFFFFFFHMCE>KFHKFFFFFFFH>KI@JFFFFFFI@JFFF? AFFFFFF? AFFFH>KFFGFFIL>KI@J@@JFI@JICDJF? A  DJ? A?  AFH>K  PAH>KHB AFFFI".split("",10000),map32:"??GIC(.**-\'($$.**-$$.#%,/,/-$$.-IC  %*+#    (.*# P(\'($$.-\' O(1?   (.-\'     ($\'       (\'  )!/C    (\'    P               %**B     )&     )&2::3        (.*?     %,&  8!/#%**#        )/*?  )!!/-\'  =**,/+*,4       %**C  ($$.#   9$.*****;      P%**B     (\' P   ($.*+-5       ($.?2:3           %**#       P  %?%*#  2::3     (.*#)&PEB EBP (C%*# 8/**#2::3  6<7(\'EKH>MC  )!0$\' =***#%**,!& P PEKFGF? P %*#   9.**,/****,!&P D@JI@CP  (*# )!!/*****+***-\' P PDCP  2:3-\' ($$$$.**-$.**#   PPPP P)/*,\'       %**# %**# )&PPPP )/***&      )/*-\' ($$\' (\' PPPP%****#)!!&  (.*#      P  PPPP (.**-,0$$\'   6<7  E>>B E>BEBPEB($.,*#           D@J?PAGHKH>KH>B(.*#  )&         DCEKFFFFFFFILB(-\' )/# P E>BP  PEKIJFFFFFFHMCE\'P ($1&  AIC  E>KFHKFFGFFFFH>K&PPPP(\' PDCP EKI@JFFGGFI@@JFFF\'PPE>>BPPPP PDJ? AFFI@@LB AFFFBPPAI@LBPP PE>KH>KFF?  AH>KI@J?PEK? A?PP  AFI@@JFIC  D@JF? AHBAFH>K?P)&PAIC  DJ? EB  AFH>KF?AGFFFHB%,&A?   PAH>KHB AFFFI".split("",10000),map33:"7?FFFFFFI@@JFFI@@JFFFFFFFFFFFF?PPD@@CPPAFFFFFFFFFFFF?PP   PPPAFFFFFFFFFFFF?PP    PPAFFFFFFFFFFI@CPP     PD@JFFFFFI@J?OEBPP    EB AI@JFIC DC AH>B  E>K? DC DJ?     DJF?  AFIC     AH>B    DJ?  AIC    E>KI@C     DC  DC     D@J?   )!&        )!&   AH>>B%*#)&    )&%*#E>>KI@@C%*#(\'    (\'%*#D@@J?   ($\'        ($\'   AH>B     EB  EB     E>KI@C    EK?  AHB    D@J?     EKF?  AFHB     AHB EB AI@CP D@J? EBOEKFH>K? DC P P PDC AH>KFFFFFH>B   PPP  E>KFFFFFFFFFF? EBPPEB AFFFFFFFFFFFF? A?PPA? AFFFFFFFFFFFF? AH>>K? AFFFFFFI@@@@J? AFFFF? AI@@@@J?)!!4A? AFFFF? A?8!!&A?%**;DC AFFFF? DC=**#A?%**;   AFFFF?   =**#A?%**;E>>KFFFFH>>B=**#A?($$5AFFFFFFFFFF?9$$\'AH>>>>KFFFFFFFFFFH>>>>K".split("",10000),ending:0};
   this.data.tileDatumA = new Array();
   this.data.tileDatumB = new Array();
   var _loc6_ = undefined;
   var _loc5_ = undefined;
   var _loc3_ = 0;
   while(_loc3_ <= this.data.tiles.length){
      var _loc4_ = ascii2num(this.data.tiles[_loc3_]);
      _loc6_ = !(_loc4_ & 32)?false:true;
      _loc5_ = !(_loc4_ & 16)?false:true;
      this.data.tileDatumA.push(_loc6_);
      this.data.tileDatumB.push(_loc5_);
      _loc3_ = _loc3_ + 1;
   }
   this.handle = function(){
      if(!this.active){
         return undefined;
      }
      if(TESTMODE && Key.isDown(52) && Key.isDown(50)){
         if(!CHEATMODE){
            this.sfx.play("cheater");
         }
         CHEATMODE = true;
         this.crackcount = 5;
      }
      if(CHEATMODE && !this.crackcount){
         if(Key.isDown(52) && this.parent.state == "hidden"){
            if(Key.isDown(187) || Key.isDown(107)){
               this.sfx.play("cheater");
               this.levelUp();
               this.crackcount = 5;
            }
            if(Key.isDown(189) || Key.isDown(109)){
               this.sfx.play("cheater");
               this.currentLevel = this.currentLevel - 2;
               if(this.currentLevel < 0){
                  this.currentLevel = 0;
               }
               this.levelUp();
               this.crackcount = 5;
            }
            if(Key.isDown(111)){
               this.sfx.play("cheater");
               this.level.arena.shroud.clear();
               this.crackcount = 5;
            }
            if(Key.isDown(106)){
               this.sfx.play("cheater");
               this.level.construction.speed = 300;
               this.level.cash = this.level.cash + 10000;
               this.crackcount = 5;
            }
            if(Key.isDown(8) || Key.isDown(34)){
               this.sfx.play("cheater");
               this.level.lose();
            }
            if(Key.isDown(33)){
               this.sfx.play("cheater");
               this.level.win();
            }
         }
      }
      if(this.crackcount){
         this.crackcount--;
      }
      this.fps = this.calcFPS();
      this.hud.handle();
      this.control.handle();
      this.level.handle();
   };
   this.calcFPS = function(){
      this.currentTime = getTimer();
      this.frameDuration = this.currentTime - this.previousTime;
      this.previousTime = this.currentTime;
      return int(1000 / this.frameDuration);
   };
   this.flash = function(){
      this.flasher.gotoAndPlay(1);
   };
   this.flashin = function(){
      this.flasher.gotoAndPlay("fadein");
   };
   this.flashthru = function(){
      this.flasher.gotoAndPlay("fadethru");
   };
   this.levelUp = function(){
      Mouse.show();
      this.level.destroy();
      delete this.level;
      this.currentLevel++;
      this.level = new Level(this,this.currentLevel);
      this.flash();
   };
   this.destroy = function(){
      this.level.destroy();
      this.MC.removeMovieClip();
   };
   this.levelUp();
}

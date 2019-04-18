state ("ed8_2_PC_US", "v1.4") {

    byte loadingSavefile : "ed8_2_PC_US.exe", 0x7E471A;

    byte fadeToBlack : "ed8_2_PC_US.exe", 0x6663B4; //this counts even with partial fades which means we need to define a couple extra things during which it won't pause: They're defined next without a line break
    byte textOnScreen : "ed8_2_PC_US.exe", 0x769504; //not quite dialogue, it's all text. Can't seem to be able to find a "dialogue" flag.
    byte tutorialCard1 : "ed8_2_PC_US.exe", 0x769E72; //all of these start at 128 on game launch, they only actually set themselves to desired values upon selecting "new game". After that they'll remain usable though
    byte tutorialCard2 : "ed8_2_PC_US.exe", 0x769FB2;
    byte tutorialCard3 : "ed8_2_PC_US.exe", 0x76A0F2;
    byte tutorialCard4 : "ed8_2_PC_US.exe", 0x76A232; //there's 4 variables because the game seems to number the amount of cards in any one tutorial and then call upon this when they're on screen, rather than on one universal variable. 4 is the max amount of cards I've found yet in any one tutorial
    byte cardSafety : "ed8_2_PC_US.exe" , 0x769E58;
    byte resultsCard : "ed8_2_PC_US.exe", 0x7F05CF; // I don't actually know what this address tracks, but it doesn't really matter. It seems to take a value between 15 and 25 when on a result card, and stays at 0 otherwise, which is what really matters in this case
    byte checkingQuests : "ed8_2_PC_US.exe", 0x7F057A; //0 when no quests on screen, 1 when seeing names, 2 when seeing quest description.
    byte orbmentHeal : "ed8_2_PC_US.exe", 0x005DCE4C, 0x8A8; //3 if interacting with an orbment station at all

    byte sceneLoadFlag : "ed8_2_PC_US.exe", 0x5A0CFF; //Made kinda useless by removing time based on black screens rather than actual loads, but that feels nicer user experience wise and it's easier to see when it fails. Added as a backup, since only fade outs seems to sometimes advance the timer by 0.07

    byte cutsceneFlag : "ed8_2_PC_US.exe", 0x665AFF;

    byte startHelper : "ed8_2_PC_US.exe" , 0x7F1F14;

    byte mainMenu : "ed8_2_PC_US.exe", 0x664D2A;
    
    byte currentPart : "ed8_2_PC_US.exe", 0x6659CC;
    
    short battleID : 0x00662E88, 0x6550;
    
    byte finalCards : "ed8_2_PC_US.exe", 0x7F05D4;  //these are the red cards at the end of each part. 
                                                    //It's also definitely part of an animation system so what I do is a bitwise AND to pull a part that *seems* to only be used for those last cards. Honestly big mess.
 
    byte actEnd: "ed8_2_PC_US.exe", 0x664D08;   
    
    ushort bgmID: "ed8_2_PC_US.exe" ,0x769812;
    
                                                 	
}

state ("ed8_2_PC_US", "v1.4.1") { //every address is the 1.4 one + 0x1A040

    byte loadingSavefile : "ed8_2_PC_US.exe", 0x7FE75A;

    byte fadeToBlack : "ed8_2_PC_US.exe", 0x6803F4;
    byte textOnScreen : "ed8_2_PC_US.exe", 0x783544;
    byte tutorialCard1 : "ed8_2_PC_US.exe", 0x783EB2;
    byte tutorialCard2 : "ed8_2_PC_US.exe", 0x783FF2;
    byte tutorialCard3 : "ed8_2_PC_US.exe", 0x784132;
    byte tutorialCard4 : "ed8_2_PC_US.exe", 0x784272;
    byte cardSafety : "ed8_2_PC_US.exe" , 0x783E98;
    byte resultsCard : "ed8_2_PC_US.exe", 0x80A60F;
    byte checkingQuests : "ed8_2_PC_US.exe", 0x80A5BA;
    byte orbmentHeal : "ed8_2_PC_US.exe", 0x0067E0F8, 0x3F8;

    byte sceneLoadFlag : "ed8_2_PC_US.exe", 0x5BAD3F;

    byte cutsceneFlag : "ed8_2_PC_US.exe", 0x67FB3F; 

    byte startHelper : "ed8_2_PC_US.exe" , 0x80BF54; 

    byte mainMenu : "ed8_2_PC_US.exe", 0x67ED6A;
    
    byte currentPart : "ed8_2_PC_US.exe", 0x67FA0C;
    
    short battleID : 0x0067CED8, 0x6550;
    
    byte finalCards : "ed8_2_PC_US.exe", 0x80A614; 

    byte actEnd : "ed8_2_PC_US.exe", 0x67ED48;
    
    ushort bgmID: "ed8_2_PC_US.exe" ,0x783852;
    
    ushort cutsceneID: 0x005F6E8C, 0x5CF8;
    
    ushort roomID : "ed8_2_PC_US.exe", 0x67ED88;


}

startup {

    settings.Add("load_removing", true, "Enable load removing");
    settings.Add("remove_BGM_change", true, "Stop the timer while the background music is changing", "load_removing");
    
    //parts
    
    settings.Add("partSplit", true, "Split part ends");
    settings.CurrentDefaultParent = "partSplit";
        settings.Add("prologue_part", true, "Autosplit prologue end");
        settings.Add("act1_part1_part", true, "Autosplit act 1 part 1 end");
        settings.Add("act1_part2_part", true, "Autosplit act 1 part 2 end");
        settings.Add("act1_part3_part", true, "Autosplit act 1 part 3 end");
        settings.Add("act1_part4_part", true, "Autosplit act 1 part 4 end");
        settings.Add("intermission_part", true, "Autosplit intermission end");
        settings.Add("act2_part1_part", true, "Autosplit act 2 part 1 end");
        settings.Add("act2_part2_part", true, "Autosplit act 2 part 2 end");
        settings.Add("act2_part3_part", true, "Autosplit act 2 part 3 end");
        settings.Add("act2_part4_part", true, "Autosplit act 2 part 4 end");
        settings.Add("finale_part", true, "Autosplit finale end");
        settings.Add("divertissement_part", true, "Autosplit divertissement end");
            
    //enemies/cutscenes
    
    settings.CurrentDefaultParent = null;
    settings.Add ("enemy_splitting", true, "Enable/Disable automatic boss splits");
    settings.CurrentDefaultParent = "enemy_splitting";
        settings.Add("prologue_splitting", true, "Autosplit during prologue");
            settings.Add("ortheimI", true, "Split the first Ortheim fight", "prologue_splitting");
            settings.Add("ortheimII", true, "Split the second Ortheim fight", "prologue_splitting");
            settings.Add("ortheimMecha", true, "Split the Valimar Ortheim fight", "prologue_splitting");
        
        settings.Add("act1_splitting", true, "Autosplit during Act 1");
        
            settings.Add("act1_part1", true, "Autosplit during part 1", "act1_splitting");
                settings.Add("grunoja", true, "Split Grunoja", "act1_part1");
                settings.Add("windmill", true, "Split the windmill cutscene after using the radio", "act1_part1");
                settings.Add("xenoLeoI", true, "Split Xeno and Leo", "act1_part1");
                settings.Add("act1Part1Mech", true, "Split the mech fight", "act1_part1");
                
            settings.Add("act1_part2", true, "Autosplit during part 2", "act1_splitting");
                settings.Add("unsurtr", true, "Split Unsurtr (Ice Dragon)", "act1_part2");
                settings.Add("bleuAltina", true, "Split Bleublanc and Altina.", "act1_part2");
                settings.Add("act1Part2Mech", true, "Split the mech fight", "act1_part2");
            
            settings.Add("act1_part3", true, "Autosplit during part 3", "act1_splitting");
                settings.Add("zelvenom", true, "Split Zelvenom", "act1_part3");
                settings.Add("jusis", true, "Split Jusis", "act1_part3");
                settings.Add("mcBurnI", true, "Split the McBurn/Duvalie fight", "act1_part3");
                settings.Add("act1Part3Mech", true, "Split the mech fight", "act1_part3");
        
        settings.Add ("loss", true, "Autosplit the row of losses before intermission");
            settings.Add("rufus", false, "Split Rufus", "loss");
            settings.Add("ordineI", false, "Split the Crow mech fight", "loss");
        
        settings.Add ("intermission", true, "Autosplit during Intermission");
            settings.Add("bleuDuvalieI", true, "Split the Bleublanc/Duvalie fight", "intermission");
            settings.Add("crowI", true, "Split the Crow fight", "intermission");
        
        settings.Add("act2_splitting", true, "Autosplit during Act 2");
            
                settings.Add("act2_part1", true, "Autosplit during part 1", "act2_splitting");
                    settings.Add("ortheimIII", true, "Split Ortheim", "act2_part1");
                    settings.Add("act2Part1Mech", true, "Split the mech fight", "act2_part1");
                    settings.Add("doggos", true, "Split the Gaiser Doven (Dogs)", "act2_part1");
                    
                settings.Add("act2_part2", true, "Autosplit during part 2", "act2_splitting");
                    settings.Add("neithardt", false, "Split the Neithardt fight", "act2_part2");
                    settings.Add("worms", true, "Split the Abyss Worms (Quest monster).", "act2_part2");
                    settings.Add("train", true, "Split the last train fight", "act2_part2");
                    settings.Add("samurai", true, "Split the Regenenkopf Type-0 fight (Samurai mech)", "act2_part2");
                    settings.Add("vulcan", true, "Split the Goliath fight (Vulcan mech)", "act2_part2");
                    
                settings.Add("act2_part3", true, "Autosplit during part 3", "act2_splitting");
                    settings.Add("direwolf", true, "Split Magic Knight Direwolf (Ignis Shrine)", "act2_part3");
                    settings.Add("scarlet", true, "Split the Krestel fight (Scarlet mech)", "act2_part3");
                    settings.Add("duvalie", true, "Split the Duvalie fight", "act2_part3");
                    
                settings.Add("act2_part4", true, "Autosplit during part 4", "act2_splitting");
                    settings.Add("lindbaum", true, "Split Lindbaum (Roar Cryptid)", "act2_part4");
                    settings.Add("ruby", true, "Split Magic Knight Heavy Ruby(Aqua Shrine)", "act2_part4");
                    settings.Add("isra", true, "Split Magic Knight Isra-Zeriel (Aria shrine)", "act2_part4");
                    settings.Add("grianos", true, "Split Grianos-Aura ", "act2_part4");   
                    settings.Add("trista_mech", true, "Split the retaking Trista mech fight", "act2_part4");
                    settings.Add("patrick", false, "Split the Patrick fight", "act2_part4");
                    
        settings.Add("finale", true, "Autosplit during finale");
            settings.Add("villa", true, "Split the last villa soldier fight", "finale");
            settings.Add("altina", true, "Split Altina", "finale");
            settings.Add("castle_first", true, "Split the first castle fight", "finale");
            settings.Add("bleuDuvalieII", true, "Split Duvalie/Bleublanc", "finale");
            settings.Add("xenoLeoII", true, "Split Xeno and Leo", "finale");
            settings.Add("lichI", false, "Split the first Lich", "finale");
            settings.Add("lichII", false, "Split the second Lich", "finale");
            settings.Add("mcBurnII", true, "Split McBurn", "finale");
            settings.Add("crowVita", true, "Split Crow and Vita", "finale");
            settings.Add("ordineII", true, "Split Ordine (Crow mech fight)", "finale");
            settings.Add("vermillionI", false, "Split the first part of the Vermillion fight", "finale");
            settings.Add("vermillionII", true, "Split the second part of the Vermillion fight", "finale");
            settings.Add("mechVermillion", true, "Split the mech Vermillion fight", "finale");
                    
        settings.Add("divertissement", true, "Autosplit during divertissement");
             settings.Add("rean", true, "Split Rean and Altina", "divertissement");
             
        settings.Add("epilogue", true, "Autosplit during epilogue");
             settings.Add("vandyck", true, "Split the Vandyck fight", "epilogue");
             settings.Add("cryptids", false, "Split the Cryptid midbosses", "epilogue");
             settings.Add("loa", true, "Split Loa Luciferia", "epilogue");     
             
           
}


init {

    if (modules.First().ModuleMemorySize == 0xD8B000)
        version = "v1.4";
    
    else if (modules.First().ModuleMemorySize == 0xD9B000)
        version = "v1.4.1";
    
    if (settings["partSplit"])
        vars.act2part = 0;
        
    if (settings["direwolf"] || settings["ruby"] || settings["isra"])
        vars.act2Knights = 0;
    
    vars.killedVulcan = false;
    vars.killedVermillion = false;        
}

update{

    if(timer.CurrentPhase == TimerPhase.NotRunning){
        vars.act2part = 0;
        vars.act2Knights = 0;
        vars.killedVulcan = false;
        vars.killedVermillion = false;
        }

}


start {

    return current.cutsceneFlag != 0 && current.startHelper != 0;

}

split {
    
    //this right here is the enemy splits. It would be way better if instead of a huge switch I could just make like a dictionary where I do battle ID --> Setting, but apparently I have no way of accessing the settings dictionary itself
    
    if(current.battleID == 0 && old.battleID != 0 && current.battleID != null && current.startHelper != 255){ //The first two checks check that a battle just ended. The last two check that it ended normally and not through a forced quitout or a "Return to main menu" loss
    
      switch((short)old.battleID){ //even though it was defined as short we have to cast it into short again because the script turned it into an State object
        
    //Prologue
        case 100:
              return settings["ortheimI"];
        case 101:
              return settings["ortheimII"];
        case 1000:
              return settings["ortheimMecha"];
            
    //Act 1 Part 1 
        case 14:
              return settings["grunoja"];
        case 201:
              return settings["xenoLeoI"];
        case 1011:
              return settings["act1Part1Mech"];
              
    //Act 1 Part 2
        case 205:
              return settings["unsurtr"];
        case 209:
              return settings["bleuAltina"];
        case 1012: 
              return settings["act1Part2Mech"];
             
    //Act 1 Part 3
        case 211:
              return settings["zelvenom"];
        case 213:
              return settings["jusis"];
        case 214:
              return settings["mcBurnI"];
        case 1013:
              return settings["act1Part3Mech"];
             
    //Act 1 Part 4
        case 216:
              return settings["rufus"];
        case 1014:
              return settings["ordineI"];
            
    //Intermission 
        case 302:
              return settings["bleuDuvalieI"];
        case 303:
              return settings["crowI"];
              
    //Act 2 Part 1
        case 908:
              return settings["ortheimIII"];
        case 1030:
              return settings["act2Part1Mech"];
        case 401:
              return settings["doggos"];
              
    //Act 2 Part 2
        case 1090:
              return settings["neithardt"];
        case 909:
              return settings["worms"];
        case 420:
              return settings["train"];
        case 406:
              return settings["samurai"];
        case 1031:
              vars.killedVulcan = true;
              return settings["vulcan"];
              
    //Act 2 Part 3 (and 4 in the case of magic knights)
        case 408:
              if(vars.act2Knights == 0){
                vars.act2Knights = 1;
                return settings["direwolf"];
              }
              else if (vars.act2Knights == 1){
                vars.act2Knights = 2;
                return settings ["ruby"];
              }
              else if (vars.act2Knights == 2){
                return settings ["isra"];
              }
              break;
              
        case 1032:
              return settings["scarlet"];
        case 411:
              return settings["duvalie"];
              
    //Act 2 Part 4
        case 804:
              return settings["lindbaum"];
        case 414:
              return settings["grianos"];
        case 1033:
              return settings["trista_mech"];
        case 417:
              return settings["patrick"];
              
    //Finale
        case 505:
              return settings["villa"];
        case 506:
              return settings["altina"];
        case 507:
              return settings["castle_first"];
        case 508:
              return settings["bleuDuvalieII"];
        case 509:
              return settings["xenoLeoII"];
        case 520:
              return settings["lichI"];
        case 521:
              return settings["lichII"];
        case 510:
              return settings["mcBurnII"];
        case 511:
              return settings["crowVita"];
        case 1040:
              return settings["ordineII"];
        case 515:
              return settings["vermillionI"];
        case 516:
              return settings["vermillionII"];
        case 1041:
              vars.killedVermillion = true;
              return settings["mechVermillion"];
               
    //Divertissement
        case 603:
              return settings["rean"];
     
    //Epilogue
        case 925:
              return settings["vandyck"];
        case 97:
              return settings["cryptids"];
        case 700:
              return settings["loa"];
              
        default: return false;            
                                    
      }
    }
    
    
    //cutscene splits
    
    if(current.cutsceneID == 0 && old.cutsceneID != 0){
      
      switch((short)old.cutsceneID){ //even though it was defined as short we have to cast it into short again because the script turned it into an State object
        
        case 4122: return settings["windmill"];
     
     }
    }
         
    
   //part splits
    
    switch((byte)current.currentPart){
    
        case 0: return (settings["prologue_part"] && current.actEnd == 0 && old.actEnd == 1);
        case 2: return (settings["act1_part1_part"] && ((((byte)current.finalCards) & (1 << 5)) == 0 && ((((byte)old.finalCards) & (1 << 5)) != 0)));
        case 3: return (settings["act1_part2_part"] && ((((byte)current.finalCards) & (1 << 5)) == 0 && ((((byte)old.finalCards) & (1 << 5)) != 0)));
        case 4: return ((settings["act1_part3_part"] && ((((byte)current.finalCards) & (1 << 5)) == 0 && ((((byte)old.finalCards) & (1 << 5)) != 0))) || (settings["act1_part4_part"] && current.actEnd == 0 && old.actEnd == 1));
        case 5: return (settings["intermission_part"] && current.actEnd == 0 && old.actEnd == 1);
        case 6:
               if (((((byte)current.finalCards) & (1 << 5)) == 0 && ((((byte)old.finalCards) & (1 << 5)) != 0))){
               
                  if(vars.act2part == 0){
                    vars.act2part++;
                    return settings["act2_part1_part"];
                  }
                    
                  if(vars.act2part == 1){
                    vars.act2part++;
                    return settings["act2_part2_part"];
                  }
                  
                  if(vars.act2part == 2){
                    vars.act2part++;
                    return settings["act2_part3_part"];
                  }
               }
               
               else return (settings["act2_part4_part"] && current.actEnd == 0 && old.actEnd == 1 && vars.killedVulcan);
               break;
        case 10: return (settings["finale_part"] && current.actEnd == 0 && old.actEnd == 1 && vars.killedVermillion);
        case 11: return (settings["divertissement_part"] && current.actEnd == 0 && old.actEnd == 1);
  
    }
    

    
    
}

isLoading {
     if(settings["load_removing"]) {
     
        if (settings["remove_BGM_change"] && current.cutsceneFlag > 16 && current.actEnd == 0 && current.resultsCard == 0 && current.bgmID == 65535 && current.textOnScreen == 0 ) {
           return true;
        }
        
        else {
            if (current.fadeToBlack == 03){
                if (current.loadingSavefile != 0 || current.sceneLoadFlag != 0 || old.sceneLoadFlag != 0)
                    return true;
                if (current.roomID == 45912 && current.bgmID == 65535)
                    return true;
                if (current.orbmentHeal != 3 && current.textOnScreen == 0 && current.actEnd == 0 && current.checkingQuests == 0){
                    if( current.resultsCard != 0)
                        return false;
                        
                    else if (current.currentPart >= 9)
                        return true;
                        
                    else if (current.tutorialCard1 != 0 || current.tutorialCard2 != 0 || current.tutorialCard3 != 0 || current.tutorialCard4 != 0)
                        return ((((byte)current.cardSafety) & (1 << 2)) == 0);
                    else
                        return true;
                }
                
            }

        }
    }     
    return false;
}   


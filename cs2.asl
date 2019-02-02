state ("ed8_2_PC_US", "v1.4") {

	byte loadingSavefile : "ed8_2_PC_US.exe", 0x7E471A;

	byte fadeToBlack : "ed8_2_PC_US.exe", 0x6663B4; //this counts even with partial fades which means we need to define a couple extra things during which it won't pause: They're defined next without a line break
	byte textOnScreen : "ed8_2_PC_US.exe", 0x769504; //not quite dialogue, it's all text. Can't seem to be able to find a "dialogue" flag.
	byte tutorialCard1 : "ed8_2_PC_US.exe", 0x769E72; //all of these start at 128 on game launch, they only actually set themselves to desired values upon selecting "new game". After that they'll remain usable though
	byte tutorialCard2 : "ed8_2_PC_US.exe", 0x769FB2;
	byte tutorialCard3 : "ed8_2_PC_US.exe", 0x76A0F2;
	byte tutorialCard4 : "ed8_2_PC_US.exe", 0x76A232; //there's 4 variables because the game seems to number the amount of cards in any one tutorial and then call upon this when they're on screen, rather than on one universal variable. 4 is the max amount of cards I've found yet in any one tutorial
	byte resultsCard : "ed8_2_PC_US.exe", 0x7F05CF; // I don't actually know what this address tracks, but it doesn't really matter. It seems to take a value between 15 and 25 when on a result card, and stays at 0 otherwise, which is what really matters in this case
	byte checkingQuests : "ed8_2_PC_US.exe", 0x7F057A; //0 when no quests on screen, 1 when seeing names, 2 when seeing quest description.
    byte orbmentHeal : "ed8_2_PC_US.exe", 0x005DCE4C, 0x8A8; //3 if interacting with an orbment station at all

	byte sceneLoadFlag : "ed8_2_PC_US.exe", 0x5A0CFF; //Made kinda useless by removing time based on black screens rather than actual loads, but that feels nicer user experience wise and it's easier to see when it fails. Added as a backup, since only fade outs seems to sometimes advance the timer by 0.07

	byte cutsceneFlag : "ed8_2_PC_US.exe", 0x665AFF;

	byte startHelper : "ed8_2_PC_US.exe" , 0x7F1F14;

	byte mainMenu : "ed8_2_PC_US.exe", 0x664D2A;
	
	byte battleID : 0x00662E88, 0x6550;
	
}

state ("ed8_2_PC_US", "v1.4.1") { //every address is the 1.4 one + 0x1A040

	byte loadingSavefile : "ed8_2_PC_US.exe", 0x7FE75A;

	byte fadeToBlack : "ed8_2_PC_US.exe", 0x6803F4;
	byte textOnScreen : "ed8_2_PC_US.exe", 0x783544;
	byte tutorialCard1 : "ed8_2_PC_US.exe", 0x783EB2;
	byte tutorialCard2 : "ed8_2_PC_US.exe", 0x783FF2;
	byte tutorialCard3 : "ed8_2_PC_US.exe", 0x784132;
	byte tutorialCard4 : "ed8_2_PC_US.exe", 0x784272;
	byte resultsCard : "ed8_2_PC_US.exe", 0x80A60F;
	byte checkingQuests : "ed8_2_PC_US.exe", 0x80A5BA;
    byte orbmentHeal : "ed8_2_PC_US.exe", 0x0067E0F8, 0x3F8;

	byte sceneLoadFlag : "ed8_2_PC_US.exe", 0x5BAD3F;

	byte cutsceneFlag : "ed8_2_PC_US.exe", 0x67FB3F; 

	byte startHelper : "ed8_2_PC_US.exe" , 0x80BF54; 

	byte mainMenu : "ed8_2_PC_US.exe", 0x67ED6A;
	
	byte battleID : 0x0067CED8, 0x6550;



}

startup {

	settings.Add("load_removing", true, "Enable load removing");
	settings.Add("remove_cutscenes", false, "Stop the timer during cutscenes too", "load_removing");
	
	//splits
	
	settings.Add("prologue_splitting", true, "Autosplit during prologue");
	    settings.Add("ortheimI", true, "Split the first Ortheim fight", "prologue_splitting");
	    settings.Add("ortheimII", true, "Split the second Ortheim fight", "prologue_splitting");
	    settings.Add("ortheimMecha", true, "Split the Valimar Ortheim fight", "prologue_splitting");

	
	settings.Add("act1_splitting", true, "Autosplit during Act 1");
	
	    settings.Add("act1_part1", true, "Autosplit during part 1", "act1_splitting");
	        settings.Add("grunoja", true, "Split Grunoja", "act1_part1");
	        settings.Add("xenoLeoI", true, "Split Xeno and Leo", "act1_part1");
	        settings.Add("act1Part1Mech", true, "Split the mech fight", "act1_part1");
	        
	    settings.Add("act1_part2", true, "Autosplit during part 2", "act1_splitting");
	        settings.Add("unsurtr", true, "Split Unsurtr (Ice Dragon)", "act1_part2");
	        settings.Add("bleuAltina", true, "Split Bleublanc and Altina. Won't account for adds", "act1_part2");
	        settings.Add("act1Part2Mech", true, "Split the mech fight", "act1_part2");
	    
	    settings.Add("act1_part3", true, "Autosplit during part 3", "act1_splitting");
	        settings.Add("zelvenom", true, "Split Zelvenom", "act1_part3");
	        settings.Add("jusis", true, "Split Jusis", "act1_part3");
	        settings.Add("mcBurnI", true, "Split the McBurn/Duvalie fight", "act1_part3");
	        settings.Add("act1Part3Mech", true, "Split the mech fight", "act1_part3");
	
	settings.Add ("loss", true, "Autosplit the row of losses before intermission");
	    settings.Add("rufus", true, "Split Rufus", "loss");
	    settings.Add("ordineI", true, "Split the Crow mech fight", "loss");
	
	settings.Add ("intermission", true, "Autosplit during Intermission");
	    settings.Add("bleuDuvalie", true, "Split the Bleublanc/Duvalie fight", "intermission");
	    settings.Add("crowI", true, "Split the Crow fight", "intermission");
}


init {

    if (modules.First().ModuleMemorySize == 0xD8B000)
        version = "v1.4";
    else if (modules.First().ModuleMemorySize == 0xD9B000)
        version = "v1.4.1";
}




start {

	return current.cutsceneFlag != 0 && current.startHelper != 0;

}

split {

    if(current.battleID == 0 && old.battleID != 0 && current.battleID != null && current.startHelper != 255){ //The first two checks check that a battle just ended. The last two check that it ended normally and not through a forced quitout or a "Return to main menu" loss
    
      switch((byte)old.battleID){ //even though it was defined as byte we have to cast it into byte again because the script turned it into an State object???
        
	//Prologue
        case 100: 
              print ("Ortheim I");
              return settings["ortheimI"];
        case 101:
              print ("Ortheim II");
              return settings["ortheimII"];
        case 232:
              print ("Ortheim Mecha");
              return settings["ortheimMecha"];
            
	//Act 1 Part 1 
        case 14:
              print ("Grunoja");
              return settings["grunoja"];
        case 201: 
              print ("Xeno and Leo");
              return settings["xenoLeoI"];
        case 243:
              print ("Act 1 Part 1 Mech");
              return settings["act1Part1Mech"];
              
	//Act 1 Part 2
        case 205:
              print ("Unsurtr");
              return settings["unsurtr"];
        case 209:
              print ("Bleublanc and Altina");
              return settings["bleuAltina"];
        case 244: 
              print ("Act 1 part 2 mech");
              return settings["act1Part2Mech"];
             
	//Act 1 Part 3
        case 211:
              print ("Zelvenom");
              return settings["zelvenom"];
        case 213:
              print ("Jusis");
              return settings["jusis"];
        case 214:     
              print ("McBurn");
              return settings["mcBurnI"];
        case 245:
              print ("Act 1 Part 3 Mech");
              return settings["act1Part3Mech"];
             
	//Act 1 Part 4
        case 216:
              print ("Rufus");
              return settings["rufus"];
        case 246:
              print ("Ordine");
              return settings["ordineI"];
            
	//Intermission 
        case 46:
              print ("Bleublanc and Duvalie");
              return settings["bleuDuvalie"];
        case 47:
              print ("Crow I");
              return settings["crowI"];
                 
                                 
      }
    }
}

isLoading {

	return( settings["load_removing"]        &&
		    current.loadingSavefile != 0     ||
		    current.sceneLoadFlag != 0       ||
		    settings["remove_cutscenes"] && current.cutsceneFlag != 0 && current.resultsCard == 0 ||
		    current.fadeToBlack == 03  && current.orbmentHeal != 3 && current.textOnScreen == 0 && current.checkingQuests == 0 && current.tutorialCard1 == 0 && current.tutorialCard2 == 0 && current.tutorialCard3 == 0 && current.tutorialCard4 == 0 && current.resultsCard == 0);
}
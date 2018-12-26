state ("ed8_2_PC_US") {

	byte loadingSavefile : "ed8_2_PC_US.exe", 0x7E471A;

	byte fadeToBlack : "ed8_2_PC_US.exe", 0x6663B4; //this counts even with partial fades which means we need to define a couple extra things during which it won't pause: They're defined next without a line break
	byte textOnScreen : "ed8_2_PC_US.exe", 0x769504; //not quite dialogue, it's all text. Can't seem to be able to find a "dialogue" flag.
	byte tutorialCard1 : "ed8_2_PC_US.exe", 0x769E72; //all of these start at 128 on game launch, they only actually set themselves to desired values upon selecting "new game". After that they'll remain usable though
	byte tutorialCard2 : "ed8_2_PC_US.exe", 0x769FB2;
	byte tutorialCard3 : "ed8_2_PC_US.exe", 0x76A0F2;
	byte tutorialCard4 : "ed8_2_PC_US.exe", 0x76A232; //there's 4 variables because the game seems to number the amount of cards in any one tutorial and then call upon this when they're on screen, rather than on one universal variable. 4 is the max amount of cards I've found yet in any one tutorial
	byte resultsCard : "ed8_2_PC_US.exe", 0x7F05CF; // I don't actually know what this address tracks, but it doesn't really matter. It seems to take a value between 15 and 25 when on a result card, and stays at 0 otherwise, which is what really matters in this case
	byte checkingQuests : "ed8_2_PC_US.exe", 0x7F057A; //0 when no quests on screen, 1 when seeing names, 2 when seeing quest description.
    byte orbmentHeal : "ed8_2_PC_US.exe", 0x005DCE4C, 0x8A8; 

	byte sceneLoadFlag : "ed8_2_PC_US.exe", 0x5A0CFF; //Made kinda useless by removing time based on black screens rather than actual loads, but that feels nicer user experience wise and it's easier to see when it fails. Added as a backup, since only fade outs seems to sometimes advance the timer by 0.07

	byte cutsceneFlag : "ed8_2_PC_US.exe", 0x665AFF;

	byte startHelper : "ed8_2_PC_US.exe" , 0x7F1F14;

	byte mainMenu : "ed8_2_PC_US.exe", 0x664D2A;
	
	//float selectingParty : "ed8_2_PC_US.exe", 0x24, 0xBC, 0x14, 0x3C, 0x820, 0x5C, 0x1B0, 0x1F4, 0x10, 0xD28;
	
	//Bosses' healths for splitting defined next
	
	//Prologue
	
	int OrtheimI : 0x00666840, 0x4, 0x40, 0x4C, 0xC4, 0x38, 0x30, 0x1A4, 0xAA0, 0x10, 0x520;
	int OrtheimII : 0x0067B7DC, 0x8, 0x14, 0x34, 0x270, 0x10, 0x28, 0x334, 0x4, 0x278, 0x280;
	int OrtheimMecha: 0x006681FC, 0x5A4, 0x334, 0x30, 0x2C, 0x14, 0x308, 0x640, 0x10, 0x10, 0x640;
	
	//Act 1 Part 1
	
	int Grunoja : 0x00769E5C, 0x50, 0x10, 0x10, 0x4C, 0x8, 0x24, 0x24, 0x278, 0xAA0, 0x2B0;
	int XenoI : 0x00667034, 0x50, 0x10, 0x34, 0x4, 0x30, 0x34, 0x8, 0x3C, 0x1C8, 0x280;
	int LeonidasI : 0x00667034, 0x50, 0x10, 0x34, 0x4, 0x4, 0x8, 0x48, 0x1C4, 0x1B4, 0xE60;
	//int sword_drakkhen_1_act1_1 : 0x006640B8, 0x4, 0x4, 0x9B8, 0x8EC, 0xB4, 0x38C, 0x14, 0x8, 0x0, 0x870; //honestly this is pretty useless since once you kill this guy it's a completely different fight instance but whatever
	int sword_drakkhen_2_act1_1 : 0x006640B8, 0x9B8, 0x4, 0xA8, 0x44, 0x28, 0x1B8, 0x308, 0x640, 0x10, 0x2B0;
	int gun_drakkhen_act1_1 : 0x00D38724, 0x24, 0x14, 0x60, 0x1C, 0x40, 0x10, 0x34, 0x1B4, 0x1B0, 0x1110;
	
	//Act 1 Part 2
	
	int Unsurtr : 0x00667014, 0x24, 0x40, 0x74, 0x4, 0xA8, 0x34, 0x750, 0x10, 0x40, 0x280;
	int BleublancI : 0x00667040, 0x50, 0x10, 0x5C, 0x28, 0x4, 0x4, 0x40, 0x10, 0x10, 0xA50;
	int AltinaI : 0x0066704C, 0x60, 0x24, 0x8, 0x18, 0x60, 0x1C, 0x34, 0x14, 0x38, 0x82C;
	int sword_drakkhen_act1_2 : 0x006640B8, 0x9B8, 0x4, 0xA8, 0x34, 0x8EC, 0xF0, 0x14, 0x8, 0x0, 0x630;
	int gun_drakkhen_act1_2 : 0x005DCE40, 0x10, 0x30, 0x2C, 0x8FC, 0xB8, 0x38C, 0x14, 0x8, 0x0, 0x800;
	int sword_spiegel_act1_2 : 0x006640B8, 0x9B8, 0x4, 0xA8, 0x44, 0x4, 0xE0, 0x1C, 0x10, 0x14, 0x9B0;
	
	//Act 1 Part 3

    int Zelvenom : 0x00666FF0, 0x48, 0x14, 0x278, 0x2C8, 0x14, 0x4, 0xE0, 0x2C, 0x14, 0x800;
    int Jusis : 0x00667000, 0x24, 0x1C, 0xFC, 0x5C, 0x4, 0x4, 0xA8, 0x1C, 0x28, 0x280;
    int McBurnI : 0x006679EC, 0x5D4, 0x4, 0xE8, 0x30, 0x2C, 0x30, 0x24, 0x8, 0xC4, 0x87C; //McBurn literally can't die so keeping track of Duvalie is pointless
    int hector_act1_3 : 0x006640C0, 0x28, 0x28, 0x14, 0x54, 0x18, 0x34, 0x9B8, 0x8EC, 0xB4, 0x77C;
    int tank_act1_3 : 0x006640C0, 0x2C, 0x28, 0x5C, 0x4C, 0x24, 0x38, 0x10, 0x2C, 0x9B8, 0x280;
    
    //Intermission
    
    int Rufus : 0x00666FF0, 0x48, 0x14, 0x4, 0x310, 0xCEC, 0x30, 0x10, 0x8, 0x820;
    int OrdineI : 0x005DCE40, 0x10, 0x24, 0x10, 0xF4, 0xA4, 0x0, 0x10, 0x2C, 0x9B8, 0x280;

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
	        settings.Add("act1Part1Mech", true, "Split the mech fight. Assumes you kill the right guy first (before the cutscene happens)", "act1_part1");
	        
	    settings.Add("act1_part2", true, "Autosplit during part 2", "act1_splitting");
	        settings.Add("unsurtr", true, "Split Unsurtr (Ice Dragon)", "act1_part2");
	        settings.Add("bleuAltina", true, "Split Bleublanc and Altina. Won't account for adds", "act1_part2");
	        settings.Add("act1Part2Mech", true, "Split the mech fight", "act1_part2");
	    
	    settings.Add("act1_part3", true, "Autosplit during part 3", "act1_splitting");
	        settings.Add("zelvenom", true, "Split Zelvenom", "act1_part3");
	        settings.Add("jusis", true, "Split Jusis", "act1_part3");
	        settings.Add("mcBurnI", true, "Split the McBurn/Duvalie fight", "act1_part3");
	        settings.Add("act1Part3Mech", true, "Split the mech fight", "act1_part3");
	
	settings.Add ("intermission_splitting", true, "Autosplit during intermission");
	    settings.Add("rufus", true, "Split Rufus", "intermission_splitting");
	    settings.Add("ordineI", true, "Split the Crow mech fight", "intermission_splitting");
	        
}

start {

	return current.cutsceneFlag != 0 && current.startHelper != 0;

}

split {

    return ( settings["ortheimI"] && current.OrtheimI == 0 && old.OrtheimI != 0 ||
             settings["ortheimII"] && current.OrtheimII == 0 && old.OrtheimII != 0 ||
             settings["ortheimMecha"] && current.OrtheimMecha == 0 && old.OrtheimMecha != 0 ||
             
             settings["grunoja"] && current.Grunoja == 0 && old.Grunoja != 0 ||
             settings["xenoLeoI"] && current.XenoI == 0 && current.LeonidasI == 0 && (old.XenoI != 0 || old.LeonidasI != 0) ||
             settings["act1Part1Mech"] && current.sword_drakkhen_2_act1_1 == 0 && current.gun_drakkhen_act1_1 == 0 && (old.sword_drakkhen_2_act1_1 != 0 || old.gun_drakkhen_act1_1 != 0) ||
             
             settings["unsurtr"] && current.Unsurtr == 0 && old.Unsurtr != 0 ||
             settings["bleuAltina"] && current.BleublancI == 0 && current.AltinaI == 0 && (old.BleublancI != 0 || old.AltinaI != 0) ||
             settings["act1Part2Mech"] && current.sword_drakkhen_act1_2 == 0 && current.sword_spiegel_act1_2 == 0 && current.gun_drakkhen_act1_2 == 0 && (old.sword_drakkhen_act1_2 != 0 || old.sword_spiegel_act1_2 != 0 || old.gun_drakkhen_act1_2 != 0) ||
             
             settings["zelvenom"] && current.Zelvenom == 0 && old.Zelvenom != 0 ||    
             settings["jusis"] && current.Jusis == 0 && old.Jusis != 0 ||        
             settings["mcBurnI"] && current.McBurnI == 0 && old.McBurnI != 0 || 
             settings["act1Part3Mech"] && current.hector_act1_3 == 0 && current.tank_act1_3 == 0 && (old.hector_act1_3 != 0 || old.tank_act1_3 != 0) ||
             
             settings["rufus"] && current.Rufus == 0 && old.Rufus != 0 ||
             settings["ordineI"] && current.OrdineI == 0 && old.OrdineI != 0 );  
                                 
}



isLoading {

	return( settings["load_removing"]        &&
		    current.loadingSavefile != 0     ||
		    current.sceneLoadFlag != 0       ||
		    settings["remove_cutscenes"] && current.cutsceneFlag != 0 && current.resultsCard == 0 ||
		    current.fadeToBlack == 03  && current.orbmentHeal != 3 && current.textOnScreen == 0 && current.checkingQuests == 0 && current.tutorialCard1 == 0 && current.tutorialCard2 == 0 && current.tutorialCard3 == 0 && current.tutorialCard4 == 0 && current.resultsCard == 0);
}
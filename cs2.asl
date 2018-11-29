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

	// byte sceneLoadFlag : "ed8_2_PC_US.exe", 0x5A0CFF; //Made kinda useless by removing time based on black screens rather than actual loads, but that feels nicer user experience wise and it's easier to see when it fails. Added as a backup, since only fade outs seems to sometimes advance the timer by 0.07

	byte cutsceneFlag : "ed8_2_PC_US.exe", 0x665AFF;

	byte startHelper : "ed8_2_PC_US.exe" , 0x7F1F14;

	byte mainMenu : "ed8_2_PC_US.exe", 0x664D2A;
	
	float selectingParty : "ed8_2_PC_US.exe", 0x24, 0xBC, 0x14, 0x3C, 0x820, 0x5C, 0x1B0, 0x1F4, 0x10, 0xD28;
	
	//Bosses health's for splitting defined next
	
	//Prologue
	
	int OrtheimI : 0x00666840, 0x4, 0x40, 0x4C, 0xC4, 0x38, 0x30, 0x1A4, 0xAA0, 0x10, 0x520;
	int OrtheimII : 0x0067B7DC, 0x8, 0x14, 0x34, 0x270, 0x10, 0x28, 0x334, 0x4, 0x278, 0x280;
	int OrtheimMecha: 0x006681FC, 0x5A4, 0x334, 0x30, 0x2C, 0x14, 0x308, 0x640, 0x10, 0x10, 0x640;
	
	//Act 1 Part 1
	
	int Grunoja : 0x00769E5C, 0x4, 0x18, 0xE0, 0x44, 0x1C, 0x14, 0x14, 0xE8, 0x32C, 0x5F0;
	int XenoI : 0x00667034, 0x50, 0x10, 0x34, 0x4, 0x4, 0x8, 0x2C, 0x14, 0x1E8, 0x280;
	int LeonidasI : 0x00667034, 0x50, 0x10, 0x34, 0x4, 0x4, 0x8, 0x24, 0x1C4, 0x1B4, 0xE60;
	


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
	        settings.Add("grunoja", false, "Split Grunoja", "act1_part1");
	        settings.Add("xenoLeoI", true, "Split on Xeno and Leo", "act1_part1");

}

start {

	return current.cutsceneFlag != 0 && current.startHelper != 0;

}

split {

    print ("Ortheim I is" + current.OrtheimI);
    print ("Ortheim II is" + current.OrtheimII);
    print ("MechaOrtheim is" + current.OrtheimMecha);
    print ("Grunoja is" + current.Grunoja);
    print ("Xeno is" + current.XenoI);
    print ("Leo is" + current.LeonidasI);
                    
    return ( settings["ortheimI"] && current.OrtheimI == 0 && old.OrtheimI != 0 ||
             settings["ortheimII"] && current.OrtheimII == 0 && old.OrtheimII != 0 ||
             settings["ortheimMecha"] && current.OrtheimMecha == 0 && old.OrtheimMecha != 0 ||
             
             settings["grunoja"] && current.Grunoja == 0 && old.Grunoja != 0 ||
             settings["xenoLeoI"] && current.XenoI == 0 && current.LeonidasI == 0 && (old.XenoI != 0 || old.LeonidasI != 0)
             
            );
}



isLoading {

	return( settings["load_removing"]    &&
		current.loadingSavefile != 0 ||
		//current.sceneLoadFlag != 0   ||
		settings["remove_cutscenes"] && current.cutsceneFlag != 0 && current.resultsCard == 0 ||
		current.fadeToBlack == 03  && current.textOnScreen == 0 && current.checkingQuests == 0 && current.tutorialCard1 == 0 && current.tutorialCard2 == 0 && current.tutorialCard3 == 0 && current.tutorialCard4 == 0 && current.resultsCard == 0);
}
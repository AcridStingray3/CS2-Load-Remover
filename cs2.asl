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

	byte sceneLoadFlag : "ed8_2_PC_US.exe", 0x5A0CFF; //Made kinda useless by removing time based on black screens rather than actual loads, but that feels nicer user experience wise and it's easier to see when it fails. Added as a backup, since only fade outs seems to sometimes advance the timer by 0.07

	byte cutsceneFlag : "ed8_2_PC_US.exe", 0x665AFF;

	byte startHelper : "ed8_2_PC_US.exe" , 0x7F1F14;

	byte mainMenu : "ed8_2_PC_US.exe", 0x664D2A;


}


startup {

	settings.Add("load_removing", true, "Enable load removing");
	settings.Add("remove_cutscenes", false, "Stop the timer during cutscenes too", "load_removing");

}


start {

	return current.cutsceneFlag != 0 && current.startHelper != 0;

}

reset { //there's no way this goes wrong right?

	return current.mainMenu == 54; 

}



isLoading {

	return( settings["load_removing"]    &&
		current.loadingSavefile != 0 ||
		current.sceneLoadFlag != 0   ||
		settings["remove_cutscenes"] && current.cutsceneFlag != 0 && current.resultsCard == 0 ||
		current.fadeToBlack == 03 && current.textOnScreen == 0 && current.checkingQuests == 0 && current.tutorialCard1 == 0 && current.tutorialCard2 == 0 && current.tutorialCard3 == 0 && current.tutorialCard4 == 0 && current.resultsCard == 0);
}
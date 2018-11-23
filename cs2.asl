state ("ed8_2_PC_US") {

byte loadingSavefile : "ed8_2_PC_US.exe", 0x7E471A;

byte fadeToBlack : "ed8_2_PC_US.exe", 0x6663B4; //this counts even with partial fades which means we need to define a couple extra things during which it won't pause: They're defined next without a line break
byte textOnScreen : "ed8_2_PC_US.exe", 0x769504; //not quite dialogue, it's all text. Can't seem to be able to find a "dialogue" flag.
byte tutorialCard1 : "ed8_2_PC_US.exe", 0x769E72;
byte tutorialCard2 : "ed8_2_PC_US.exe", 0x769FB2;
byte tutorialCard3 : "ed8_2_PC_US.exe", 0x76A0F2;
byte tutorialCard4 : "ed8_2_PC_US.exe", 0x76A232; //there's 4 variables because the game seems to number the amount of cards in any one tutorial and then call upon this when they're on screen, rather than on one universal variable. 4 is the max amount of cards I've found yet in any one tutorial

byte cutsceneFlagged : "ed8_2_PC_US.exe", 0x665AFF; //mostly here for the future, whenever I find the actual BGM loading variable

}


startup {

settings.Add("load_removing", true, "Enable load removing");
settings.Add("remove_cutscenes", false, "Stop the timer during cutscenes too", "load_removing");

}


start {

return current.cutsceneFlagged != 0;

}



isLoading {

return (settings["load_removing"] &&
	current.loadingSavefile != 0 ||
	settings["remove_cutscenes"] && current.cutsceneFlagged != 0 ||
	current.fadeToBlack == 03 && current.textOnScreen == 0 && current.tutorialCard1 == 0 && current.tutorialCard2 == 0 && current.tutorialCard3 == 0 && current.tutorialCard4 == 0); //TODO find BGM music load
}
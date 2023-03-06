global.fullscreen = false;

ini_open("Options");

global.fullscreen = ini_read_real("Selection Saves Slot", "Stuff to Save", true);

ini_close();
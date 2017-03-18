# EAB WHDLoad Games AGA Menu Package

## Description

EAB WHDLoad Games AGA Menu package contains menus for AGS2 and iGame with screenshots and details for all games currently available in English Board Amiga WHDLoad packs with update 2.6 applied. 

### AGS2

For AGS2 following features had been added in ".Settings" folder:

- Favourites mode: Add or remove games/demos to ".Favourites" folder in AGS2 menu.
- Music: Turn music on and off for AGS2 menus.
- WHDLoad Preload: Turn Preload option on or off.
- Settings: View and save settings for Favourites mode, Music and WHDLoad Preload.

Favourites mode can be set to the following:

- Add: Adds game or demo to favourites and returns to AGS2 menu
- Add & Run: Add game or demo to favourites and run it using WHDLoad.
- Remove: Queues game or demo to be removed from favourites and returns to AGS2 menu.
- Off: Default run game or demo using WHDLoad.

When turned on music a random .mod file is played while AGS2 menu is shown and will stop before running a game or demo. By default there aren't installed any music .mod files. They can be must copied to directory "DH1:Menu/AGS2Games/Music" (unless changed).

WHDLoad Preload option can be turned on and off depending on the Amiga hardware. By default WHDLoad Preload is turned on to improve performance and avoid screen flickering, when games or demos are loading data files. WHDLoad Preload can be turned off for Amiga's without fastmem or accelerators, so they can still run most WHDLoad games and demos.

To preserve settings between reboots, use "Save settings" to write settings to harddisk.

### Configure menus

A configure menus script is installed to DH0:Programs/Configuration to assist with following AGS2 actions:

- Add: Add a game or demo to AGS2 menu.
- Rename: Rename a game or demo in AGS2 menu.
- Delete: Delete a game or demo from AGS2 menu.
- Show Existing: Show only AGS2 menu items for games or demos, they are installed.
- Show All: Show all AGS2 menu items for games or demos.
- Hide All: Hide all AGS2 menu items for games or demos.

**Add**

**Rename**

**Delete**

**Show existing**

Show existing iterates through all .run and .ru_ files in DH1:Menu/AGS2Games or DH1:Menu/AGS2Demos and check if it's "RunFile" exists. 
This is typically a full path to WHDLoad slave like "A-Games:B/BubbleBobble/BubbleBobble.Slave" for the game Bubble Bobble. 
Since .run files are AmigaDOS scripts the "RunFile" is added as a comment, so it doesn't disturb the script.
Here an example what the "RunFile" looks like in a .run script.
###
    ;RunFile=A-Games:B/BubbleBobble/BubbleBobble.Slave 

The existence of the "RunFile" will determine if the AGS2 menu item is shown or hidden.
If the "RunFile" doesn't exist, then the AGS2 menu item is renamed from .run to .ru_ to hide it from AGS2 menu.
Vice versa if the "RunFile" exist, then the AGS2 menu item is renamed from .ru_ to .run to show it in AGS2 menu. 

**Show all**

Show all iterates through all .ru_ files in DH1:Menu/AGS2Games or DH1:Menu/AGS2Demos and renames .ru_ files to .run to show them in AGS2 menu. 

**Hide all**

Hide all iterates through all .run files in DH1:Menu/AGS2Games or DH1:Menu/AGS2Demos and renames .run files to .ru_ to hide them from AGS2 menu. 

## Requirements

EAB WHDLoad Games AGA Menu Package requires following applications and libraries are installed:
- MUI: Install MUI from http://aminet.net/util/libs/mui38usr.lha.
- GuigFX MCC for MUI: Install "guigfx.mcc" from http://aminet.net/dev/mui/MCC_Guigfx.lha.
- TextEditor MCC for MUI: Install "TextEditor.mcc" from http://aminet.net/dev/mui/MCC_TextEditor-15.47.lha or http://aminet.net/dev/mui/MCC_TextEditor_68k.lha depending on CPU is 68000 or better.
- Render Library: Install "render.library" from http://aminet.net/dev/misc/renderlib31.lha.
- GuigFX Library: Install "guigfx.library" from http://aminet.net/dev/misc/guigfxlib.lha or http://aminet.net/dev/misc/guigfxlib_nofpu.lha depending FPU is installed.
- WHDLoad: Install WHDLoad from http://whdload.de/whdload/WHDLoad_usr.lha.
- Soft-kicker: Install Soft-kicker from http://aminet.net/util/boot/skick346.lha.
- Kickstart roms for WHDLoad: Use Kickstart roms from Cloanto Amiga Forever or own dumps.

These applications and libraries are already installed, if HstWB or ClassicWB FULL, ADV, ADVSP package is installed using HstWB Installer.

HstWB Installer can automatically identify and install Kickstart roms for WHDLoad. See more details [here](https://github.com/henrikstengaard/hstwb-installer).

For manual installation without HstWB or ClassicWB, use following guides:
- Install MUI: http://guide.abime.net/wb3.1/chap6.htm
- Install iGame, libraries, SKick, WHDLoad and Kickstart roms: http://www.awmosoft.nl/downloads/igame.pdf

## Installation

Download latest release [here](../../releases) and copy it to HstWB Installer "packages" directory, which typically is "c:\Program Files (x86)\HstWB Installer\Packages".

## Screenshots

### AGS2

Examples of browsing games in AGS2:

![ags21.png](screenshots/ags21.png?raw=true)

![ags22.png](screenshots/ags22.png?raw=true)

### iGame

Examples of browsing games in iGame:

![igame1.png](screenshots/igame1.png?raw=true)

![igame2.png](screenshots/igame2.png?raw=true)

### Using HstWB 

Open system and games drawer.

![hstwb1.png](screenshots/hstwb1.png?raw=true)

Start either AGS2 or iGame.

![hstwb2.png](screenshots/hstwb2.png?raw=true)

---

![hstwb3.png](screenshots/hstwb3.png?raw=true)

![hstwb4.png](screenshots/hstwb4.png?raw=true)

### ClassicWB

Open system and games drawer.

![classicwb1.png](screenshots/classicwb1.png?raw=true)

Start either AGS2 or iGame.

![classicwb2.png](screenshots/classicwb2.png?raw=true)

---

![classicwb3.png](screenshots/classicwb3.png?raw=true)

![classicwb4.png](screenshots/classicwb4.png?raw=true)

### Workbench

Open system and games drawer.

![workbench1.png](screenshots/workbench1.png?raw=true)

Start either AGS2 or iGame.

![workbench2.png](screenshots/workbench2.png?raw=true)

---

![workbench3.png](screenshots/workbench3.png?raw=true)

![workbench4.png](screenshots/workbench4.png?raw=true)

### WHDLoad games

![dopus_whdload_games.png](screenshots/dopus_whdload_games.png?raw=true)

### Music for AGS2

![dopus_ags2games_music.png](screenshots/dopus_ags2games_music.png?raw=true)
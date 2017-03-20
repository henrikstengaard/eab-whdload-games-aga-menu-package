# EAB WHDLoad Games AGA Menu Package

## Description

EAB WHDLoad Games AGA Menu package contains menus for AGS2 and iGame with screenshots and details for all games currently available in English Board Amiga WHDLoad packs with update 2.6 applied. 

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

## AGS2

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

## Configure menus

A configure menus script is installed to DH0:Programs/Configuration to assist with following AGS2 actions:

- Add: Add a game or demo to AGS2 menu.
- Rename: Rename a game or demo in AGS2 menu.
- Delete: Delete a game or demo from AGS2 menu.
- Show Existing: Show only AGS2 menu items for games or demos, they are installed.
- Show All: Show all AGS2 menu items for games or demos.
- Hide All: Hide all AGS2 menu items for games or demos.

### Add

Add action adds a game or demo to AGS2 menu. It supports hstwbmenuitem.data, WHDLoad slave or any executable file.

Configure menus will present a file selection dialog to select file or a game or demo to add.
To determine how the selected file will be added, it's will be defined in the following order:

1. HstWB menu item: If filename is "hstwbmenuitem.data".
2. WHDLoad slave: If filename ends with ".slave".
3. Start run file: If filename doesn't match any of the above.

**Note: Using hstwbmenuitem.data gives most flexibility as it allows custom run script to start a game or demo.**

A AGS2 .run file is created by following parts:

1. S:AGS2RunPreTemplate template: A script template executed before run script for selected file.

2. Run script for selected file:
    1. For a filename of type HstWB menu item, hstwbmenuitem.run will be used it as run script.
    2. For a filename of type WHDLoad slave, S:AGS2WHDLoadRunTemplate template will be used to build a run script for WHDLoad slave.
    3. For a filename of type start run file, a simple run script is build to run the selected file.

3. S:AGS2RunPostTemplate template: A script template executed after run script for selected file.

Configure menus will check if selected file has .iff and .txt next to it. Iff file will be used for screenshot shown in AGS2 menu. For AGA screenshots, the iff file must be an 8-bit image with a max of 200 colors. For OCS screenshots, the iff file must be 4-bit with a maximum of 12 colors. Txt file will be used for details shown in AGS2 menu.

Example of files used, when adding the game Bubble Bobble using hstwbmenuitem.data file:

- hstwbmenuitem.data: Run file and ags2 name parameters is used from this file.
- hstwbmenuitem.run: Run script to start Bubble Bobble from AGS2 menu.
- hstwbmenuitem.iff: Screenshot for AGS2 menu.
- hstwbmenuitem.txt: Details for AGS2 menu.

Example of files used, when adding the game Bubble Bobble selecting WHDLoad slave file "BubbleBobble.Slave":

- BubbleBobble.Slave: WHDLoad slave to start Bubble Bobble from AGS2 menu. S:AGS2WHDLoadRunTemplate template will be used to build a run script that starts Bubble Bobble using WHDLoad.
- BubbleBobble.iff: Screenshot for AGS2 menu.
- BubbleBobble.txt: Details for AGS2 menu.

Example of files used, when adding the game Sim City 2000 selecting it's executable file "SimCity2000":

- SimCity2000: Executable for starting Sim City 2000 from AGS2 menu. A simple run script is build to run SimCity2000.
- SimCity2000.iff: Screenshot for AGS2 menu.
- SimCity2000.txt: Details for AGS2 menu.

Example hstwbmenuitem.data for Bubble Bobble:
###
    ;HstWB menu item data
    Name=Bubble Bobble
    RunFile=BubbleBobble.Slave
    AGS2Name=Bubble Bobble
    iGameName=Bubble Bobble

The templates contain placeholders which will be replaced, when building run script for AGS2 menu. Following placeholders are used in the templates below:

- [$RunFile]: Full path to run file, which is usually the selected file.
- [$AGS2IndexName]: Index name for AGS2 menu and is the first character of entered AGS2 name.
- [$AGS2Name]: Entered AGS2 name.
- [$RunDir]: Path to directory containing run file.
- [$RunFileName]: Filename of run file without path.

S:AGS2RunPreTemplate template:
###
    ; HstWB Menu Item Run script for AGS2
    ; -----------------------------------
    ;RunFile=[$RunFile]

    ; Favourites Mode
    IF EXISTS ENV:ags2favouritesmode
      execute S:AGS2Favourites "[$AGS2IndexName]" "[$AGS2Name]"
      IF $ags2favouritesmode EQ "add"
        SKIP end
      ENDIF
      IF $ags2favouritesmode EQ "remove"
        SKIP end
      ENDIF
    ENDIF

    ; Start AGS2 Run Pre Script, if it exists
    IF EXISTS S:AGS2RunPre
      execute S:AGS2RunPre
    ENDIF

S:AGS2RunPostTemplate template:
###
    ; Start AGS2 Run Post Script, if it exists
    IF EXISTS S:AGS2RunPost
      execute S:AGS2RunPost
    ENDIF

    ; End
    LAB end

S:AGS2WhdloadRunTemplate template:
###
    ; Whdload
    cd "[$RunDir]"
    IF EXISTS ENV:whdloadargs
      whdload "[$RunFileName]" $whdloadargs
    ELSE
      whdload "[$RunFileName]"
    ENDIF

### Rename

Rename action renames a game or demo in AGS2 menu.

Configure menus will present lists to select the game or demo to delete. 
First selecting 0-Z index and the game or demo within that index to rename.
Finally a dialog is presented to enter new name for the selected game or demo. 

### Delete

Delete action deletes a game or demo from AGS2 menu. It doesn't delete the game or demo itself, it's only deleted from AGS2 menu.

Configure menus will present lists to select the game or demo to delete. 
First selecting 0-Z index and the game or demo within that index to delete.
Finally a dialog is presented to confirm deleting the selected game or demo. 

### Show existing

Show existing action updates AGS2 menu, so only installed games or demos are shown. Games or demos that aren't installed are hidden.
This can be used each time games or demos are installed or deleted to update AGS2 menu.

**Note that configure menus will quit, when done updating AGS2 menu due to limitation of AmigaDOS scripts executing other scripts.**

Configure menus iterates through all .run and .ru_ files in DH1:Menu/AGS2Games or DH1:Menu/AGS2Demos and check if it's "RunFile" exists. 
This is typically a full path to WHDLoad slave like "A-Games:B/BubbleBobble/BubbleBobble.Slave" for the game Bubble Bobble. 
Since .run files are AmigaDOS scripts the "RunFile" is added as a comment, so it doesn't disturb the script.
Here an example what the "RunFile" looks like in a .run script.
###
    ;RunFile=A-Games:B/BubbleBobble/BubbleBobble.Slave 

The existence of the "RunFile" will determine if the AGS2 menu item is shown or hidden.
If the "RunFile" doesn't exist, then the AGS2 menu item is renamed from .run to .ru_ to hide it from AGS2 menu.
Vice versa if the "RunFile" exist, then the AGS2 menu item is renamed from .ru_ to .run to show it in AGS2 menu. 

### Show all

Show all action updates AGS2 menu to show all games or demos regardless of them being installed or not.

**Note that configure menus will quit, when done updating AGS2 menu due to limitation of AmigaDOS scripts executing other scripts.**

Configure menus iterates through all .ru_ files in DH1:Menu/AGS2Games or DH1:Menu/AGS2Demos and renames .ru_ files to .run to show them in AGS2 menu. 

### Hide all

Hide all action updates AGS2 menu to hide all games or demos regardless of them being installed or not.

**Note that configure menus will quit, when done updating AGS2 menu due to limitation of AmigaDOS scripts executing other scripts.**

Configure menus iterates through all .run files in DH1:Menu/AGS2Games or DH1:Menu/AGS2Demos and renames .run files to .ru_ to hide them from AGS2 menu. 

## Screenshots

### AGS2

Screenshots of browsing games in AGS2:

![ags21.png](screenshots/ags21.png?raw=true)

![ags22.png](screenshots/ags22.png?raw=true)

### iGame

Screenshots of browsing games in iGame:

![igame1.png](screenshots/igame1.png?raw=true)

![igame2.png](screenshots/igame2.png?raw=true)

### HstWB installation

Screenshots of HstWB with AGS2 Games and iGame installed in System, Games drawer.

![hstwb1.png](screenshots/hstwb1.png?raw=true)

![hstwb2.png](screenshots/hstwb2.png?raw=true)

Screenshots of HstWB with configure menus installed in System, Programs, Configuration drawer.

![hstwb3.png](screenshots/hstwb3.png?raw=true)

![hstwb4.png](screenshots/hstwb4.png?raw=true)

### ClassicWB installation

Screenshots of ClassicWB with AGS2 Games and iGame installed in System, Games drawer.

![classicwb1.png](screenshots/classicwb1.png?raw=true)

![classicwb2.png](screenshots/classicwb2.png?raw=true)

Screenshots of ClassicWB with configure menus installed in System, Programs, Configuration drawer.

![classicwb3.png](screenshots/classicwb3.png?raw=true)

![classicwb4.png](screenshots/classicwb4.png?raw=true)

### Workbench installation

Screenshots of Workbench with AGS2 Games and iGame installed in System, Games drawer.

![workbench1.png](screenshots/workbench1.png?raw=true)

![workbench2.png](screenshots/workbench2.png?raw=true)

Screenshots of Workbench with configure menus installed in System, Programs, Configuration drawer.

![workbench3.png](screenshots/workbench3.png?raw=true)

![workbench4.png](screenshots/workbench4.png?raw=true)

### Configure Menus

Screenshots of configure menus.

![configure_menus1.png](screenshots/configure_menus1.png?raw=true)

![configure_menus2.png](screenshots/configure_menus2.png?raw=true)

![configure_menus3.png](screenshots/configure_menus3.png?raw=true)

![configure_menus4.png](screenshots/configure_menus4.png?raw=true)

![configure_menus5.png](screenshots/configure_menus5.png?raw=true)

![configure_menus6.png](screenshots/configure_menus6.png?raw=true)

![configure_menus7.png](screenshots/configure_menus7.png?raw=true)

![configure_menus8.png](screenshots/configure_menus8.png?raw=true)

![configure_menus9.png](screenshots/configure_menus9.png?raw=true)

### WHDLoad games

Screenshot of Directory Opus with left panel at DH1:WHDLoad/Games and right panel at PC: (added through WinUAE) ready for copying WHDLoad games from PC to WHDLoad games drawer.

![dopus_whdload_games.png](screenshots/dopus_whdload_games.png?raw=true)

### Music for AGS2

Screenshot of Directory Opus with left panel at DH1:Menu/AGS2Games/Music and right panel at PC: (added through WinUAE) ready for copying mod music files from PC to AGS2 games menu.

![dopus_ags2games_music.png](screenshots/dopus_ags2games_music.png?raw=true)
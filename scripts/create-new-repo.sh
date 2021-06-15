FOLDER=$(zenity --forms --add-entry=repo-folder-name)
cd ~/SM64LBuilder/scripts
/bin/echo -e "cd ~/SM64LBuilder/repos \ngit clone $(zenity --forms --add-entry=Github-Clone-Link) \necho \"Please select your baserom\" \ncp \$(zenity --file-selection --file-filter='z64 ROMS (z64) | *.z64' --title=\"Select your baserom ROM\") $FOLDER \ncd $FOLDER \necho \"Would you like patches? [y/n]\" \nread answer \nif [ \$answer = \"y\" ]; then \necho \"How many?\" \nfor i in {1..\$number}; do echo \"Chose a file\" && git apply \$(zenity --file-selection --file-filter='patch files (patch) | *.patch' --title=\"Select your patch file\"); done \nfi \necho \"Starting compilation of $FOLDER...\" \nIN=\$(zenity --list --checklist --title \"Build Flags\" --text \"Flags\" --column \"\" --column \"Options\" True VERSION=us False VERSION=eu False VERSION=jp False VERSION=sh False TARGET_BITS=32 True TARGET_BITS=64 False TARGET_RPI=1 False TARGET_WEB=1 False WINDOWS_BUILD=1 False OSX_BUILD=1 WINDOWS_CONSOLE=1 DEBUG=1 BETTERCAMERA=1 NODRAWINGDISTANCE=1 TEXTURE_FIX=1 EXT_OPTIONS_MENU=1 EXTERNAL_DATA=1 DISCORDRPC=1 TEXTSAVES=1) \nif [ \$1 == \"--jobs\" ]; then \nmake \$(echo \$IN | tr \"|\" \" \") \$2 \nelse \nmake \$(echo \$IN | tr \"|\" \" \") \nfi \necho \"$FOLDER compiled!\"" >> $(zenity --forms --add-entry=script-name).sh

#!/bin/sh
# Are we running with arguments?
if [ -z "$2" ]
	then
		RUNNING_ARGUMENTS=false
	else
		RUNNING_ARGUMENTS=true
fi
# Do we have dialog installed?
DIALOG_INSTALLED=true
command -v dialog >/dev/null 2>&1 || {
    DIALOG_INSTALLED=false
}


_dialogWelcome () {
    # Display the welcome message (Information)
    dialog --title "Welcome to Drifter" \
    --msgbox "\ndrifter is a set of scripts and
other tools that will assist you in creating a virtual infrastructure of
development environments." 0 0
    _dialogMainMenu
}

_dialogMainMenu () {
    # Display the main menu (Menu)

    DIALOG=${DIALOG=dialog}

    tempfile=`tempfile 2>/dev/null` || tempfile=/tmp/test$$

    trap "rm -f $tempfile" 0 1 2 5 15

    $DIALOG --clear --title "Main Menu" \
            --menu "Please choose an option:" 0 0 0 \
            OS "Choose your OS" \
            Count "Set how many servers" \
            Packs "Configure server packs" \
            Network "Setup Network" \
            Exit "Exit drifter" 2> $tempfile

    retval=$?

    choice=`cat $tempfile`

    case $retval in
      0)
        if [ $choice=OS ]
            then
                _dialogChooseOS
        fi
        if [ $choice=Count ]
            then
                _dialogChooseCount
        fi;;
      1)
        echo "Cancel pressed.";;
      255)
        echo "ESC pressed.";;
    esac
}

_dialogChooseOS () {
    # Display the main menu (Menu)

    DIALOG=${DIALOG=dialog}

    tempfile=`tempfile 2>/dev/null` || tempfile=/tmp/test$$

    trap "rm -f $tempfile" 0 1 2 5 15

    $DIALOG --clear --title "Main Menu" \
            --menu "Please choose an option:" 0 0 0 \
            Precise "Ubuntu 12.04 LTS" \
            Quantal "Ubuntu 12.10" \
            Raring "Ubuntu 13.04" 2> $tempfile

    retval=$?

    choice=`cat $tempfile`

    case $retval in
      0)
        echo "You chose $choice as your OS"
        _dialogMainMenu;;
      1)
        _quit;;
      255)
        _dialogMainMenu;;
    esac
}

_dialogChooseCount () {
    #!/bin/sh
    DIALOG=${DIALOG=dialog}
    tempfile=`tempfile 2>/dev/null` || tempfile=/tmp/test$$
    trap "rm -f $tempfile" 0 1 2 5 15

    $DIALOG --title "How many servers do you need?" --clear \
            --inputbox "Please enter the number of servers to be set up" 16 51 2> $tempfile

    retval=$?

    case $retval in
      0)
        echo "Input string is `cat $tempfile`";;
      1)
        echo "Cancel pressed.";;
      255)
        if test -s $tempfile ; then
          cat $tempfile
        else
          echo "ESC pressed."
        fi
        ;;
    esac
}

_checkDialog () {
    if [ DIALOG_INSTALLED=false ]
        then
            read -p "Dialog is not installed would you like us to do this for you?" -n 1 -r
            echo    # (optional) move to a new line
            if [[ $REPLY =~ ^[Yy]$ ]]
            then
                sudo apt-get install dialog
                clear
            fi
    fi
}

_quit () {
    clear
    exit
}

if [ RUNNING_ARGUMENTS=false ]
    then
        echo "Checking if dialog is installed."
        _checkDialog
        _dialogWelcome
fi
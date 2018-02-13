#!/bin/bash

#
# Ask for password hint
#
echo "We need to run as sudo to get access to the loginwindow hook, please enter your login password:"
#
# Check for Hook
#
sudo defaults read com.apple.loginwindow LogoutHook 2> /dev/null
if [[ $? -eq 0 ]]; then
  echo "There is allready a logout hook installed please check manualy"
  exit -1
fi

#
# create bin and script
#
mkdir -p ~/bin

if [ -f ~/bin/mute-mac.sh ]; then
  echo "There is allready a script with the name mute-mac.sh"
  exit -2
fi

cat <<EOF > ~/bin/mute-mac.sh
#!/bin/bash
osascript -e 'set volume with output muted'
EOF
chmod u+x ~/bin/mute-mac.sh

sudo defaults write com.apple.loginwindow LogoutHook ~/bin/mute-mac.sh
if [[ $? -eq 0 ]]; then
  echo "Installation successfull"
else
  echo "Installation failed"
fi

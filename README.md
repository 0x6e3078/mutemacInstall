# Mute my Mac on Logout

Install a short shell script which always mute the Mac on logout via LogoutHook

## Installation

To install the hook please run:

```bash
sh -c "`curl -fsSL https://raw.githubusercontent.com/0x6e3078/mutemacInstall/master/installMuteMac.sh`"
```

## Uninstall

to uninstall run the following commmands

```bash
sudo defaults delete com.apple.loginwindow LogoutHook
rm -rf ~/bin/mute-mac.sh
```

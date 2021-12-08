  #___________  _   _   _    ____    _    ____  ________
 #/ / / / / _ \| | | | / \  / ___|  / \  |  _ \ \ \ \ \ \
#/ / / / / | | | | | |/ _ \ \___ \ / _ \ | |_) | \ \ \ \ \
#\ \ \ \ \ |_| | |_| / ___ \ ___) / ___ \|  _ <  / / / / /
 #\_\_\_\_\__\_\\___/_/   \_\____/_/   \_\_| \_\/_/_/_/_/

# This is a script to temporarily disable Authy's SSH 2FA program so that you can log in to
# A GUI text editor that supports SSH but does not support logging in with 2FA. Please note that
# You must run the script with sudo and that your SSH server will me temprarily less secure for 1 minute
# If you want the insecurity to be shorter, please change the value after "sleep" in line 18. Please make
# sure you are using the latest SSH security measures like encryption keys, protocol 2, and strict mode.
# MrQuasar173 or anyone else who distributes this script or another version of it is not responsible for 
# any attacks that your computer incurs while the script is running. Enough of the long-winded intro, lets get 
# on to the script!

sudo authy-ssh uninstall # Doesn't actually uninstall, just disables
sudo systemctl restart sshd
echo "open editor NOW"
sleep 60
sudo authy-ssh install # Re-enables authy-ssh with the same users as when it was enabled
sudo systemctl restart sshd


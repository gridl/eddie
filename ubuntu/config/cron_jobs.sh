# test
*/1 * * * * echo 'adf' >> /tmp/cron.txt


# update git repos
*/1 * * * * cd /home/chillaranand/projects/01/ && git pull && git push


# protect from netcut
# @reboot sudo arpon -o -D
# @reboot sudo usbmuxd -v --user usbmux --udev
@reboot ~/.01/ubuntu/bin/space2ctrl.sh

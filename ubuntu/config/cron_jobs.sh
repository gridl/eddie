# test
*/1 * * * *    echo 'adf' >> /tmp/cron.txt


# update git repos
# */1 * * * * cd /home/chillaranand/projects/01/ && git pull && git push


# protect from netcut
# @reboot sudo arpon -o -D
# @reboot sudo usbmuxd -v --user usbmux --udev
# @reboot ~/.01/ubuntu/bin/space2ctrl.sh


# Collect measurements at 1-minute intervals
*/1 * * * *    /usr/lib/sysstat/sa1

# Create daily reports and purge old files
0 0 * * *      /usr/lib/sysstat/sa2 -A

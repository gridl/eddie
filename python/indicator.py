#! /usr/bin/python

import shlex
import subprocess


def run_shell_command(cmd):
    out = subprocess.check_output(shlex.split(cmd))
    return out.decode('utf-8')


def get_wifi_name():
    try:
        cmd = 'nmcli dev wifi'
        out = run_shell_command(cmd)
        out = out.split('\n')[1:]
        network = next((i for i in out if '*' in i))
        network = network.split()[1]
        wifi_name = network
    except:
        wifi_name = 'No connection'

    return wifi_name


def get_network_status():
    try:
        cmd = 'ping 8.8.8.8 -c 1'
        out = run_shell_command(cmd)
        if 'Unreachable' not in out:
            status = 'Online'
        else:
            status = 'Offline'
    except:
        status = 'Offline'

    return status


wifi_name = get_wifi_name()
network_status = get_network_status()

text = '{} - {}'.format(wifi_name, network_status)
print(text)

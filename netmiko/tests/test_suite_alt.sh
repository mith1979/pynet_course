#!/bin/sh

RETURN_CODE=0

# Exit on the first test failure and set RETURN_CODE = 1
echo "Starting tests...good luck:" \
&& echo "Cisco IOS" \
&& py.test -v test_netmiko_show.py --test_device cisco881 \
&& py.test -v test_netmiko_config.py --test_device cisco881 \
\
&& echo "Arista" \
&& py.test -v test_netmiko_show.py --test_device arista_sw4 \
&& py.test -v test_netmiko_config.py --test_device arista_sw4 \
\
&& echo "HP ProCurve" \
&& py.test -v test_netmiko_show.py --test_device hp_procurve \
&& py.test -v test_netmiko_config.py --test_device hp_procurve \
\
&& echo "Juniper" \
&& py.test -v test_netmiko_show.py --test_device juniper_srx \
&& py.test -v test_netmiko_config.py --test_device juniper_srx \
&& py.test -v test_netmiko_commit.py --test_device juniper_srx \
\
&& echo "Cisco IOS-XR" \
&& py.test -v test_netmiko_show.py --test_device cisco_xrv \
&& py.test -v test_netmiko_config.py --test_device cisco_xrv \
&& py.test -v test_netmiko_commit.py --test_device cisco_xrv \
\
&& echo "Cisco ASA" \
&& py.test -v test_netmiko_show.py --test_device cisco_asa \
&& py.test -v test_netmiko_config.py --test_device cisco_asa \
|| RETURN_CODE=1

exit $RETURN_CODE

# Waveshare_4G_HAT_scripts

Set of scripts for using waveshare SIM7600E 
https://www.waveshare.com/wiki/SIM7600E-H_4G_HAT



added to the /etc/rc.local the following line

      sh /home/pi/sim7600_4G_hat_init

The current rc.local file is:

        #!/bin/bash
        #
        # rc.local
        #
        # This script is executed at the end of each multiuser runlevel.
        # Make sure that the script will "exit 0" on success or any other
        # value on error.
        #
        # In order to enable or disable this script just change the execution
        # bits.
        #
        # By default this script does nothing.

        # Print the IP address
        _IP=$(hostname -I) || true
        if [ "$_IP" ]; then
          printf "My IP address is %s\n" "$_IP"
        fi

        /opt/create-proxy.sh &
        sh /home/pi/sim7600_4G_hat_init
        exit 0

#!/bin/bash

sudo apt install libpam-u2f
pamu2fcfg | sudo tee -a /etc/u2f_mappings

# (At this point, press the button. You should see a long string of numbers.
# If you don't, make sure you have `udev` setup correctly.)

sudo cp /etc/pam.d/common-auth /etc/pam.d/common-auth.bkp
awk '{
    print;
    if ($0 == "" && !found_empty) {
        print "auth sufficient pam_u2f.so authfile=/etc/u2f_mappings cue";
        print "";
        found_empty = 1;
    }
}' /etc/pam.d/common-auth.bkp | sudo tee /etc/pam.d/common-auth > /dev/null

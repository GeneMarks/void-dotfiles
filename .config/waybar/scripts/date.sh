#!/bin/bash

date +"%a. %B $(date +%-d)$(case $(date +%-d) in 1|21|31) echo 'st' ;; 2|22) echo 'nd' ;; 3|23) echo 'rd' ;; *) echo 'th' ;; esac), %Y"

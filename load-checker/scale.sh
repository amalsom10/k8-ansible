#!/bin/bash
echo -e "Increasing the load on pods in stage and prod\n"
while true; do curl http://staging-guestbook.mstakx.io ; curl http://guestbook.mstakx.io ;  done
      

# Create AMI with pre-installed Promtail

We have create a new AMI to run **Web Server**, with *Promtail deoman* pre installed.
This AMI should use in **Launch Template** and that *Launch Template* can be used in the **Auto Scale Group** to start new *Web Server*.
During the *Web Server* start with *Auto Scaling Group*, *Launch Template* should be configured *(add userdata)* to strat *promtail* deomen (    systemctl start promtail.service  )
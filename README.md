// ec2_api_tools

put ec2-api-tools folder into /opt

// shutdown instances listed in the inst_list_us-east files
// via crontab job at 20:00 everyday.
0 20 * * * /opt/ec2-api-tools/launcher.sh us-east stop

// command-line usage:
./launcher.sh us-east|eu stop|start [instance_id]

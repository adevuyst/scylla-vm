#!/bin/bash
set -e

# Setting up Scylla
echo "Setting up Scylla"
printf 'YES\nYES\nYES\nYES\nno\nYES\nno\nYES\nYES\nYES\nYES\n' | sudo scylla_setup
#expect "Do you want to run check your kernel version?
#        Yes - runs a  script to verify that the kernel for this instance qualifies to run Scylla. No - skips the kernel check."
#send "YES"
#expect "Do you want to verify the ScyllaDB packages are installed?
#        Yes - runs a script to confirm that ScyllaDB is installed. No - skips the installation check."
#send "YES"
#expect "Do you want the Scylla server service to automatically start when the Scylla node boots?
#        Yes - Scylla server service automatically starts on Scylla node boot. No - skips this step. Note you will have to start the Scylla Server service manually."
#send "YES"
#expect "Do you want to setup Network Time Protocol(NTP) to auto-synchronize the current time on the node?
#        Yes - enables time-synchronization. This keeps the correct time on the node. No - skips this step."
#send "YES"
#expect "Do you want to setup RAID0 and XFS?
#        It is recommended to use RAID0 and XFS for Scylla data. If you select yes, you will be prompted to choose the unmounted disks to use for Scylla data. Selected disks are formatted as part of the process.
#        Yes - choose a disk/disks to format and setup for RAID0 and XFS. No - skip this step."
#send "no"
#expect "Do you want to enable coredumps?
#        Yes - sets up coredump to allow a post-mortem analysis of the Scylla state just prior to a crash. No - skips this step."
#send "YES"
#expect "Do you want to setup a system-wide customized configuration for Scylla?
#        Yes - setup the sysconfig file. No - skips this step."
#send "no"
#expect "Do you want iotune to study your disks IO profile and adapt Scylla to it?
#        Yes - let iotune study my disk(s). Note that this action will take a few minutes. No - skip this step."
#send "YES"
#expect "Do you want to install node exporter to export Prometheus data from the node? Note that the Scylla monitoring stack uses this data
#        Yes - install node exporter. No - skip this  step."
#send "YES"
#expect "o you want to set the CPU scaling governor to Performance level on boot?
#        Yes - sets the CPU scaling governor to performance level. No - skip this step."
#send "YES"
#expect "Do you want to enable fstrim service?
#        Yes - runs fstrim on your SSD. No - skip this step."
#send "YES"
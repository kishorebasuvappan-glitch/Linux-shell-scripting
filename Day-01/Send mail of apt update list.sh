#!/bin/bash

DATE=$(date +"%d/%m/%Y")
START_TIME="05:00 AM"
END_TIME="09:00 AM"
DURATION="4 hours"

CSV_FILE="/tmp/apt_update_$(date +%Y%m%d).csv"

# Create CSV
echo "Status,Repository,Details" > "$CSV_FILE"

apt-get update 2>&1 | awk '{print $1","$2","$3}' >> "$CSV_FILE"


# Email body with dynamic date
BODY="
This is advance notification that a maintenance window has been scheduled for the Unix/Linux Production environment.

The full list of systems in scope is in the attached spreadsheet. Additionally, there is an excel for each of the VMs containing the list of patches that are expected to be applied.

Maintenance window

Date: $DATE
Start: $START_TIME
End: $END_TIME
Estimated duration: $DURATION

Please expect a brief outage during the maintenance window as it is a full patching session and the systems will be rebooted after the patches are applied.

We plan to perform the maintenance outside business hours to reduce the outage caused.

If you have any concerns, or need to reschedule, please contact the team.
"


echo "$BODY" | mailx \
-s "Demo Production Maintenance Notification - $DATE" \
-a "$CSV_FILE" \
kbasuvappan@gmail.com

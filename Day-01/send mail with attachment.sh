#!/bin/bash

# ==============================
# Variables
# ==============================

DATE=$(date +"%d/%m/%Y")
CSV_FILE="/workspaces/Linux-shell-scripting/Day-01/apt_update_$(date +"%Y%m%d").csv"

TO="kbasuvappan@gmail.com"
SUBJECT="Production Maintenance Notification - $DATE"


# ==============================
# Run apt update and create CSV
# ==============================

echo "Status,Repository,Details" > "$CSV_FILE"

apt update 2>&1 | awk '
{
    print $1","$2","$3
}
' >> "$CSV_FILE"


# ==============================
# Check CSV file
# ==============================

if [ ! -f "$CSV_FILE" ]; then
    echo "CSV file creation failed"
    exit 1
fi


# ==============================
# Email body
# ==============================

BODY="
This is advance notification that a maintenance window has been scheduled for the Production environment.

The full list of systems in scope is in the attached spreadsheet. Additionally, there is an excel for each of the VMs containing the list of patches that are expected to be applied.

Maintenance window

Date: $DATE
Start: 05:00 AM
End: 09:00 AM
Estimated duration: 4 hours

Please expect a brief outage during the maintenance window as it is a full patching session and the systems will be rebooted after the patches are applied.

We plan to perform the maintenance outside business hours to reduce the outage caused.

If you have any concerns, or need to reschedule, please contact the team.
"


# ==============================
# Send email with attachment
# ==============================

echo "$BODY" | mailx \
--attach="$CSV_FILE" \
-s "$SUBJECT" \
"$TO"


# ==============================
# Check result
# ==============================

if [ $? -eq 0 ]
then
    echo "Mail sent successfully"
else
    echo "Mail sending failed"
fi

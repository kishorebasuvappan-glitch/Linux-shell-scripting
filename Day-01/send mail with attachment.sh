#!/bin/bash

# ==============================
# Variables
# ==============================

DATE=$(date +"%d/%m/%Y")
CSV_FILE="/workspaces/Linux-shell-scripting/Day-01/apt_update_$(date +"%Y%m%d").csv"

TO="kbasuvappan@gmail.com"
SUBJECT="Production Maintenance Notification - $DATE"


# ==============================
# Create CSV report
# ==============================

echo "Package,CurrentVersion,AvailableVersion,Pocket" > "$CSV_FILE"

apt list --upgradable 2>/dev/null | awk '
NR>1 {
    split($1, pkg, "/")

    package=pkg[1]
    pocket=pkg[2]
    available=$2

    current=""

    for (i=1; i<=NF; i++) {
        if ($i == "from:") {
            current=$(i+1)
            gsub(/\]/, "", current)
        }
    }

    print package "," current "," available "," pocket
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

The full list of systems in scope is in the attached spreadsheet. Additionally, there is an Excel file for each VM containing the list of patches expected to be applied.

Maintenance window

Date: $DATE
Start: 05:00 AM
End: 09:00 AM
Estimated duration: 4 hours

Please expect a brief outage during the maintenance window as it is a full patching session and the systems will be rebooted after patches are applied.

We plan to perform the maintenance outside business hours to reduce the outage caused.

If you have any concerns, or need to reschedule, please contact the team.
"


# ==============================
# Send email with attachment
# ==============================

echo "$BODY" | mailx \
-s "$SUBJECT" \
 --attach="$CSV_FILE" \
"$TO"


# ==============================
# Check result
# ==============================

if [ $? -eq 0 ]; then
    echo "Mail sent successfully"
else
    echo "Mail sending failed"
fi
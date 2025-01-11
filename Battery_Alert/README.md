# Battery Alert Script

This folder contains a script and a user-level systemd service file to monitor your laptop's battery status and provide notifications when certain charge thresholds are met. It helps maintain your battery health by preventing overcharging and deep discharging.

---

## Contents
1. `Battery_alert.sh` - The main script for monitoring battery levels.
2. `battery.service` - A systemd service file to run the script as a background service.

---

## Features
- **Low Battery Alerts**: Notifies when the battery charge drops below a defined threshold (Here 40%).
- **Full Charge Alerts**: Sends a notification when the battery is above a defined threshold (Here 85%).
- **Background Monitoring**: Runs as a persistent service under the current user account.

---

## Usage

### Running the Script Manually
1. Ensure the script is executable:
   ```
   chmod +x Battery_alert.sh
   ```
2. Run the script:
   ```
   ./Battery_alert.sh
   ```

### Setting Up the User-Specific Systemd Service

1. Add the complete location of `Battery_alert.sh` in the `battery.service` file
   ```
   ExecStart= /usr/bin/bash <path to the script>
   ```

2. Copy the `battery.service` file to the **user-specific systemd directory**:
   ```
   mkdir -p ~/.config/systemd/user/
   cp battery.service ~/.config/systemd/user/
   ```

3. Reload systemd to recognize the new service:
   ```
   systemctl --user daemon-reload
   ```

4. Start and enable the service to run it automatically:
   ```
   systemctl --user start battery.service
   systemctl --user enable battery.service
   ```

---

## Customization
- Modify the `Battery_alert.sh` script to set your preferred low and full battery thresholds.
- Adjust notification messages in the script according to your preference.

---

## Problems
Here are some problems I've identified that I’ll continue working on:
- **Error Handling**: The script doesn't have sufficient error handling for cases where the battery data might be unavailable or unreadable. I'll add checks to address this.
- **Notification System Compatibility**: I need to ensure the script works across different systems with various notification setups. Some systems may not have `notify-send` or similar utilities installed.
- **Customization**: Currently, the thresholds for battery alerts are hardcoded. I want to make these values customizable via command-line arguments or configuration files.
- **Performance**: The script may run continuously without any delay between checks, which could consume unnecessary resources. I need to add a delay to optimize performance.

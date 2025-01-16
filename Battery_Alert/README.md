# Battery Alert Script

This script monitors your laptop's battery status and provides notifications when certain charge thresholds are met. It helps maintain your battery health by preventing overcharging and deep discharging.

## Contents

1. **`Battery_alert.sh`** - The main script that monitors battery levels.
2. **`battery.service`** - A systemd service file to run the script as a background service.

---

## Requirements

- **`acpi`**: A tool for retrieving battery status and charge information.

### Install `acpi` on Popular Linux Distributions:

- **Fedora/RHEL/CentOS**:
  ```bash
  sudo dnf install acpi
  ```

- **Ubuntu/Debian**:
  ```bash
  sudo apt install acpi
  ```

- **Arch Linux**:
  ```bash
  sudo pacman -S acpi
  ```

- **OpenSUSE**:
  ```bash
  sudo zypper install acpi
  ```

- **Alpine Linux**:
  ```bash
  sudo apk add acpi
  ```

---

## Features

- **Low Battery Alerts**: Sends a notification when the battery drops below a defined threshold (default: 40%).
- **Full Charge Alerts**: Sends a notification when the battery exceeds a defined threshold (default: 85%).
- **Background Monitoring**: Runs as a user-specific background service to ensure persistent operation.

---

## Usage

### 1. Running the Script Manually

To run the script manually, follow these steps:

1. Ensure the script is executable:
   ```bash
   chmod +x Battery_alert.sh
   ```

2. Execute the script:
   ```bash
   ./Battery_alert.sh
   ```

### 2. Setting Up the User-Specific Systemd Service

To run the script as a background service:

1. **Modify the systemd service**:
   In the `battery.service` file, replace `<path_to_script>` with the full path to the `Battery_alert.sh` script:
   ```ini
   ExecStart=/usr/bin/bash <path_to_script>/Battery_alert.sh
   ```

2. **Copy the `battery.service` file to the user-specific systemd directory**:
   ```bash
   mkdir -p ~/.config/systemd/user/
   cp battery.service ~/.config/systemd/user/
   ```

3. **Reload systemd** to recognize the new service:
   ```bash
   systemctl --user daemon-reload
   ```

4. **Start and enable the service** to run automatically on login:
   ```bash
   systemctl --user start battery.service
   systemctl --user enable battery.service
   ```

---

## Customization

- **Battery thresholds**: You can modify the default low and full battery thresholds in the `Battery_alert.sh` script.
- **Notification messages**: Customize the messages sent by the script when the battery reaches the defined thresholds.

---

## Known Issues & To-Do List

1. **Error Handling**: The script currently lacks proper error handling for cases where battery data might be unavailable. I'll improve this by adding error checks.
2. **Notification System Compatibility**: The script relies on `notify-send` for notifications, which may not be available on all systems. I'll ensure compatibility across different systems.
3. **Threshold Customization**: The low and full battery thresholds are hardcoded in the script. Future updates will allow these values to be passed as command-line arguments or loaded from a configuration file. (Working on this 🙂)

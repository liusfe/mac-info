# Mac System Information Script

This repository contains a Bash script that retrieves essential system information about a macOS device. The script also evaluates the health status of the battery, checks for necessary tools, and installs them if not already available. The output is exported to a text file.

## Features

- Collects detailed system information:
  - macOS version
  - CPU details
  - RAM
  - Disk space
  - Network information (local and public IPs)
- Evaluates battery health:
  - Cycle count
  - Current maximum capacity
  - Design capacity
  - Battery health percentage
- Retrieves CPU temperature (requires `osx-cpu-temp`).
- Checks the SMART status of the disk (requires `smartmontools`).
- Automatically installs required tools (`Homebrew`, `smartmontools`, and `osx-cpu-temp`) if they are not installed.

## Requirements

- macOS device.
- Internet connection (for tool installation).
- Administrator privileges (for installing Homebrew and tools).

## Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/liusfe/mac-info-script.git
   cd mac-info-script
   ```
2. Make the script executable:
   ```bash
   chmod +x info_mac.sh
   ```

## Usage

1. Run the script:
   ```bash
   ./info_mac.sh
   ```
2. The script will:
   - Check for Homebrew and install it if missing.
   - Install `smartmontools` and `osx-cpu-temp` if they are not already installed.
   - Collect system information and save it to a file named `info_mac.txt` in the current directory.

3. View the output:
   ```bash
   cat info_mac.txt
   ```

## Output Example

The script exports the following information to `info_mac.txt`:

```
===== System Information =====
Mac Model: MacBookPro16,1
macOS Version: macOS 12.6 (21G115)
Processor: Intel Core i7-9750H CPU @ 2.60GHz
Cores: 6
RAM: 16 GB
Disk Space:
Filesystem      Size   Used  Avail Capacity
/dev/disk1s5   500G   200G   300G    40%

===== Battery Status =====
Cycle Count: 320
Current Maximum Capacity: 8200 mAh
Design Capacity: 8750 mAh
Health Percentage: 93%

===== CPU Temperature =====
CPU Temperature: 55.2°C

===== Disk Status =====
SMART overall-health self-assessment test result: PASSED

===== Network Information =====
Local IP: 192.168.1.2
Public IP: 203.0.113.1
```

## Troubleshooting

- If the script fails to install Homebrew or tools, ensure you have an active internet connection and administrator privileges.
- For CPU temperature monitoring, `osx-cpu-temp` must be installed via Homebrew.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

## Contributing

Contributions are welcome! Feel free to open an issue or submit a pull request with enhancements or bug fixes.


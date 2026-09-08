# 🚀 Blueprint Installer — shakibplayz
<p align="center">
<img src="https://img.shields.io/badge/Blueprint-Framework-blue?style=for-the-badge">
<img src="https://img.shields.io/badge/Pterodactyl-Panel-blueviolet?style=for-the-badge">
<img src="https://img.shields.io/badge/Installer-Automated-success?style=for-the-badge">
<img src="https://img.shields.io/badge/Platform-Linux-orange?style=for-the-badge">
</p><p align="center">
<b>⚡ Fast • Automated • Reliable</b>
</p><p align="center">
A fast, fully automated installer for <b>Blueprint Framework</b> on <b>Pterodactyl Panel</b>.
</p><p align="center">
<i>No manual commands, no copy-pasting a dozen steps — just one line and you're done.</i>
</p>---
## ⚡ Quick Install
Run this single command on your VPS:

```bash
bash <(curl -fsSL (https://raw.githubusercontent.com/shakibplayz/blueprint-install/main/install.sh) 

```

## 📖 Overview
This script automates the entire process of installing **Blueprint Framework** onto an existing Pterodactyl Panel setup, along with the addon installer that follows it. It's built to save time, reduce human error, and give a clean, guided installation experience straight from your terminal.
When you run the command above, you'll see a branded banner, a confirmation prompt, and then a fully automated installation flow — no further input required once you confirm.
text


```┌──────────────────────────────────────────────┐
│        SHAKIBPLAYZ BLUEPRINT INSTALLER       │
├──────────────────────────────────────────────┤
│                                              │
│   ⚡ One Command                             │
│   🤖 Automated Installation                 │
│   🧩 Blueprint Framework                    │
│   📦 Automatic Dependencies                 │
│   🔧 Node.js + Yarn Setup                   │
│   ➕ Addon Installer                        │
│   📊 Clean Progress Output                 │
│                                              │
└──────────────────────────────────────────────┘

```
## ✨ Features
 * **⚡ One-command installation** — just paste and run, nothing else to download manually
 * **🤖 Interactive confirmation** — asks before making any changes to your server
 * **🧩 Fully automated setup** — installs all required dependencies, configures Blueprint, and runs the framework installer
 * **➕ Addon support** — automatically continues into the addon installer after the core setup finishes
 * **📊 Clean terminal output** — clear step indicators so you always know what's happening
 * **🛡️ Safe exit option** — decline the prompt and the script closes without touching your system
## 📋 Requirements
Before running the script, make sure your VPS meets the following:
| Requirement | Details |
|---|---|
| **🐧 OS** | Ubuntu / Debian based Linux |
| **🎮 Panel** | Pterodactyl Panel already installed |
| **📁 Path** | Panel installed at /var/www/pterodactyl |
| **🔐 Access** | Root or sudo privileges |
| **🌐 Network** | Active internet connection |
> ⚠️ **Important:** If your Pterodactyl Panel isn't installed yet, install it first — this script only sets up Blueprint on top of an existing panel.
> 
## 🛠️ How It Works
Once you run the install command and confirm with y, the script takes over completely.
### 01 — Launch
```bash
bash <(curl -fsSL [https://raw.githubusercontent.com/shakibplayz/blueprint-install/main/install.sh](https://raw.githubusercontent.com/shakibplayz/blueprint-install/main/install.sh))

```
### 02 — Confirm
Displays the **shakibplayz Script** banner and asks for confirmation:
```text
Continue Installing (y/n): y

```
### 03 — Automatic Installation
The installer handles:
 * ✓ Prepares your system with required tools and dependencies
 * ✓ Downloads and sets up Blueprint Framework on your panel
 * ✓ Configures Node.js, Yarn, and the Blueprint environment automatically
 * ✓ Runs the Blueprint installer itself
 * ✓ Continues into the addon installer to extend your setup further
### 04 — Done
Finishes with a clean summary banner once everything is complete. No manual intervention is needed at any point after confirming the prompt.
## 🖥️ Usage Example
```bash
$ bash <(curl -fsSL [https://raw.githubusercontent.com/shakibplayz/blueprint-install/main/install.sh](https://raw.githubusercontent.com/shakibplayz/blueprint-install/main/install.sh))

============================================================
                   shakibplayz Script
============================================================
                     Made By shakibplayz

Continue Installing (y/n): y
Installation Starting...
...
Thanks For Using This Script

```
## 📁 Default Installation Path
The script expects Pterodactyl at:
```text
/var/www/pterodactyl

```
If your setup differs, install Pterodactyl at that path or adjust your environment accordingly before running the script.
## 🔐 Safety
It only installs Blueprint Framework and its official addon installer.
As with any script found online, it's good practice to review it before running it on a production server. Make sure you have sudo access, active backups, and a stable connection.
## ❓ FAQ
**Do I need to run any command manually besides the install command?**
No. A single command handles the entire installation from start to finish.
**What happens if I type n at the prompt?**
The script exits immediately and nothing is installed or changed on your server.
**What if my Pterodactyl Panel isn't at the default path?**
The script expects Pterodactyl at /var/www/pterodactyl. Make sure it is installed there before proceeding.
**Is this script safe to run?**
It only installs Blueprint Framework and its official addon installer. You can review the code beforehand.
**What should I do if installation fails midway?**
Check that Pterodactyl is properly installed, you have sudo access, and your internet connection is stable — then simply run the command again.
## 📊 Project Highlights
```text
⚡ ONE COMMAND
        ↓
🛠️ DEPENDENCIES
        ↓
🧩 BLUEPRINT
        ↓
🔧 CONFIGURATION
        ↓
🚀 INSTALLER
        ↓
➕ ADDONS
        ↓
✅ COMPLETE

```
## 🧑‍💻 Credits
 * **Script by:** shakibplayz
 * **Framework used:** Blueprint Framework
 * **Target:** Pterodactyl Panel
## ⭐ Support The Project
If this installer helped you save time, consider giving the repository a ⭐ **Star**.
It helps the project get discovered by more Pterodactyl users.
<p align="center">🚀 Built for Pterodactyl • Powered by Blueprint • Made by shakibplayz
<b>Thanks For Using This Script ❤️</b>
</p>

# 🚀 Blueprint Install — shakibplayz Script

A fast, fully automated installer for **Blueprint Framework** on **Pterodactyl Panel**. No manual commands, no copy-pasting a dozen steps — just one line and you're done.

---

## ⚡ Quick Install

Run this single command on your VPS:

```bash
bash <(curl -fsSL https://raw.githubusercontent.com/atifqmi-max/blueprint-install/main/install.sh)
```

That's it. No `git clone`, no extra setup — the script handles everything from start to finish.

---

## 📖 Overview

This script automates the entire process of installing **Blueprint Framework** onto an existing Pterodactyl Panel setup, along with the addon installer that follows it. It's built to save time, reduce human error, and give a clean, guided installation experience straight from your terminal.

When you run the command above, you'll see a branded banner, a confirmation prompt, and then a fully automated installation flow — no further input required once you confirm.

---

## ✨ Features

- **One-command installation** — just paste and run, nothing else to download manually
- **Interactive confirmation** — asks before making any changes to your server
- **Fully automated setup** — installs all required dependencies, configures Blueprint, and runs the framework installer
- **Addon support** — automatically continues into the addon installer after the core setup finishes
- **Clean terminal output** — clear step indicators so you always know what's happening
- **Safe exit option** — decline the prompt and the script closes without touching your system

---

## ✅ Requirements

Before running the script, make sure your VPS meets the following:

| Requirement | Details |
|---|---|
| OS | Ubuntu / Debian based Linux |
| Panel | Pterodactyl Panel already installed |
| Path | Panel installed at `/var/www/pterodactyl` |
| Access | Root or `sudo` privileges |
| Network | Active internet connection |

> If your Pterodactyl Panel isn't installed yet, install it first — this script only sets up Blueprint on top of an existing panel.

---

## 🛠️ How It Works

Once you run the install command and confirm with `y`, the script takes over completely. It:

1. Displays the **shakibplayz Script** banner and asks for confirmation
2. Prepares your system with the required tools and dependencies
3. Downloads and sets up the **Blueprint Framework** on your panel
4. Configures Node.js, Yarn, and the Blueprint environment automatically
5. Runs the Blueprint installer itself
6. Continues into the addon installer to extend your setup further
7. Finishes with a clean summary banner once everything is complete

No manual intervention is needed at any point after confirming the prompt.

---

## 🖥️ Usage Example

```bash
$ bash <(curl -fsSL https://raw.githubusercontent.com/atifqmi-max/blueprint-install/main/install.sh)

============================================================
                   shakibplayz Script
============================================================
                     Made By shakibplayz

Continue Installing (y/n): y
Installation Starting...
...
Thanks For Using This Script
```

---

## ❓ FAQ

**Do I need to run any command manually besides the install command?**
No. A single command handles the entire installation from start to finish.

**What happens if I type `n` at the prompt?**
The script exits immediately and nothing is installed or changed on your server.

**What if my Pterodactyl Panel isn't at the default path?**
The script expects Pterodactyl at `/var/www/pterodactyl`. If your setup differs, install Pterodactyl at that path or adjust your environment accordingly before running the script.

**Is this script safe to run?**
It only installs Blueprint Framework and its official addon installer. As with any script found online, it's good practice to review it before running it on a production server.

**What should I do if installation fails midway?**
Check that Pterodactyl is properly installed, you have sudo access, and your internet connection is stable — then simply run the command again.

---

## 📜 Credits

- **Script by:** shakibplayz
- **Framework used:** Blueprint Framework

---

<p align="center"><b>Thanks For Using This Script ❤️</b></p>

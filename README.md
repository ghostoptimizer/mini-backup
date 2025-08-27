

# 🧪 Mini Backup Framework

> Lightweight, encrypted, and automated backup system written in Bash.  
> Designed for local devs, tinkerers, and ops-minded folks who want total control over their data without the bloat.

---

## ✨ Features

- 📦 Create compressed `.tar.gz` archives of your important files
  
- 🔐 Encrypt backups using GPG with AES256 (`--symmetric`)
  
- 📂 Smart exclude patterns (e.g., skip caches, trash, etc.)
  
- 🧹 Prune backups automatically with retention policy
  
- 🛠️ Restore from backup interactively
  
- 🧠 Configurable via `config.conf`
  
- 🕒 Schedule via `cron`

---

## ⚙️ Prerequisites

- Bash (Unix/macOS/Linux)
- `tar`, `gpg`, and `date` (with `coreutils` for `gdate` on macOS)
- `cron` (or `launchd`, `systemd`, etc.)
- Optional: Homebrew (`brew install coreutils` for `gdate`)

---

## 📁 Configuration

Edit `config.conf` to define your backup strategy:

```bash
# Paths to include
SOURCES="$HOME/Documents $HOME/Desktop"

# Where to store encrypted .tar.gz archives
DEST="$HOME/backups-mini"

# Patterns to skip
EXCLUDES="$HOME/Library/** $HOME/.Trash/** $HOME/Downloads/** $DEST/** *.sock"

# How many archives to keep
KEEP_LAST=7

Also ensure your GPG passphrase is saved in gpg.pass (used by mkbackup.sh). Do not store inside of your config.conf

# 🧰 jedToolKit

**Version:** 1.1.070125  
**Developer:** Kyle Genesis Fernando Lambot ([@ProtonyteTV](https://x.com/ProtonyteTV))  
**Powered by:** `jed` & `jedOS`

**Source Code:** Coming soon

`jedToolKit` is a modular diagnostics and utility suite built for **jailed iOS devices** running **iOS 13 and above** — no jailbreak required.

---

## 📦 Included Modules

- 📱 **jedPhoneInfo** – View hardware identifiers, specs, and iOS compatibility (via `jedOS`)
- 🔧 **jedHWChecker** – Test core hardware like display, mic, sensors, camera, Face ID / Touch ID
- 📊 **jedMonitor** – Real-time display of CPU, memory, storage, and thermal state
- 🧪 **jedTerminal Lite** – Terminal-style interface with quick jailed-safe commands
- 🧩 **jedSysPatcher** – Install OTA blockers (for iOS 18+) and mobileconfig profiles (iOS 13–14)
  `*Please report if SSLFix and DOH options work for your iOS version*`
- 🔎 **jedTSSChecker** – To check signed version for your iDevice
- ⏫ **jedOSUpdateChecker** - Live update checks and changelog
- 🎨 **IconThemer** – Customize home screen icons via Shortcuts automation
- 📥 **IPSW Download Helper** – Fetch direct firmware links for your device from IPSW.me

---

## ⚙️ Architecture

### `jed` — *Jailed Environment Diagnostics*  
The invisible runtime that powers every module inside `jedToolKit`.  
Responsible for:
- Handling module logic and runtime behaviors
- Sharing core diagnostic functions
- Managing iOS version compatibility

Think of it as the framework’s engine — silent but essential.

---

### `jedOS` — *Jailed Environment Diagnostics Operating Support*  
A diagnostic reference layer built into `jedToolKit`.  
It identifies:
- Which modules are supported on your iOS version
- Known limitations or bugs per firmware
- Module stability and recommendations
- To check new software updates for jedToolKit via GitHub Releases

> ⚠️ **Disclaimer:** `jedOS` is **not** a custom firmware or emulator.  
> It does **not modify, patch, or replace iOS**. It’s purely an informational system.

---

## 🚀 Requirements

- ✅ iOS 13.0 or newer
- ✅ No jailbreak needed
- ✅ Compatible with iPhone and iPod touch

---

## 🧪 Technology Stack

- Language: `Swift 5.0+`
- UI: `UIKit`
- Design: Card-based modular layout
- Architecture: Fully jailed, sandbox-respecting, modular Swift codebase

---

## 📄 License

[MIT License](LICENSE)  
© 2025 Kyle Genesis Fernando Lambot  
For educational, diagnostic, and offline-first use.

---

## ❤️ Built With

- `Swift` — Fast, native, and beautiful
- `☕ Coffee` — Fuel for long coding sessions
- `❤️ Passion` — Made with love for the community
- `🎸 Guitar` — Keeps the rhythm of dev going

---

## 🌐 Visit

**jedDev Website** → [https://jeddev.ct.ws](https://jeddev.ct.ws)  
For more modules, updates, and developer notes.

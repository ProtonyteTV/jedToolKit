# 🧰 jedToolKit

> 🛠️ What started as a side project is now a growing toolkit for jailed iOS devices.

**Version:** 25.5.2 (jed fixed jed)\
**Developer:** jedPlatforms\
**Powered by:** `jed` & `jedOS`

`jedToolKit` is a modular diagnostics and utility suite designed for **jailed iOS devices** running **iOS 15 and above** — no jailbreak required.

---


## ⭐ New on 25.5.2

- **UI Enhancements**  
  Optimized the user interface for a smoother experience on iOS 26 and older versions.

- **Bug Fixes & Stability**  
  Resolved issues with navigation bars, the jedPhoneInfo widget, and the archiving process in jedXIP.

- **Layout Adjustments**  
  Improved spacing and alignment throughout the app for a cleaner, more polished look.

---

## ⚙️ Internal Architecture

### `jed` — *Jailed Environment Diagnostics*

The core system that powers all modules.  
It handles info gathering, sandboxed access, and keeps everything running smoothly.

### `jedOS` — *Jailed Environment Diagnostics Operating Support*

A lightweight runtime that manages iOS compatibility and module behavior.  
It helps `jedToolKit` adapt safely across different devices and iOS versions.

> ⚠️ Not an operating system. It doesn’t modify or replace iOS — it just makes modules smarter.

---

## ✅ Requirements

- iOS 15.0 or later
- Works on all iPhones and iPods
- No jailbreak required
- Internet only needed for:
  - IPSW download links
  - TSS signing status
  - Update metadata from GitHub
  - For Wi-Fi testing
- **Bluetooth is required** for testing:
  - Bluetooth
  - Cellular & VoLTE

---

## 🛡️ Security & Privacy

- 100% local and sandbox-compliant
- No serials, UDIDs, or personal data collected
- Internet only used for optional metadata
- Bluetooth permission is only used for testing Bluetooth and Cellular features — never for tracking
- Fully offline-first by design
- **jedOSSecuCheck 3.0** ensures maximum module protection against tampering

---

## 🧪 Technology Stack

- Language: `Swift 5.0+`
- UI Framework: `UIKit`
- Design: Modular, card-based layout
- Architecture: Jailed, sandbox-respecting Swift codebase

---

## ❤️ Built With

- **Swift** — Native, fast, and clean
- **Coffee** — Always
- **Passion** — For every iOS nerd
- **Worship Music** — Built between sets and dev sprints

---

## 🌐 Visit

**jedPlatforms Website** → [https://jeddev.ct.ws](https://jeddev.ct.ws)

---

2025 jedPlatforms  
For educational use only. Not affiliated with Apple Inc.

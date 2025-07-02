**# 🧰 jedToolKit

**Version:** 1.1.070225  
**Developer:** Kyle Genesis Fernando Lambot ([@ProtonyteTV](https://x.com/ProtonyteTV))  
**Powered by:** `jed` & `jedOS`

**Source Code:** Soon

`jedToolKit` is a modular diagnostics and utility suite built for **jailed iOS devices** running **iOS 13 and above** — no jailbreak required.

---

## 📦 Included Modules

- 📱 **jedPhoneInfo** – Device info viewer + iOS compatibility via `jedOS`
- 🔧 **jedHWChecker** – Hardware tests: sensors, camera, Face ID, mic, etc.
- 📊 **jedMonitor** – Real-time system usage monitor (CPU, RAM, storage)
- 🧪 **jedTerminal Lite** – Terminal-style interface for quick commands
- 🧩 **jedSysPatcher** – Installs OTA blockers on iOS 18 and config profiles for iOS 13 and 14 ` *please report if SSLFix and DOH Works on that version* `
- 🎨 **IconThemer** – Customize iOS icons using the Shortcuts method
- 📥 **IPSW Download Helper** – Direct download links for firmware

---

## ⚙️ Architecture

### `jed` — *Jailed Environment Diagnostics*  
The invisible engine that powers all modules in `jedToolKit`.  
Manages compatibility logic, internal behaviors, and shared utilities.

### `jedOS` — *Jailed Environment Diagnostics Operating Support*  
A compatibility reference layer that evaluates which modules are stable or limited on your current iOS version.  
It does not modify or replace iOS — purely informational.

> ⚠️ `jedOS` Disclaimer:  
> `jedOS` is **not a custom OS**. It does not modify, patch, or emulate iOS.  
> It is a diagnostic tool designed to help users assess feature compatibility per iOS version.

---

## 🚀 Requirements

- ✅ iOS 13.0 and above
- ✅ No jailbreak required
- ✅ Works on iPhone, iPod Touch

---

## 🧪 Technology Stack

- Language: `Swift 5.0+`
- Frameworks: `UIKit`
- Architecture: Modular, jailed, sandbox-safe
- UI: Custom navigation + card-based interface

---

## 📄 License

[MIT License](LICENSE)  

© 2025 Kyle Lambot  
Built for educational, diagnostic, and utility purposes.


---

## ❤️ Built With

- `Swift` — Fast & native
- `☕ Coffee` — To stay up all night
- `❤️ Love` — From developer to user
- `🎸 Bass` — To keep the rhythm going

---

## 🌐 Visit

**jedDev** — [https://jeddev.ct.ws](https://jeddev.ct.ws)  
More tools and updates available on the official site.


**

# 🧰 jedToolKit

> 🛠️ This started as a side project I worked on during my free time, but lately I've taken it seriously to become a basic yet powerful toolkit for iOS.

**Version:** 2.0 (Gold Master)  
**Developer:** Kyle Genesis Fernando Lambot ([@ProtonyteTV](https://x.com/ProtonyteTV))  
**Powered by:** `jed` & `jedOS`

`jedToolKit` is a modular diagnostics and utility suite built for **jailed iOS devices** running **iOS 13 and above** — no jailbreak required.

Version 2.0 introduces visual enhancements, internal architectural refinements, and three major additions:  
- **jedOSUpdateChecker** – A native-style software update screen  
- **jedPanicAnalyzer** – Offline iOS/macOS panic log pattern analysis  
- **jedAI (Beta)** – A built-in assistant that brings helpful tools and diagnostics together in one place

---

## 📦 Included Modules (v2.0)

- 📱 **jedPhoneInfo**  
  View device identifiers, internal model, battery state, orientation, RAM/CPU data, and more.  
  _Now includes system metrics from the merged `jedMonitor` module._

- 🔧 **jedHWChecker**  
  Test your device's screen, touch, sensors, camera, microphone, haptics, and other hardware.

- 📊 **jedMonitor** (_merged into PhoneInfo_)  
  Previously standalone, now integrated into `jedPhoneInfo`. Shows system info like CPU usage, memory, uptime, and storage.

- 🧪 **jedTerminal Lite**  
  Terminal-style UI supporting offline commands: `echo`, `uptime`, `date`, `ls`, `whoami`, `battery`, and more.

- 📥 **IPSW Download Helper**  
  Grab signed IPSWs from [IPSW.me](https://ipsw.me) with real-time signing status.

- 🔎 **jedTSSChecker**  
  Instantly check the latest signed iOS versions for your device — no Apple server interaction needed.

- ⏫ **jedOSUpdateChecker** (_new in 2.0_)  
  View available `jedToolKit` versions, changelogs, and update metadata — mimicking iOS Software Update UI.

- ⚠️ **jedPanicAnalyzer** (_new in 2.0_)  
  Analyze over **100 known panic log issues** across iOS and macOS. Fully offline. Designed for jail-free debugging.

- 🤖 **jedAI (Beta 1)**  
  An early version of `jedToolKit`’s built-in assistant — capable of detecting panics, checking iOS compatibility, and parsing key system info.  
  > Future updates will bring full chat capabilities and GPT integration.

- 🎨 **IconThemer**  
  Customize your home screen icons using Shortcuts automation — fully sandbox-safe.

- 🧩 **jedSysPatcher**  
  Block OTA updates and install jailed-safe `.mobileconfig` profiles.  
  > Supports DOH and SSLFix for iOS 13–14.

---

## ⚙️ Architecture

### `jed` — *Jailed Environment Diagnostics*  
The invisible core framework behind every module.

It silently manages
- Shared system access and info gathering
- Sandboxed behaviors and logic routing
- Smooth cross-module coordination

Think of it as the engine room of jedToolKit.

---

### `jedOS` — *Jailed Environment Diagnostics Operating Support*  
Not an operating system - but a core runtime layer inside jedToolKit

Originally built to manage iOS version compatibility and software checking,

jedOS has now evolved to power critical modules like:
- `jedAI Beta` - Your diagnostic assistant  
- `jedPhoneInfo` - Device hardware and status viewer
- `jedHWChecker` - Hardware-level diagnostics 
- `jedOSUpdateChecker` - Checks for new version and changelogs

It acts like a lightweight OS Inside the app, managing how each module adapts, behaves, and interacts with your device's iOS version safely and intelligently

> ⚠️ **Disclaimer:** `jedOS` is *not* a real operating system or firmware.  
> It does *not* modify, emulate, or replace iOS in any way
> It's purely a sandbox-respecting internal controller that powers how modules behave.
---

## 🚀 Requirements

- ✅ iOS 13.0 or later  
- ✅ Works on iPhones and iPods  
- ✅ No jailbreak required  
- 📶 Internet is required only for:
  - IPSW download links  
  - TSS signing status  
  - Update metadata from GitHub

---

## 🛡️ Security & Privacy

- 🔒 All processing is local and sandbox-safe  
- 🚫 No serials, UDIDs, or unique data are collected  
- 🌐 Internet is only used for metadata — never for diagnostics  
- ✅ Fully respects Apple’s privacy and fully offline-first

---

This started as a side project I worked on during my free time, but lately I've take it seriously to become a basic yet powerful toolkit for iOS.

---

## 🧪 Technology Stack

- Language: `Swift 5.0+`  
- UI Framework: `UIKit`  
- Compatibility: iOS 13 → iOS 26+  
- Design: Modular, card-based layout  
- Architecture: Jailed, sandbox-respecting Swift codebase

---

## ❤️ Built With

- **Swift** — Native, fast, secure  
- **Coffee** — Developer fuel  
- **Passion** — For every iOS nerd out there  
- **Jams** — Because this app was built between worship sets and tech sprints

---

## 🌐 Visit

**jedDev Website** → [https://jeddev.ct.ws](https://jeddev.ct.ws)  
Find changelogs, docs, and dev logs.

---

## 📄 License

[MIT License](LICENSE)  
© 2025 Kyle Genesis Fernando Lambot  
Educational use only. Not affiliated with Apple Inc.

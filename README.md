# 🧰 jedToolKit

> 🛠️ What started as a side project is now a growing toolkit for jailed iOS devices.

**Version:** 3.0 (jeds echo)  
**Developer:** Kyle Genesis Fernando Lambot ([@ProtonyteTV](https://x.com/ProtonyteTV))  
**Powered by:** `jed` & `jedOS`

`jedToolKit` is a modular diagnostics and utility suite designed for **jailed iOS devices** running **iOS 13 and above** — no jailbreak required.

---

## 🧪 What’s New in v3.0

### 🧰 Revamped `jedHWChecker`
- ✅ **Pass or Fail** toggle for each test
- 📤 **Share test results** as a report
- 🧩 **New hardware test modules:**
  - Charger Test  
  - Physical Buttons Test  
  - Display Test  
  - Accelerometer Test  
  - Vibration Test  
  - Wi-Fi Test  
  - Bluetooth Test  
  - Cellular & VoLTE Test  
  - Magnetometer Test  
  - LED Flash Test  
  - Gyroscope with **3D cube renderer**  
  - Camera (now supports **ultrawide**)  
  - Touch Responsiveness (**fullscreen** supported)

### ⚙️ All-New Settings Tab
- 🎨 **Theme Selector** – System / Light / Dark  
- 🧭 **Customizable Tab Bar** – Show/hide or reorder modules  
- 🔒 Privacy Policy, About, and Developer info  
- 🤖 Toggle for enabling/disabling **jedAI**

### 🚀 Performance & Improvements

General performance enhancements and internal refinements across all modules.


---

## 📦 Included Modules

### 📱 jedPhoneInfo
- Device name, model, battery, RAM, CPU, screen info, and more  
- Now includes metrics from the merged `jedMonitor` module

### 🔧 jedHWChecker
- Test 19 hardware components (camera, touch, gyro, Wi-Fi, buttons, etc.)

### 🧪 jedTerminal Lite
- Terminal-style UI with commands like `echo`, `uptime`, `date`, `battery`, and more

### 📥 IPSW Download Helper
- Pull IPSWs from [IPSW.me](https://ipsw.me) with signing status

### 🔎 jedTSSChecker
- Check iOS signing status offline — no Apple server needed

### ⏫ jedOSUpdateChecker
- View latest `jedToolKit` versions and changelogs  
- iOS-style update screen

### ⚠️ jedPanicAnalyzer
- Analyze 100+ iOS/macOS panic log patterns  
- Fully offline and jailbreak-safe

### 🤖 jedAI (Beta 1)
- Basic assistant for system checks and panic detection  
- Future versions will support full GPT-based interaction

### 🎨 IconThemer
- Customize homescreen icons using Shortcuts  
- Fully jailed-safe (no profiles required)

### 🧩 jedSysPatcher
- Block OTA updates and install safe `.mobileconfig` profiles  
- Includes DOH and SSLFix for iOS 13–14

---

## ⚙️ Internal Architecture

### `jed` — *Jailed Environment Diagnostics*

The core system that powers all modules.  
It handles info gathering, sandboxed access, and keeps everything running smoothly.

---

### `jedOS` — *Jailed Environment Diagnostics Operating Support*

A lightweight runtime that manages iOS compatibility and module behavior.  
It helps `jedToolKit` adapt safely across different devices and iOS versions.

> ⚠️ Not an operating system. It doesn’t modify or replace iOS — it just makes modules smarter.

---

## ✅ Requirements

- iOS 13.0 or later  
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
- **Free Time** — Turned full time

---

## 🌐 Visit

**jedDev Website** → [https://jeddev.ct.ws](https://jeddev.ct.ws)

---

© 2025 Kyle Genesis Fernando Lambot  
For educational use only. Not affiliated with Apple Inc.

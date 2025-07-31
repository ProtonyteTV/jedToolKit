# 🧰 jedToolKit

> 🛠️ What started as a side project is now a growing toolkit for jailed iOS devices.

**Version:** 25.4.0 (jeds peak)  
**Developer:** jedPlatforms
**Powered by:** `jed` & `jedOS`

`jedToolKit` is a modular diagnostics and utility suite designed for **jailed iOS devices** running **iOS 15 and above** — no jailbreak required.

---

## 🔥 What’s New in v25.4.0 (jeds peak)

### ✨ New Features
- 🧪 **jedBenchmark** — Real-time task-based benchmarking for iOS devices
- 🔒 **jedOSSecuCheck** — Anti-tampering system for module access control
- 🎨 **jedUI** — Unified UI design across all jedToolKit modules
- 👤 **jedAccount** — Offline profile system for user personalization
- 🔐 **App Lock** — Local passcode protection for app access
- 🌐 **Offline Mode Toggle** — Fully offline-first mode (enabled by default)
- ⚡ General **Performance and Improvements** across modules

⚠️ **iOS 13 and 14 Support Dropped**  
Minimum iOS version is now **iOS 15**.  
We left iOS 13 and 14 in a stable final version.

---

## 📦 Included Modules

### 📱 jedPhoneInfo
- Device name, model, battery, RAM, CPU, screen info, and more  
- Now includes metrics from the merged `jedMonitor` module

### 🔧 jedHWChecker
- Test 19 hardware components (camera, touch, gyro, Wi-Fi, buttons, etc.)

### 🧪 jedBenchmark
- Real-time performance benchmarking for iOS devices  
- Measures actual device performance using task-based workloads (not synthetic scores)  
- Works fully offline with no server-side uploads

### 🛡️ jedOSSecuCheck
- Anti-tampering system that limits access to protected modules  
- Ensures module security while keeping essential tools like `jedPhoneInfo` always accessible  
- Operates fully offline

### 👤 jedAccount
- Offline profile system with custom username and profile picture  
- Adds personalized splash greetings and in-app identity  
- No online accounts or data collection — purely local profiles

### 🔐 App Lock
- Local passcode lock for securing access to jedToolKit  
- Fully offline with no cloud or online storage  
- Face ID/Touch ID support on compatible devices

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

### 🤖 jedAI (Beta 2)
- Basic assistant for system checks and panic detection  

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

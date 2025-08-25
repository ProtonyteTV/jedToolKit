# 🧰 jedToolKit

> 🛠️ What started as a side project is now a growing toolkit for jailed iOS devices.

**Version:** 25.5.0 (jed fixed jed)\
**Developer:** jedPlatforms\
**Powered by:** `jed` & `jedOS`

`jedToolKit` is a modular diagnostics and utility suite designed for **jailed iOS devices** running **iOS 15 and above** — no jailbreak required.

---

## 🌟 STAR UPDATE (25.5.0)

### 🔒 **jedOSSecuCheck 2.0**

- Stronger security with enhanced protection mechanisms.  
- Ensures modules remain safe and resilient against tampering.  
- Automatically applies Lite Mode when required for compatibility and stability.  

### 📦 **New Module: jedXIP**

- A full ZIP archive manager.
- Create, view, and edit archives directly in-app.

---

## ✨ What’s New in v25.5.0

### 📱 **jedPhoneInfo**

- New **Advanced Features** section:
  - ProMotion Display
  - Connector Type
  - Action Button
  - Always-On Display (AOD) Info
- Toggle to view **Optimistic Storage** vs **Raw Storage**.

### 🔧 **jedHWChecker**

- Button test: Now easier — detects **volume button inputs** automatically.
- Camera test: Smarter detection per device model; added **ultrawide** and **telephoto** tests.
- Battery info moved to **Tools section** (not an actual test).
- Brightness test: Saves user brightness before testing and restores it afterward.

### 🎨 **IconThemer**

- Added **Find App Scheme** for quicker URL scheme assignment.
- Fixed icon color & glyph logic: Now supports colors on SF Symbol icons (missing in 25.4.1).

### 📲 **jedPhoneInfo Widget**

- Quick view of device info at a glance.

### 🖌️ **jedUI**

- Removed neon colors & shadows → flatter, cleaner design.
- Finalized UI with **accent colors** & **multi-color support**.

### 🤖 **jedAI (Beta 3)**

- Added new commands:
  - System Status
  - Check Storage
  - List Modules
  - Search
  - Clear Chat
- UI/UX improvements:
  - Typing Indicator
  - Rich Text Formatting
  - Ask Suggestions

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

### 🤖 jedAI (Beta 3)

- Expanded system assistant with storage checks, module listing, search, and more

### 🎨 IconThemer

- Customize homescreen icons using Shortcuts
- Fully jailed-safe (no profiles required)

### 🧩 jedSysPatcher

- Block OTA updates and install safe `.mobileconfig` profiles
- Includes DOH and SSLFix for iOS 13–14

---

## ⚙️ Internal Architecture

### `jed` — *Jailed Environment Diagnostics*

The core system that powers all modules.\
It handles info gathering, sandboxed access, and keeps everything running smoothly.

---

### `jedOS` — *Jailed Environment Diagnostics Operating Support*

A lightweight runtime that manages iOS compatibility and module behavior.\
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

2025 jedPlatforms\
For educational use only. Not affiliated with Apple Inc.

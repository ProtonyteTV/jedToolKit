# 🧰 jedToolKit

> 🛠️ What started as a side project is now a growing toolkit for jailed iOS devices.

**Version:** 25.5.1 (jed fixed jed)\
**Developer:** jedPlatforms\
**Powered by:** `jed` & `jedOS`

`jedToolKit` is a modular diagnostics and utility suite designed for **jailed iOS devices** running **iOS 15 and above** — no jailbreak required.

---

## 🌟 STAR UPDATE (25.5.1)

### 🔒 **jedOSSecuCheck 3.0**

- Next-generation security engine with **robust module protection**.  
- Performs integrity verification on the filesystem and module environment.  
- Encrypted internal logic prevents reverse engineering.  
- Centralized **Lite Mode** ensures compromised devices only run safe modules.  
- Multi-layered anti-tampering system with anti-debugging and sandbox integrity checks.

### 📦 **jedXIP Archive Manager**

- A full ZIP archive manager.
- Create, view, and edit archives directly in-app.
- Expands jedToolKit beyond diagnostics into utility management.

---

## ✨ What’s New in v25.5.1

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

## ⚙️ Internal Architecture

### `jed` — *Jailed Environment Diagnostics*

The core system that powers all modules.\
It handles info gathering, sandboxed access, and keeps everything running smoothly.

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

2025 jedPlatforms\
For educational use only. Not affiliated with Apple Inc.

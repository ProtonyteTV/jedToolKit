# 🧰 jedToolKit

> 🛠️ What started as a side project is now a growing toolkit for jailed iOS devices.

**Version:** 25.7.0 (jedPanic)  
**Developer:** jedPlatforms  
**Powered by:** `jed` & `jedOS`

`jedToolKit` is a modular diagnostics and utility suite designed for **jailed iOS devices** running **iOS 15 and above** — no jailbreak required.

---

## 📦 Included Modules

### 💾 jedDiskChecker  
Accurately measures your device’s storage read/write speeds.

### 📱 jedPhoneInfo  
Full device metrics including battery, RAM, CPU, screen info, and more.

### 🔧 jedHWChecker  
Test 19 hardware components (camera, touch, gyro, Wi-Fi, buttons, etc.).

### 🧪 jedBenchmark  
Real-time performance benchmarking with task-based workloads.

### 🛡️ jedOSSecuCheck  
Offline anti-tampering system with enhanced protection (v3.1).

### 👤 jedAccount  
Offline profile system with custom username and profile picture.

### 🔐 App Lock  
Local passcode lock with Face ID/Touch ID support.

### 🧪 jedTerminal Lite  
Terminal-style UI with built-in commands.

### 📥 IPSW Download Helper  
Pull IPSWs from [IPSW.me](https://ipsw.me) with signing status.

### 🔎 jedTSSChecker  
Check iOS signing status completely offline.

### ⏫ jedOSUpdateChecker  
iOS-style update screen for the latest jedToolKit versions.

### ⚠️ jedPanicAnalyzer  
Analyze 100+ iOS/macOS panic log patterns offline.

### 🤖 jedAI (Beta 3)  
Expanded system assistant with storage checks, module listing, and more.

### 🎨 IconThemer  
Customize home-screen icons using Shortcuts.

### 🧩 jedSysPatcher  
Block OTA updates and install safe `.mobileconfig` profiles.

### 📦 jedXIP  
Full ZIP archive manager for creating and editing archives.

---

## ⚙️ Internal Architecture

## `jed` — *Jailed Environment Diagnostics*  
The core system that powers all modules.  
Handles info gathering, sandboxed access, and keeps everything running smoothly.

### `jedOS` — *Jailed Environment Diagnostics Operating Support*  
Lightweight runtime managing iOS compatibility and module behavior.  
> ⚠️ Not an operating system — it doesn’t modify or replace iOS.

---

## ✅ Requirements

- iOS 15.0 or later  
- Works on all iPhones and iPods  
- No jailbreak required  
- Internet only needed for:
  - IPSW download links  
  - TSS signing status  
  - Update metadata from GitHub  
  - Wi-Fi testing  
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
- **jedOSSecuCheck 3.1** ensures maximum module protection against tampering  

---

## 🧪 Technology Stack

- Language: `Swift 5.0+`  
- UI Framework: `SwiftUI + UIKit`  
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

# jedToolKit

> What started as a side project is now a growing toolkit for jailed iOS devices.

**Version:** 26.1.2 *(jedBrrr)*  
**Developer:** jedPlatforms  

`jedToolKit` is a modular diagnostics and utility suite designed for **jailed iOS devices** running **iOS 15 and later** — no jailbreak required.

---

## Included Modules

### jedDiskChecker
Accurately measures your device's storage performance with an optimized benchmarking engine featuring Live Logs and a high-performance I/O engine.

### jedPhoneInfo
Displays comprehensive device information including battery, CPU, memory, display, storage, hardware identifiers, Action Button detection, and more.

### jedHWChecker
Test 18 hardware components including camera, display, speakers, microphones, Wi-Fi, Bluetooth, sensors, physical buttons, vibration, and a new Battery Diagnostics (Beta) suite featuring charge cycle reporting, battery authenticity validation, and real-time amperage monitoring.

### jedBenchmark 2
Task-based performance benchmarking redesigned with dynamic hardware tiering, legacy device optimizations, safe multi-core concurrency, adaptive memory management, and improved benchmark accuracy across supported Apple devices.

### jedOSSecuCheck 4.0
Offline environment assessment and local anti-tampering core featuring dual-phase verification, low-level heuristic scanning, and dynamic environment verification to ensure application health.

### jedAccount
Offline profile management with customizable usernames, profile pictures, and pinned modules.

### App Lock
Protect jedToolKit using a local passcode with Face ID and Touch ID authentication.

### jedTerminal
Terminal-inspired interface with real-time diagnostics, URLSession-powered utilities, storage inspection, and contextual status indicators.

### IPSW Download Helper
Download IPSW firmware directly from IPSW.me with signing status information.

### jedTSSChecker
Check iOS firmware signing status.

### jedUpdateChecker
Native update interface for checking the latest jedToolKit releases.

### jedPanicAnalyzer
Analyze over 100 iOS and macOS panic log patterns completely offline.

### jedAI (Alpha)
Experimental AI module currently under active development.

### IconThemer
Customize Home Screen icons using Apple's Shortcuts app.

### jedSysPatcher
Manage OTA update blocking and install supported configuration profiles.

### jedXIP
Create, extract, and manage ZIP archives directly within jedToolKit.

---

## Internal Architecture

### `jedOSSecuCheck 4.0` — *Core Security Engine*

The foundational subsystem responsible for verifying application health and execution environment integrity. It ensures that `jedToolKit` runs in a secure state, shielding the toolkit from unauthorized modifications and runtime anomalies through robust environment checks.

### `jedAS` — *Jailed Environment Diagnostics Application Shell*

The high-level application orchestration framework, layout coordinator, and configuration harness that unifies the user interface, module routing, and shared app-level presentation services.

> **Note:** `jedAS` is **not** an operating system. It represents the interface manager and application harness. It does not modify, replace, or extend iOS.

---

## Requirements

- iOS 15.0 or later
- Compatible with supported iPhone and iPod touch models
- No jailbreak required

Internet connection is required only for:

- IPSW downloads
- Firmware signing information
- Application update metadata

Bluetooth permission is used exclusively for:

- Bluetooth diagnostics
- Cellular and VoLTE testing

---

## Security & Privacy

- Fully sandbox compliant
- Offline-first architecture
- No jailbreak required
- No UDIDs, serial numbers, or personal information collected
- No telemetry or user tracking
- Internet access is only used for optional online services
- Bluetooth permission is never used for tracking
- `jedOSSecuCheck 4.0` provides hardware environmental checks for active runtime safety.

---

## Technology Stack

- **Language:** Swift 5+
- **Frameworks:** SwiftUI + UIKit (Dynamic View Hosting Controller)
- **Architecture:** Modular, sandbox-compliant decoupled presentation design
- **Core Security Engine:** `jedOSSecuCheck 4.0`
- **Application Shell:** `jedAS 5.0`

---

## What's New in 26.1.2

### Core System Cleanup

- The legacy 'jed' and 'jedOS' labels have been officially removed from the architecture to properly showcase the true core frameworks of the application: jedOSSecuCheck and jedUI.

---

## Built With

- **Swift** — Native, fast, and reliable
- **Coffee** — Always
- **Passion** — Built for the iOS community
- **Worship Music** — Built between worship sets and development sprints

---

## Website

**jedPlatforms** https://jedplatforms.gt.tc

---

© 2026 jedPlatforms

For educational purposes only.

jedToolKit is an independent software project and is **not affiliated with or endorsed by Apple Inc.**

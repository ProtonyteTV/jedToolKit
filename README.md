# jedToolKit

> What started as a side project is now a growing toolkit for jailed iOS devices.

![Version](https://img.shields.io/badge/version-27.0.1%20\(jedIntelligence\)-blue)
![iOS Target](https://img.shields.io/badge/iOS-15.0%2B-black)
![License](https://img.shields.io/badge/Jailbreak-Not%20Required-success)

`jedToolKit` is a modular diagnostics and utility suite designed for **jailed iOS devices** running **iOS 15 and later** — no jailbreak required.

---

> **Also on Android:** [jedToolKit 1.0](https://github.com/exosennnn/jedToolKit) (codename **jedIntelligence**). The Android app is **open source**; this repository covers the iOS version only.

## What's New in v27.0.1

### jedAI Recents Widget

* **Home Screen Integration:** Access your recent `jedAI` conversations directly from your Home Screen.
* **Detailed Insights:** View active conversation modes, titles, latest messages, and timestamps (`2h ago`).
* **Direct Navigation:** Tap any conversation to jump directly back into the session.

### Widget Refinements & Sync

* **Redesigned UI:** Updated with expanded large-title styling, tinted rounded-square badges, and card-style row layouts.
* **Live Sync:** Instant automatic updates across new messages, replies, and deleted conversations.
* **Clearer Error Diagnostics:** Enhanced error-state messaging for sideloaded installations, distinguishing sync issues from setup or reinstallation requirements.

<details>
<summary><b>View Legacy Updates (v26.4)</b></summary>

### Version 26.4

* **Dual Update Tracks:** Support for Stable and Legacy release channels.
* **Header Release Switcher:** Quick-toggle switcher integrated into the header.
* **Persistent Preferences:** Selected release track is saved across launches.
* **Context-Aware Status Cards:** Clear indicators for active reporting tracks.

</details>

---

## Included Modules

`jedToolKit` is organized into focused modules, each designed to handle a specific diagnostic, performance, security, or system-utility task.

| Category         | Module                 | Description                                                                                                                                                                                                                  |
| :--------------- | :--------------------- | :--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Intelligence** | **jedAI (Beta)**       | Fully on-device assistant built on Apple's Foundation Models framework. Offers a **Diagnostics Assistant** mode that reads live device, storage, CPU, RAM, and system status (and can run jedBenchmark 2 on request) and a **General Chatbot** mode. Conversations are stored locally in jedAI Recents and feed the Home Screen widget. |
| **Diagnostics**  | **jedRAMChecker**      | Monitors memory usage in real time using `phys_footprint`, memory headroom, Mach VM statistics, and memory-pressure data.                                                                                                    |
|                  | **jedPhoneInfo**       | Detailed device intelligence including per-core CPU usage, process and thread information, Metal GPU details, ANE capabilities, and hardware insights.                                                                       |
|                  | **jedDiskChecker**     | Measures storage performance with live I/O monitoring, optimized test routines, and detailed performance logging.                                                                                                            |
|                  | **jedHWChecker**       | 18 guided hardware tests plus Battery Health Info. Covers display, brightness, touch, charger, physical buttons, biometrics, gyroscope, accelerometer, magnetometer, proximity, vibration, speaker, microphone, camera, LED flash, Wi-Fi, Bluetooth, and Cellular/VoLTE. Results are rolled into a single health score (pass, partial, fail). |
| **Performance**  | **jedBenchmark 2**     | Lightweight benchmark suite covering CPU (single and multi-core), RAM, and Metal GPU workloads. Each test is scored against a 2500-point baseline, with dynamic hardware classification and multi-core safety controls.        |
| **Security**     | **jedOSSecuCheck 4.1** | Offline security and environment assessment with heuristic scanning, **Fast** and **Deep Core** scan profiles, runtime verification, and detection of jailbreak environments, runtime tampering, and active debug hooks. On a compromised device the app falls back to **jedToolKit (Lite)** with a reduced toolset. |
|                  | **App Lock**           | Local passcode protection with optional Face ID or Touch ID authentication.                                                                                                                                                  |
| **Utilities**    | **jedTerminal Lite**   | Sandboxed terminal with command history, command recall (`▲`/`▼`), and a protected 500-line session buffer. Commands: `help`, `device`, `ping <host>`, `meminfo`, `df`, `ls`, `battery`, `uptime`, `date`, `jtkcheck`, `clear`. |
|                  | **IPSW Downloader**    | Browses signed and unsigned firmware for your device (via the ipsw.me API) with in-app download management, resumable downloads, automatic retry, and SHA256 checksum verification.                                          |
|                  | **jedTSSChecker**      | Shows which iOS versions Apple is currently signing for your device, with pull-to-refresh and Offline Mode awareness.                                                                                                        |
|                  | **jedPanicAnalyzer**   | Offline panic-log analyzer with 38 bundled signatures loaded from `panic_signatures.json` and compiled once for fast matching.                                                                                               |
|                  | **jedXIP**             | ZIP archive manager for creating, viewing, editing, and extracting archives with duplicate handling and collision-free file paths.                                                                                           |
|                  | **Icon Themer**        | Batch home screen icon customization using WebClip-based configuration profiles (`.mobileconfig`) with your own photos, colors, or SF Symbols.                                                                                |
|                  | **jedSysPatcher**      | Configuration-profile utility for installing the **OTA Update Blocker** and the **SSL & DoH Fix**.                                                                                                                           |
|                  | **jedAccount**         | Local profile system with custom usernames, avatars, and module pinning. Nothing leaves the device.                                                                                                                          |
|                  | **jedOSUpdateChecker** | Native update checker for new `jedToolKit` releases, with **Stable** and **Legacy** release channels.                                                                                                                         |

---

## Architecture & Security

### Key Subsystems

* **`jedOSSecuCheck 4.1` (Core Security Engine):** Evaluates runtime integrity and application health via low-level environmental verification, ensuring safe execution within the sandbox.
* **`jedUI 6.0` (Presentation Shell):** Powers navigation, theme synchronization, profile management, and dynamic layout rendering.
  *Note: `jedUI 6.0` is an application interface harness and does not modify or extend iOS.*

### Privacy Principles

* **100% Sandbox Compliant** — Works within strict stock iOS limits.
* **Offline-First** — Offline Mode is on by default. Zero telemetry, zero tracking, no cloud sync, and no collection of UDIDs, serial numbers, or personal data.
* **No Servers** — jedPlatforms does not operate any backend, so there is nowhere for user data to be sent.
* **On-Device AI** — jedAI runs entirely on the device through Apple Intelligence. Prompts and conversations are never sent to jedPlatforms, Apple, or anyone else.
* **Minimal Permissions** — Requested only when a feature needs them:
  * **Network:** update checks, jedTSSChecker lookups, IPSW downloads, the Wi-Fi test in jedHWChecker, and the `ping` command in jedTerminal Lite.
  * **Photos:** picking icons in Icon Themer.
  * **Files:** importing and exporting panic logs and IPSW files, and creating, editing, and extracting ZIPs.
  * **Biometrics:** the Biometric Test and App Lock.
  * **Bluetooth:** the Bluetooth connectivity test.

The full policy is available in the app under **Privacy Policy**.

---

## Requirements

### jedToolKit Core

```
jedToolKit Core
├── OS: iOS 15.0 or later
└── Device: iPhone 6s or later
```

### jedAI (Beta)

```
jedAI (Beta)
├── OS: iOS 26.0 or later
├── Device: iPhone 15 Pro or later
└── Setup: Apple Intelligence enabled + on-device model downloaded
```

---

## Tech Stack

* **Language:** Swift 5+
* **Frameworks:** SwiftUI, UIKit (hybrid `jedUI` engines), Foundation Models (jedAI)
* **Low-Level Subsystems:** Darwin C APIs (`host_processor_info`, `task_threads`, `host_statistics64`, `task_info`), Metal API
* **Developer:** jedPlatforms ([Website](https://jedplatforms.gt.tc))

---

.--- / . / -.. / .. / .- / ....   / .-. / . / -..

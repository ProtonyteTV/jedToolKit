# jedToolKit

> What started as a side project is now a growing toolkit for jailed iOS devices.

![Version](https://img.shields.io/badge/version-27.0.1%20\(jedIntelligence\)-blue)
![iOS Target](https://img.shields.io/badge/iOS-15.0%2B-black)
![License](https://img.shields.io/badge/Jailbreak-Not%20Required-success)

`jedToolKit` is a modular diagnostics and utility suite designed for **jailed iOS devices** running **iOS 15 and later** — no jailbreak required.

---

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

| Category         | Module                 | Description                                                                                                                                                 |
| :--------------- | :--------------------- | :---------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Intelligence** | **jedAI (Beta)**       | On-device diagnostic assistant powered by Apple Foundation Models, featuring dual chat modes, local conversation history, and a Home Screen Recents widget. |
| **Diagnostics**  | **jedRAMChecker**      | Monitors memory usage in real time using `phys_footprint`, memory headroom, Mach VM statistics, and memory-pressure data.                                   |
|                  | **jedPhoneInfo**       | Detailed device intelligence including per-core CPU usage, process and thread information, Metal GPU details, ANE capabilities, and hardware insights.      |
|                  | **jedDiskChecker**     | Measures storage performance with live I/O monitoring, optimized test routines, and detailed performance logging.                                           |
|                  | **jedHWChecker**       | Comprehensive hardware diagnostics covering 18 components, including cameras, audio, sensors, buttons, and battery health information.                      |
| **Performance**  | **jedBenchmark 2**     | Advanced device benchmarking with dynamic hardware classification, Metal-accelerated workloads, RAM testing, and multi-core safety controls.                |
| **Security**     | **jedOSSecuCheck 4.1** | Offline security and environment assessment with heuristic scanning, Fast and Deep Core profiles, runtime verification, and anti-tampering checks.          |
|                  | **App Lock**           | Local passcode protection with optional Face ID or Touch ID authentication.                                                                                 |
| **Utilities**    | **jedTerminal**        | Lightweight terminal environment with command history, command recall (`▲`/`▼`), a protected 500-line session buffer, and `URLSession` utilities.           |
|                  | **IPSW Downloader**    | Firmware download utility with signing-status information, connection recovery, and automatic checksum verification and retry handling.                     |
|                  | **jedTSSChecker**      | Firmware signing-status checker with live status updates, offline caching, and pull-to-refresh support.                                                     |
|                  | **jedPanicAnalyzer**   | Offline panic-log analyzer supporting 38 iOS/macOS panic patterns with optimized signature matching.                                                        |
|                  | **jedXIP**             | ZIP archive manager for creating, extracting, and managing archives with duplicate handling and collision-free file paths.                                  |
|                  | **Icon Themer**        | Batch application icon customization through Apple Shortcuts integration.                                                                                   |
|                  | **jedSysPatcher**      | Configuration-profile utility for managing supported OTA update-blocking configurations.                                                                    |
|                  | **jedAccount**         | Local profile system with custom usernames, avatars, and module pinning.                                                                                    |
|                  | **jedUpdateChecker**   | Native update checker for monitoring new `jedToolKit` releases.                                                                                             |


---

## Architecture & Security

### Key Subsystems

* **`jedOSSecuCheck 4.1` (Core Security Engine):** Evaluates runtime integrity and application health via low-level environmental verification, ensuring safe execution within the sandbox.
* **`jedUI 6.0` (Presentation Shell):** Powers navigation, theme synchronization, profile management, and dynamic layout rendering.
  *Note: `jedUI 6.0` is an application interface harness and does not modify or extend iOS.*

### Privacy Principles

* **100% Sandbox Compliant** — Works within strict stock iOS limits.
* **Offline-First** — Zero telemetry, zero tracking, and no collection of UDIDs, serial numbers, or personal data.
* **Minimal Permissions** — Internet and Bluetooth access are restricted strictly to user-initiated diagnostic routines.

---

## Requirements

### jedToolKit Core


jedToolKit Core
├── OS: iOS 15.0 or later
└── Device: iPhone 6s or later


### jedAI (Beta)


jedAI (Beta)
├── OS: iOS 26.0 or later
├── Device: iPhone 15 Pro or later
└── Setup: Apple Intelligence enabled + on-device model downloaded

---

## Tech Stack

* **Language:** Swift 5+
* **Frameworks:** SwiftUI, UIKit
* **Low-Level Subsystems:** Darwin C APIs (`host_processor_info`, `task_threads`, `host_statistics64`, `task_info`), Metal API
* **Developer:** jedPlatforms ([Website](https://jedplatforms.gt.tc))

---

.--- / . / -.. / .. / .- / ....   / .-. / . / -..


# jedToolKit

> What started as a side project is now a growing toolkit for jailed iOS devices.

**Version:** 27.0.1 **(jedIntelligence)**

**Developer:** jedPlatforms  

`jedToolKit` is a modular diagnostics and utility suite designed for **jailed iOS devices** running **iOS 15 and later** — no jailbreak required.

---

## Legacy Version Updates

### Version 26.4
**Release Date:** September 15, 2026

#### Software Update & Multi-Channel Support
- **Dual Update Tracks:** Added support for Stable and Legacy release channels, allowing you to choose between standard releases and legacy compatibility feeds.
- **Header Release Switcher:** Integrated an intuitive track switcher into the header for seamless toggling between release feeds with instant status refreshing.
- **Persistent Preferences:** Your selected update channel is automatically saved and remembered across app launches.
- **Context-Aware Status Cards:** Update cards and status displays now clearly indicate which release track is actively reporting status.

---

## Included Modules

### jedAI (Beta)
On-device intelligence module powered directly by Apple's Foundation Models framework. Features a flat themed conversation experience matching your accent color, dedicated chat modes (Diagnostics Assistant vs. General Chatbot), automatic local chat history saved in Recents, and a Home Screen Recents widget for quickly returning to recent conversations.

### jedRAMChecker
Real-time physical memory footprint monitoring (`phys_footprint`), available allocation headroom (`os_proc_available_memory`), Mach kernel memory pressure tracking, live footprint sampling graphs, memory diagnostics summaries, and capability checks for native 64-bit address space, paid Apple Developer Extended Virtual Addressing entitlement (`com.apple.developer.kernel.extended-virtual-addressing`), Increased Memory Limit entitlement (`com.apple.developer.kernel.increased-memory-limit`), and Mach VM page statistics (Wired, Active, Inactive, Swap Compressed, and Purges).

### jedPhoneInfo
Displays comprehensive device information including live per-core CPU load profiling (Performance vs. Efficiency cores), process CPU usage and Mach thread counts, Metal GPU identification, Apple Neural Engine (ANE) TOPS mapping, physical memory footprint, available headroom, kernel memory pressure state, battery, display, storage, hardware identifiers, Action Button detection, and dynamic accent color support.

### jedBenchmark 2
Task-based performance benchmarking redesigned with dynamic hardware tiering, pre-compiled Metal shaders for steady Graphics scores, single-buffer RAM testing, lightweight RNG for accurate random-access memory bandwidth, and safe multi-core concurrency to prevent jetsam crashes.

### jedDiskChecker
Accurately measures your device's storage performance with an optimized benchmarking engine featuring Live Logs and a high-performance I/O engine.

### jedHWChecker
Test 18 hardware components including camera, display, speakers, microphones, Wi-Fi, Bluetooth, sensors, physical buttons, vibration, and a Battery Diagnostics suite featuring charge cycle reporting, battery authenticity validation, and real-time amperage monitoring.

### jedOSSecuCheck 4.1
Offline environment assessment and local anti-tampering core featuring dual-phase verification, low-level heuristic scanning, dynamic environment verification, decoupled profile selection (Fast Mode vs. Deep Core), hardened app verification routines, and an explicit manual diagnostic trigger to ensure application health.

### jedAccount
Offline profile management with customizable usernames, profile pictures, character limit counters, unsaved change alerts, active Save state verification, and pinned modules.

### App Lock
Protect jedToolKit using a local passcode with Face ID and Touch ID authentication. Disabling App Lock now requires biometric or passcode verification for enhanced security.

### jedTerminal
Terminal-inspired interface with real-time diagnostics, lazy line rendering, 500-line history protection, ▲/▼ command recall, color-coded console output, text selection support, URLSession-powered utilities, storage inspection, and contextual status indicators.

### IPSW Downloader
Browse and download IPSW firmware directly with signing status information, automatic checksum verification retries, connection drop resumption, and immediate download starts.

### jedTSSChecker
Check iOS firmware signing status in real-time with pull-to-refresh support, manual retries, cached date formatters, and offline data preservation.

### jedUpdateChecker
Native update interface for checking the latest jedToolKit releases.

### jedPanicAnalyzer
Analyze 38 iOS and macOS panic log patterns offline with background log parsing, single-pass signature compilation, native report sharing, and an intuitive overflow menu.

### Icon Themer
Customize Home Screen icons using Apple's Shortcuts app. Batch-create and install multiple themed icons at once.

### jedSysPatcher
Manage OTA update blocking and install supported configuration profiles.

### jedXIP
Create, extract, and manage ZIP archives directly within jedToolKit with seamless folder navigation, automatic duplicate naming conflict handling, collision-free extraction paths, and Recents cleanup.

---

## Internal Architecture

### `jedOSSecuCheck 4.1` — *Core Security Engine*

The foundational subsystem responsible for verifying application health and execution environment integrity. It ensures that `jedToolKit` runs in a secure state, shielding the toolkit from unauthorized modifications and runtime anomalies through robust environment checks.

### `jedUI 6.0` — *Jailed Environment Diagnostics User Interface*

The core UI/UX experience. Powers the application's layout, navigation flow, profile photo synchronization across Settings, persistent accent color preferences, and modular presentation shell.

> **Note:** `jedUI 6.0` is **not** an operating system. It represents the interface manager and application harness. It does not modify, replace, or extend iOS.

---

## Requirements

### jedToolKit
- **OS:** iOS 15.0 or later
- **Device:** iPhone 6s or later
- No jailbreak required

### jedAI (Beta)
- **OS:** iOS 26.0 or later
- **Device:** iPhone 15 Pro or later
- **Configuration:** Apple Intelligence enabled with the on-device model downloaded

Internet connection is required only for:
- IPSW downloads
- Firmware signing information
- Application update metadata
- jedHWChecker Wi-Fi testing

Bluetooth permission is used exclusively for:
- jedHWChecker Bluetooth testing
- jedHWChecker Cellular and VoLTE testing
- Battery & BT Accessories

---

## Security & Privacy

- Fully sandbox compliant
- Offline-first architecture
- No jailbreak required
- No UDIDs, serial numbers, or personal information collected
- No telemetry or user tracking
- Internet access is only used for optional online services
- Bluetooth permission is never used for tracking
- `jedOSSecuCheck 4.1` provides hardware environmental checks for active runtime safety.

---

## Technology Stack

- **Language:** Swift 5+
- **Low-Level APIs:** Darwin C Kernels (`host_processor_info`, `task_threads`, `host_statistics64`, `task_info`), Metal
- **Frameworks:** SwiftUI + UIKit (Dynamic View Hosting Controller)
- **Architecture:** Modular, sandbox-compliant decoupled presentation design
- **Core Security Engine:** `jedOSSecuCheck 4.1`
- **Application Shell:** `jedUI 6.0`

---

## What's New in 27.0.1

### jedAI Recents Widget

- **New Home Screen Widget:** See your most recent jedAI conversations directly from the Home Screen.
- **Conversation Details:** View the conversation mode, title, latest message, and when you last used it.
- **Quick Access:** Tap a conversation to jump straight back into jedAI.

### Refreshed Widget Design

- **Expanded Title Style:** Updated the jedAI widget with a wider title style matching the app's large-title design.
- **Tinted Icon Badges:** Conversation icons now use tinted rounded-square badges.
- **Card-Style Rows:** Recent conversations are displayed using clean card-style layouts.
- **Relative Timestamps:** Recent conversations show friendly timestamps such as “2h ago.”

### Live Widget Sync

- **Automatic Updates:** New conversations, replies, and deleted conversations are automatically reflected in the widget.
- **Recents Synchronization:** The Home Screen widget stays synchronized with your jedAI Recents.

### Clearer Widget Troubleshooting

- **Improved Error States:** Widget messages now distinguish between a synchronization issue and an installation or configuration issue.
- **Easier Recovery:** Clearer guidance helps determine whether the widget needs to sync again or jedToolKit needs to be reinstalled.
- **Sideloading Improvements:** Troubleshooting is clearer for users running sideloaded installations.

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

# jedToolKit

> What started as a side project is now a growing toolkit for jailed iOS devices.

**Version:** 26.3  
**Developer:** jedPlatforms  

`jedToolKit` is a modular diagnostics and utility suite designed for **jailed iOS devices** running **iOS 15 and later** — no jailbreak required.

---

## Included Modules

### jedRAMChecker
Real-time physical memory footprint monitoring (`phys_footprint`), available allocation headroom (`os_proc_available_memory`), Mach kernel memory pressure tracking, live footprint sampling graphs, memory diagnostics summaries, and capability checks for native 64-bit address space, paid Apple Developer Extended Virtual Addressing entitlement (`com.apple.developer.kernel.extended-virtual-addressing`), Increased Memory Limit entitlement (`com.apple.developer.kernel.increased-memory-limit`), and Mach VM page statistics (Wired, Active, Inactive, Swap Compressed, and Purges).

### jedPhoneInfo
Displays comprehensive device information including live per-core CPU load profiling (Performance vs. Efficiency cores), process CPU usage and Mach thread counts, Metal GPU identification, Apple Neural Engine (ANE) TOPS mapping, physical memory footprint, available headroom, kernel memory pressure state, battery, display, storage, hardware identifiers, Action Button detection, and dynamic accent color support.

### jedBenchmark 2
Task-based performance benchmarking redesigned with dynamic hardware tiering, legacy device optimizations, safe multi-core concurrency, real-time memory headroom tracking to prevent jetsam crashes during RAM testing, and improved benchmark accuracy across supported Apple devices.

### jedDiskChecker
Accurately measures your device's storage performance with an optimized benchmarking engine featuring Live Logs and a high-performance I/O engine.

### jedHWChecker
Test 18 hardware components including camera, display, speakers, microphones, Wi-Fi, Bluetooth, sensors, physical buttons, vibration, and a Battery Diagnostics suite featuring charge cycle reporting, battery authenticity validation, and real-time amperage monitoring.

### jedOSSecuCheck 4.0
Offline environment assessment and local anti-tampering core featuring dual-phase verification, low-level heuristic scanning, dynamic environment verification, decoupled profile selection (Fast Mode vs. Deep Core), and an explicit manual diagnostic trigger to ensure application health.

### jedAccount
Offline profile management with customizable usernames, profile pictures, and pinned modules.

### App Lock
Protect jedToolKit using a local passcode with Face ID and Touch ID authentication.

### jedTerminal
Terminal-inspired interface with real-time diagnostics, URLSession-powered utilities, storage inspection, and contextual status indicators.

### IPSW Download Helper
Download IPSW firmware directly from IPSW.me with signing status information.

### jedTSSChecker
Check iOS firmware signing status in real-time.

### jedUpdateChecker
Native update interface for checking the latest jedToolKit releases.

### jedPanicAnalyzer
Analyze over 100 iOS and macOS panic log patterns completely offline.

### jedAI (Alpha)
Experimental AI module currently under active development.

### IconThemer
Customize Home Screen icons using Apple's Shortcuts app. Batch-create and install multiple themed icons at once.

### jedSysPatcher
Manage OTA update blocking and install supported configuration profiles.

### jedXIP
Create, extract, and manage ZIP archives directly within jedToolKit.

---

## Internal Architecture

### `jedOSSecuCheck 4.0` — *Core Security Engine*

The foundational subsystem responsible for verifying application health and execution environment integrity. It ensures that `jedToolKit` runs in a secure state, shielding the toolkit from unauthorized modifications and runtime anomalies through robust environment checks.

### `jedUI` — *Jailed Environment Diagnostics User Interface*

The core UI/UX experience. Powers the application's layout, navigation flow, and modular presentation shell.

> **Note:** `jedUI` is **not** an operating system. It represents the interface manager and application harness. It does not modify, replace, or extend iOS.

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
- **Low-Level APIs:** Darwin C Kernels (`host_processor_info`, `task_threads`, `host_statistics64`, `task_info`), Metal
- **Frameworks:** SwiftUI + UIKit (Dynamic View Hosting Controller)
- **Architecture:** Modular, sandbox-compliant decoupled presentation design
- **Core Security Engine:** `jedOSSecuCheck 4.0`
- **Application Shell:** `jedUI 5.0`

---

## What's New in 26.3

### Low-Level CPU & Hardware Telemetry
- **Live Per-Core Gauges:** Real-time Mach kernel CPU profiling for Performance and Efficiency cores (`host_processor_info`).
- **Process & Thread Profiling:** Tracks active Mach task thread counts (`task_threads`) and process CPU utilization in real-time.
- **Hardware Engine Specs:** Metal GPU device detection and Apple Neural Engine (ANE) TOPS mapping covering all devices from iPhone X through iPhone 17 series, Air, 16e, and 17e.

### jedRAMChecker Capability Diagnostics
- **Capability Diagnostics:** Accurately distinguishes 64-bit address space, paid Developer Extended Virtual Addressing entitlement, Increased Memory Limit caps, and VM statistics access.
- **Mach VM Kernel Page Breakdown:** Live page allocation tracking for Wired, Active, Inactive, Swap Compressed memory, Page Size, and kernel purges.

### Security & UI Refinements
- **Refined Security Diagnostics:** Profile selection in `jedOSSecuCheck 4.0` (Fast Mode and Deep Core) now allows toggling scan profiles cleanly without triggering an automatic run, establishing "Execute Diagnostics" as the dedicated action button.
- **Universal Accent Color Integration:** Feature highlight views, CPU core progress bars, and module themes now dynamically adapt to your selected Accent Color and Multicolor mode settings in real-time.

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

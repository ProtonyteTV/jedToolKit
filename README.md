# ⚙️ jedToolKit Lite

> A powerful, jailbreak-free iOS toolkit built for developers, tinkerers, and power users — proudly made by Kyle G. F. Lambot and inspired by Jediah the bassist.

## 📱 What is jedToolKit?

**jedToolKit Lite** is a modular utility app for iOS 13 and up, offering system tweaks, diagnostics, and customization — all **without jailbreak**. It’s offline-first, secure, and crafted with UIKit for a fast and native experience.

---

## 🚀 Features

### 🔧 jedToolKit Modules
- **jedPhoneInfo** – View detailed device specs and check jedOS compatibility.
- **jedTSSChecker** – Live TSS status checker for Apple’s signing servers.
- **jedHWChecker** – Test speakers, sensors, battery info, Face ID, and more.
- **jedSysPatcher** – Install configuration profiles (e.g. OTA Blocker).
- **jedTerminal Lite** – Simulated terminal UI with built-in commands.

### 🎨 General Tools
- **IconThemer** – Generate .mobileconfig web clips with custom icons and URL schemes.
- **SSLFix Lite** – Restore SSL compatibility for legacy devices (iOS 13–14).
- **IPSW Downloader** – Quickly find and download IPSW files for your model.

### 🧑‍💻 About & Info
- **About** – The origin of jedToolKit and jedOS.
- **Developers** – Meet the people behind the project.
- **Privacy Policy** – Respect-first, no telemetry, local-only data access.

---

## 🔐 Privacy & Permissions

jedToolKit **does not collect personal data**. All operations are done locally.

Permissions used:
- 📷 Camera & 🎤 Microphone → For testing in `jedHWChecker`
- 🖼 Photos Access → For `IconThemer`
- 🌐 Network → Only to fetch Apple TSS/firmware data

---

## 🛠 Compatibility

- ✅ iOS 13.0 – iOS 17+
- 💻 Works on iPhone and iPad
- 🛠 Built with UIKit + Swift (no Storyboard)

---

## 👥 Credits

| ![pfp1](./Assets/pfp1.jpeg) Kyle Lambot | ![pfp2](./Assets/pfp2.jpeg) Jediah Red |
|----------------------------------------|----------------------------------------|
| Lead Developer                         | Quiet Inspiration                      |

> *“jedToolKit was born out of passion and perseverance. This toolkit is a tribute to the ones who silently push us forward.”* – Kyle

---

## 📦 Installation

IPA coming soon via:
- [TrollStore](https://github.com/opa334/TrollStore)
- [AltStore](https://altstore.io/)

Or build manually using Xcode:

```bash
git clone https://github.com/ProtonyteTV/jedToolKit
open jedToolKit.xcodeproj

//
//  jedTerminalLiteViewController.swift
//  jedToolKit
//
//  Created by aimic on 6/29/25.
//

import UIKit

class jedTerminalLiteViewController: UIViewController, UITextFieldDelegate {

    private let outputTextView = UITextView()
    private let inputTextField = UITextField()
    private var bottomConstraint: NSLayoutConstraint?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        title = "jedTerminal Lite"
        setupViews()
        registerKeyboardNotifications()
        appendOutput("jedTerminal Lite v1.0\nType 'help' to get started.\n")
    }

    private func setupViews() {
        outputTextView.translatesAutoresizingMaskIntoConstraints = false
        outputTextView.backgroundColor = .black
        outputTextView.textColor = .green
        outputTextView.font = UIFont.monospacedSystemFont(ofSize: 14, weight: .regular)
        outputTextView.isEditable = false

        inputTextField.translatesAutoresizingMaskIntoConstraints = false
        inputTextField.backgroundColor = .darkGray
        inputTextField.textColor = .white
        inputTextField.font = UIFont.monospacedSystemFont(ofSize: 14, weight: .regular)
        inputTextField.delegate = self
        inputTextField.placeholder = "Enter command..."
        inputTextField.layer.cornerRadius = 6
        inputTextField.setLeftPadding(8)

        view.addSubview(outputTextView)
        view.addSubview(inputTextField)

        bottomConstraint = inputTextField.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -8)

        NSLayoutConstraint.activate([
            outputTextView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            outputTextView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            outputTextView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),
            outputTextView.bottomAnchor.constraint(equalTo: inputTextField.topAnchor, constant: -8),

            inputTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            inputTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),
            inputTextField.heightAnchor.constraint(equalToConstant: 40),
            bottomConstraint!
        ])
    }

    private func registerKeyboardNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(handleKeyboard(_:)), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
    }

    @objc private func handleKeyboard(_ notification: Notification) {
        guard let userInfo = notification.userInfo,
              let frame = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect,
              let duration = userInfo[UIResponder.keyboardAnimationDurationUserInfoKey] as? TimeInterval else { return }

        let isKeyboardVisible = frame.origin.y < UIScreen.main.bounds.height
        bottomConstraint?.constant = isKeyboardVisible ? -frame.height - 8 : -8

        UIView.animate(withDuration: duration) {
            self.view.layoutIfNeeded()
        }
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        guard let input = textField.text?.trimmingCharacters(in: .whitespacesAndNewlines), !input.isEmpty else { return false }
        appendOutput("➜ \(input)")
        processCommand(input)
        textField.text = ""
        return true
    }

    private func appendOutput(_ text: String) {
        DispatchQueue.main.async {
            self.outputTextView.text += "\n\(text)"
            let bottom = NSRange(location: self.outputTextView.text.count - 1, length: 1)
            self.outputTextView.scrollRangeToVisible(bottom)
        }
    }

    private func processCommand(_ command: String) {
        switch command.lowercased() {
        case "help":
            appendOutput("""
            Available Commands:
            • device - Show device info
            • uptime - Show device uptime
            • battery - Show battery info
            • run hwcheck - Launch jedHWChecker
            • jedoscheck - Checks your Device is jedOS is compatible
            • clear - Clear terminal
            """)
        case "device":
            let device = UIDevice.current
            appendOutput("📱 Name: \(device.name)\n📦 Model: \(device.model)\n🧠 System: \(device.systemName) \(device.systemVersion)")
        case "uptime":
            let uptime = ProcessInfo.processInfo.systemUptime
            let formatter = DateComponentsFormatter()
            formatter.allowedUnits = [.day, .hour, .minute]
            formatter.unitsStyle = .full
            let result = formatter.string(from: uptime) ?? "Unavailable"
            appendOutput("⏱ Uptime: \(result)")
        case "battery":
            UIDevice.current.isBatteryMonitoringEnabled = true
            let level = Int(UIDevice.current.batteryLevel * 100)
            let state = UIDevice.current.batteryState
            var stateText = "Unknown"
            switch state {
            case .charging: stateText = "Charging"
            case .full: stateText = "Full"
            case .unplugged: stateText = "Unplugged"
            default: break
            }
            appendOutput("🔋 Battery: \(level)% - \(stateText)")
        case "run hwcheck":
            let vc = jedHWCheckerViewController()
            navigationController?.pushViewController(vc, animated: true)
        case "clear":
            outputTextView.text = ""
        case "jediah":
            appendOutput("""
            🎸 Tribute to Jediah Red and quiet inspiration behind jedToolKit and jedOS.

            The name 'jedOS' is a tribute to someone very special in Kyle's journey:
            Jediah the bassist. It combines individuality, legacy, and resilience.

            More than a name — it's a tribute.
            """)
        case "jedoscheck":
            let version = UIDevice.current.systemVersion
            appendOutput("🔍 iOS Version: \(version)\n\(isCompatibleWithJedOS(systemVersion: version))")
        default:
            appendOutput("❌ Unknown command: \(command)")
        }
    }

    private func isCompatibleWithJedOS(systemVersion: String) -> String {
        guard let major = Int(systemVersion.split(separator: ".").first ?? "0") else { return "❓ Unknown iOS version" }

        switch major {
        case 13:
            return "✅ Your Device is Compatible with jedOS.13 — The legendary origin of the legacy movement — lightweight, snappy, and nostalgic to the bone."
        case 14:
            return "😅You’re running iOS 14, jedOS.14 is deprecated. Think of it as the filler arc of iOS, You're better off downgrading to jedOS.13 or upgrading to jedOS.15.1!"
        case 15:
            return "✅ Your Device is Compatible with jedOS.15.1 — Preserve the Legacy. Power the Present."
        case 16:
            return "🧪 jedOS.16 coming soon — Rooted in elegance and jailbreak tech."
        case 17:
            return "⚙️ jedOS.17 in development — Experimental UI and kernel blend."
        case 18:
            return "🤖 jedOS.18 – Will enable Apple Intelligence on unsupported devices."
        case 19:
            return "💠 jedOS.26 – LiquidGlass meets FlatDesign."
        default:
            return "⚠️ Unknown compatibility. jedOS may not support iOS \(systemVersion)."
        }
    }
}

// Padding helper
extension UITextField {
    func setLeftPadding(_ padding: CGFloat) {
        let spacer = UIView(frame: CGRect(x: 0, y: 0, width: padding, height: frame.height))
        leftView = spacer
        leftViewMode = .always
    }
}

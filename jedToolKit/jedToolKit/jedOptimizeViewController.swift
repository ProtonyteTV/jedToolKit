//
//  jedOptimizeViewController.swift
//  jedToolKit
//
//  Created by aimic on 6/29/25.
//

import UIKit
 
class jedOptimizeViewController: UIViewController {
 
    private let batteryLabel = UILabel()
    private let ramBar = UIProgressView(progressViewStyle: .default)
    private let uptimeLabel = UILabel()
    private let lowPowerButton = UIButton(type: .system)
    private let safariCacheButton = UIButton(type: .system)
    private let downloadShortcutsButton = UIButton(type: .system)
 
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "jedOptimize"
 
        setupUI()
        updateInfo()
    }
 
    private func setupUI() {
        batteryLabel.translatesAutoresizingMaskIntoConstraints = false
        batteryLabel.textAlignment = .center
 
        ramBar.translatesAutoresizingMaskIntoConstraints = false
        ramBar.progressTintColor = .systemGreen
 
        uptimeLabel.translatesAutoresizingMaskIntoConstraints = false
        uptimeLabel.textAlignment = .center
        uptimeLabel.font = UIFont.systemFont(ofSize: 14, weight: .medium)
 
        lowPowerButton.setTitle("Go to Low Power Mode Settings", for: .normal)
        lowPowerButton.addTarget(self, action: #selector(openBatterySettings), for: .touchUpInside)
        lowPowerButton.translatesAutoresizingMaskIntoConstraints = false
 
        safariCacheButton.setTitle("Clear Safari Cache (Manual)", for: .normal)
        safariCacheButton.addTarget(self, action: #selector(openSafariSettings), for: .touchUpInside)
        safariCacheButton.translatesAutoresizingMaskIntoConstraints = false
 
        downloadShortcutsButton.setTitle("Download RAM Clear Shortcut", for: .normal)
        downloadShortcutsButton.addTarget(self, action: #selector(downloadShortcut), for: .touchUpInside)
        downloadShortcutsButton.translatesAutoresizingMaskIntoConstraints = false
 
        view.addSubview(batteryLabel)
        view.addSubview(ramBar)
        view.addSubview(uptimeLabel)
        view.addSubview(lowPowerButton)
        view.addSubview(safariCacheButton)
        view.addSubview(downloadShortcutsButton)
 
        NSLayoutConstraint.activate([
            batteryLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            batteryLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
 
            ramBar.topAnchor.constraint(equalTo: batteryLabel.bottomAnchor, constant: 20),
            ramBar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            ramBar.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
 
            uptimeLabel.topAnchor.constraint(equalTo: ramBar.bottomAnchor, constant: 20),
            uptimeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
 
            lowPowerButton.topAnchor.constraint(equalTo: uptimeLabel.bottomAnchor, constant: 30),
            lowPowerButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
 
            safariCacheButton.topAnchor.constraint(equalTo: lowPowerButton.bottomAnchor, constant: 20),
            safariCacheButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
 
            downloadShortcutsButton.topAnchor.constraint(equalTo: safariCacheButton.bottomAnchor, constant: 20),
            downloadShortcutsButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
    }
 
    private func updateInfo() {
        UIDevice.current.isBatteryMonitoringEnabled = true
        let batteryLevel = Int(UIDevice.current.batteryLevel * 100)
        batteryLabel.text = "Battery Level: \(batteryLevel)%"
 
        ramBar.progress = getFakeRAMUsage()
 
        let uptime = ProcessInfo.processInfo.systemUptime
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.hour, .minute]
        formatter.unitsStyle = .short
        uptimeLabel.text = "Uptime: \(formatter.string(from: uptime) ?? "Unknown")"
    }
 
    private func getFakeRAMUsage() -> Float {
        // Fake RAM usage bar: just simulate light (0.3), moderate (0.6), heavy (0.9)
        let uptime = ProcessInfo.processInfo.systemUptime
        if uptime < 1800 { return 0.3 }
        if uptime < 7200 { return 0.6 }
        return 0.9
    }
 
    @objc private func openBatterySettings() {
        if let url = URL(string: "App-Prefs:root=BATTERY_USAGE"), UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url)
        }
    }
 
    @objc private func openSafariSettings() {
        if let url = URL(string: "App-Prefs:root=Safari"), UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url)
        }
    }
 
    @objc private func downloadShortcut() {
        if let url = URL(string: "https://www.icloud.com/shortcuts/6cc7b4905ee5487bb8ff6b92fdb3ff70") {
            UIApplication.shared.open(url)
        }
    }
}

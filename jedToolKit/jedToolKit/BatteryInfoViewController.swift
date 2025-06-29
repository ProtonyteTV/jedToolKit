//
//  BatteryInfoViewController.swift
//  jedToolKit
//
//  Created by aimic on 6/29/25.
//

import UIKit
 
class BatteryInfoViewController: UIViewController {
 
    private let infoLabel = UILabel()
 
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Battery Info"
 
        UIDevice.current.isBatteryMonitoringEnabled = true
 
        setupUI()
        displayBatteryInfo()
 
        // Optional: Update when state changes
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(displayBatteryInfo),
                                               name: UIDevice.batteryLevelDidChangeNotification,
                                               object: nil)
 
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(displayBatteryInfo),
                                               name: UIDevice.batteryStateDidChangeNotification,
                                               object: nil)
    }
 
    private func setupUI() {
        infoLabel.translatesAutoresizingMaskIntoConstraints = false
        infoLabel.numberOfLines = 0
        infoLabel.font = .monospacedSystemFont(ofSize: 16, weight: .regular)
        infoLabel.textAlignment = .center
 
        view.addSubview(infoLabel)
 
        NSLayoutConstraint.activate([
            infoLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            infoLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            infoLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }
 
    @objc private func displayBatteryInfo() {
        let level = UIDevice.current.batteryLevel
        let batteryPercentage = Int(level * 100)
 
        let state: String
        switch UIDevice.current.batteryState {
        case .charging: state = "🔌 Charging"
        case .full: state = "🔋 Full"
        case .unplugged: state = "⚡️ Not Charging"
        default: state = "❓ Unknown"
        }
 
        let status = """
        🔋 Battery Info
        
        • Battery Level: \(batteryPercentage)%
        • Status: \(state)
        """
 
        infoLabel.text = status
    }
 
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}

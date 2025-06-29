//
//  ProximityTestViewController.swift
//  jedToolKit
//
//  Created by aimic on 6/29/25.
//

import UIKit
 
class ProximityTestViewController: UIViewController {
 
    private let statusLabel = UILabel()
 
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Proximity Test"
 
        setupLabel()
 
        UIDevice.current.isProximityMonitoringEnabled = true
 
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(proximityChanged),
            name: UIDevice.proximityStateDidChangeNotification,
            object: nil
        )
 
        updateStatus()
    }
 
    private func setupLabel() {
        statusLabel.translatesAutoresizingMaskIntoConstraints = false
        statusLabel.numberOfLines = 0
        statusLabel.textAlignment = .center
        statusLabel.font = .systemFont(ofSize: 20, weight: .medium)
        statusLabel.text = "Testing proximity sensor..."
 
        view.addSubview(statusLabel)
 
        NSLayoutConstraint.activate([
            statusLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            statusLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            statusLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }
 
    @objc private func proximityChanged() {
        updateStatus()
    }
 
    private func updateStatus() {
        let state = UIDevice.current.proximityState
        statusLabel.text = state
            ? "🟢 Object Detected Near the Sensor"
            : "⚪️ No Object Detected (Clear)"
    }
 
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        UIDevice.current.isProximityMonitoringEnabled = false
        NotificationCenter.default.removeObserver(self)
    }
}

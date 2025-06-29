//
//  GyroscopeTestViewController.swift
//  jedToolKit
//
//  Created by aimic on 6/29/25.
//

import UIKit
import CoreMotion
 
class GyroscopeTestViewController: UIViewController {
 
    private let motionManager = CMMotionManager()
    private let infoLabel = UILabel()
 
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Gyroscope Test"
 
        setupLabel()
        startGyroscopeUpdates()
    }
 
    private func setupLabel() {
        infoLabel.translatesAutoresizingMaskIntoConstraints = false
        infoLabel.numberOfLines = 0
        infoLabel.textAlignment = .center
        infoLabel.font = .monospacedSystemFont(ofSize: 16, weight: .regular)
        infoLabel.text = "Waiting for gyroscope data..."
 
        view.addSubview(infoLabel)
 
        NSLayoutConstraint.activate([
            infoLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            infoLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            infoLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }
 
    private func startGyroscopeUpdates() {
        guard motionManager.isGyroAvailable else {
            infoLabel.text = "❌ Gyroscope not available on this device."
            return
        }
 
        motionManager.gyroUpdateInterval = 0.2
 
        motionManager.startGyroUpdates(to: .main) { [weak self] data, error in
            guard let data = data else {
                self?.infoLabel.text = "Error getting gyroscope data: \(error?.localizedDescription ?? "Unknown error")"
                return
            }
 
            let x = String(format: "%.3f", data.rotationRate.x)
            let y = String(format: "%.3f", data.rotationRate.y)
            let z = String(format: "%.3f", data.rotationRate.z)
 
            self?.infoLabel.text = """
            📈 Gyroscope Rotation Rate
            
            • X: \(x)
            • Y: \(y)
            • Z: \(z)
            """
        }
    }
 
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        motionManager.stopGyroUpdates()
    }
}

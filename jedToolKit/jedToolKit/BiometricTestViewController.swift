//
//  BiometricsTestViewController.swift
//  jedToolKit
//
//  Created by aimic on 6/29/25.
//

import UIKit
import LocalAuthentication
 
class BiometricTestViewController: UIViewController {
 
    private let testButton = UIButton(type: .system)
    private let resultLabel = UILabel()
 
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Face ID / Touch ID Test"
        setupUI()
    }
 
    private func setupUI() {
        testButton.setTitle("🔐 Test Biometric Auth", for: .normal)
        testButton.titleLabel?.font = .systemFont(ofSize: 18, weight: .semibold)
        testButton.addTarget(self, action: #selector(runBiometricTest), for: .touchUpInside)
        testButton.translatesAutoresizingMaskIntoConstraints = false
 
        resultLabel.text = "Tap the button to test Face ID or Touch ID."
        resultLabel.numberOfLines = 0
        resultLabel.textAlignment = .center
        resultLabel.font = .systemFont(ofSize: 16)
        resultLabel.translatesAutoresizingMaskIntoConstraints = false
 
        view.addSubview(testButton)
        view.addSubview(resultLabel)
 
        NSLayoutConstraint.activate([
            testButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            testButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
 
            resultLabel.topAnchor.constraint(equalTo: testButton.bottomAnchor, constant: 20),
            resultLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            resultLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }
 
    @objc private func runBiometricTest() {
        let context = LAContext()
        var error: NSError?
 
        let reason = "Authenticate to verify biometric sensor is working."
 
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, evaluateError in
                DispatchQueue.main.async {
                    if success {
                        self.resultLabel.text = "✅ Biometric authentication succeeded!"
                    } else {
                        self.resultLabel.text = "❌ Failed: \(evaluateError?.localizedDescription ?? "Unknown error")"
                    }
                }
            }
        } else {
            let bioType: String
            if #available(iOS 11.0, *) {
                bioType = context.biometryType == .faceID ? "Face ID" : context.biometryType == .touchID ? "Touch ID" : "Biometrics"
            } else {
                bioType = "Biometrics"
            }
 
            resultLabel.text = "⚠️ \(bioType) not available or not set up on this device."
        }
    }
}

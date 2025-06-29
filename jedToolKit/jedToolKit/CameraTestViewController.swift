//
//  CameraTestViewController.swift
//  jedToolKit
//
//  Created by aimic on 6/29/25.
//

import UIKit
import AVFoundation
 
class CameraTestViewController: UIViewController {
 
    private let messageLabel = UILabel()
    private let openCameraButton = UIButton(type: .system)
 
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Camera Test"
 
        setupUI()
    }
 
    private func setupUI() {
        messageLabel.text = "Tap below to launch the camera and test if it works."
        messageLabel.textAlignment = .center
        messageLabel.numberOfLines = 0
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
 
        openCameraButton.setTitle("Open Camera", for: .normal)
        openCameraButton.titleLabel?.font = .boldSystemFont(ofSize: 18)
        openCameraButton.addTarget(self, action: #selector(openCamera), for: .touchUpInside)
        openCameraButton.translatesAutoresizingMaskIntoConstraints = false
 
        view.addSubview(messageLabel)
        view.addSubview(openCameraButton)
 
        NSLayoutConstraint.activate([
            messageLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
            messageLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            messageLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
 
            openCameraButton.topAnchor.constraint(equalTo: messageLabel.bottomAnchor, constant: 30),
            openCameraButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
 
    @objc private func openCamera() {
        switch AVCaptureDevice.authorizationStatus(for: .video) {
        case .authorized:
            presentCamera()
        case .notDetermined:
            AVCaptureDevice.requestAccess(for: .video) { granted in
                DispatchQueue.main.async {
                    if granted {
                        self.presentCamera()
                    } else {
                        self.showDeniedAlert()
                    }
                }
            }
        case .denied, .restricted:
            showDeniedAlert()
        @unknown default:
            showDeniedAlert()
        }
    }
 
    private func presentCamera() {
        guard UIImagePickerController.isSourceTypeAvailable(.camera) else {
            showAlert("Camera not available on this device.")
            return
        }
 
        let picker = UIImagePickerController()
        picker.sourceType = .camera
        picker.delegate = self
        present(picker, animated: true)
    }
 
    private func showDeniedAlert() {
        showAlert("Camera access denied. Please enable it in Settings > Privacy.")
    }
 
    private func showAlert(_ message: String) {
        let alert = UIAlertController(title: "Camera Test", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
}
 
// MARK: - UIImagePickerControllerDelegate
extension CameraTestViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true)
    }
 
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        dismiss(animated: true) {
            let alert = UIAlertController(title: "Camera Test", message: "✅ Photo captured successfully!", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Done", style: .default))
            self.present(alert, animated: true)
        }
    }
}

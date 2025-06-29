//
//  ShortcutThemerViewController.swift
//  jedToolKit
//
//  Created by aimic on 6/29/25.
//

import UIKit
import PhotosUI
import MobileCoreServices

class ShortcutThemerViewController: UIViewController, PHPickerViewControllerDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "IconThemer"
        label.font = UIFont.systemFont(ofSize: 26, weight: .semibold)
        label.textAlignment = .center
        return label
    }()

    private let appNameField: UITextField = {
        let field = UITextField()
        field.placeholder = "App Name (e.g. Instagram)"
        field.borderStyle = .roundedRect
        field.autocapitalizationType = .words
        return field
    }()

    private let urlSchemeField: UITextField = {
        let field = UITextField()
        field.placeholder = "App URL Scheme (e.g. instagram://)"
        field.borderStyle = .roundedRect
        field.autocapitalizationType = .none
        return field
    }()

    private let pickIconButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("📸 Pick Icon", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        button.layer.cornerRadius = 10
        button.backgroundColor = UIColor.systemGray6
        return button
    }()

    private let generateButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("⚙️ Generate Shortcut", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        button.layer.cornerRadius = 10
        button.backgroundColor = UIColor.systemBlue
        button.tintColor = .white
        return button
    }()

    private var base64Icon: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "IconThemer"

        setupUI()
        pickIconButton.addTarget(self, action: #selector(pickImage), for: .touchUpInside)
        generateButton.addTarget(self, action: #selector(generateShortcut), for: .touchUpInside)
    }

    private func setupUI() {
        let stack = UIStackView(arrangedSubviews: [titleLabel, appNameField, urlSchemeField, pickIconButton, generateButton])
        stack.axis = .vertical
        stack.spacing = 18
        stack.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stack)

        NSLayoutConstraint.activate([
            stack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            stack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            stack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            pickIconButton.heightAnchor.constraint(equalToConstant: 44),
            generateButton.heightAnchor.constraint(equalToConstant: 44)
        ])
    }

    @objc private func pickImage() {
        if #available(iOS 14, *) {
            var config = PHPickerConfiguration()
            config.filter = .images
            config.selectionLimit = 1

            let picker = PHPickerViewController(configuration: config)
            picker.delegate = self
            present(picker, animated: true)
        } else {
            let imagePicker = UIImagePickerController()
            imagePicker.sourceType = .photoLibrary
            imagePicker.delegate = self
            imagePicker.mediaTypes = [kUTTypeImage as String]
            present(imagePicker, animated: true)
        }
    }

    // iOS 14+ only
    @available(iOS 14, *)
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        dismiss(animated: true)
        guard let itemProvider = results.first?.itemProvider,
              itemProvider.canLoadObject(ofClass: UIImage.self) else { return }

        itemProvider.loadObject(ofClass: UIImage.self) { [weak self] image, _ in
            guard let self = self, let image = image as? UIImage else { return }
            self.handlePickedImage(image)
        }
    }

    // iOS 13 fallback
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        dismiss(animated: true)
        if let image = info[.originalImage] as? UIImage {
            handlePickedImage(image)
        }
    }

    private func handlePickedImage(_ image: UIImage) {
        if let imageData = image.pngData() {
            self.base64Icon = imageData.base64EncodedString()
            DispatchQueue.main.async {
                let alert = UIAlertController(title: "✅ Icon Added", message: "Image has been encoded successfully.", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Great", style: .default))
                self.present(alert, animated: true)
            }
        }
    }

    @objc private func generateShortcut() {
        guard let name = appNameField.text, !name.isEmpty,
              let urlScheme = urlSchemeField.text, !urlScheme.isEmpty,
              let base64Icon = base64Icon else {
            let alert = UIAlertController(title: "⚠️ Missing Info", message: "Please fill in all fields and pick an icon.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            present(alert, animated: true)
            return
        }

        let config = """
        <?xml version="1.0" encoding="UTF-8"?>
        <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
        <plist version="1.0">
        <dict>
            <key>PayloadContent</key>
            <array>
                <dict>
                    <key>FullScreen</key>
                    <true/>
                    <key>Icon</key>
                    <data>
                    \(base64Icon)
                    </data>
                    <key>IsRemovable</key>
                    <true/>
                    <key>Label</key>
                    <string>\(name)</string>
                    <key>PayloadDisplayName</key>
                    <string>\(name)</string>
                    <key>PayloadIdentifier</key>
                    <string>com.jedtoolkit.shortcut.\(name.lowercased())</string>
                    <key>PayloadType</key>
                    <string>com.apple.webClip.managed</string>
                    <key>PayloadUUID</key>
                    <string>\(UUID().uuidString)</string>
                    <key>PayloadVersion</key>
                    <integer>1</integer>
                    <key>Precomposed</key>
                    <true/>
                    <key>URL</key>
                    <string>\(urlScheme)</string>
                </dict>
            </array>
            <key>PayloadDisplayName</key>
            <string>Shortcut: \(name)</string>
            <key>PayloadIdentifier</key>
            <string>com.jedtoolkit.profile.\(UUID().uuidString)</string>
            <key>PayloadType</key>
            <string>Configuration</string>
            <key>PayloadUUID</key>
            <string>\(UUID().uuidString)</string>
            <key>PayloadVersion</key>
            <integer>1</integer>
        </dict>
        </plist>
        """

        let filename = "\(name.replacingOccurrences(of: " ", with: "_"))_shortcut.mobileconfig"
        let url = FileManager.default.temporaryDirectory.appendingPathComponent(filename)

        do {
            try config.write(to: url, atomically: true, encoding: .utf8)
            let activityVC = UIActivityViewController(activityItems: [url], applicationActivities: nil)
            present(activityVC, animated: true)
        } catch {
            let alert = UIAlertController(title: "❌ Error", message: "Failed to save profile.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            present(alert, animated: true)
        }
    }
}

//
//  PrivacyPolicyViewController.swift
//  jedToolKit
//
//  Created by aimic on 6/29/25.
//

import UIKit

class PrivacyPolicyViewController: UIViewController {

    private let textView: UITextView = {
        let tv = UITextView()
        tv.isEditable = false
        tv.isSelectable = true
        tv.isScrollEnabled = true
        tv.font = UIFont.systemFont(ofSize: 15)
        tv.textColor = .label
        tv.backgroundColor = .systemBackground
        tv.dataDetectorTypes = [.link]
        tv.translatesAutoresizingMaskIntoConstraints = false
        return tv
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Privacy Policy"
        view.backgroundColor = .systemBackground
        setupTextView()
        loadPolicyText()
    }

    private func setupTextView() {
        view.addSubview(textView)
        NSLayoutConstraint.activate([
            textView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            textView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            textView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            textView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }

    private func loadPolicyText() {
        textView.text = """
        📜 Privacy Policy for jedToolKit Lite

        Effective Date: June 29, 2025
        Developer: Kyle Genesis Fernando Lambot

        ———————————————————————
        1. Introduction
        Welcome to jedToolKit Lite. Your privacy is important to us. This Privacy Policy explains how we handle your information when you use our app. This app is designed to operate without collecting any personal data from you.

        2. Data Collection
        We do NOT collect:
        • Personal information (name, email, phone number)
        • Usage analytics
        • Device identifiers
        • Location data (unless explicitly required and permitted by you)

        Local Access Only:
        Some tools like jedPhoneInfo, jedHWChecker, and IPSW Downloader access system data locally to function. Nothing is ever sent outside your device.

        3. Permissions Used
        • Photos Access: Used only if you pick an image for icon theming via IconThemer. Your image is never uploaded.
        • Wi-Fi / Network Info: Used to show your current connection (e.g. in jedTSSChecker).
        • Camera & Microphone: Used by jedHWChecker to test those components.
        • File Access: Used to save .mobileconfig or IPSW files. No data leaves the device unless shared manually.

        4. Third-Party Access
        jedToolKit Lite does NOT use:
        • Analytics SDKs
        • Advertising frameworks
        • Tracking or crash logging tools
        The only server communication happens with Apple’s public services (e.g. IPSW.me).

        5. Data Security
        Because we don’t store or transmit personal data, your information stays completely private and local.

        6. Changes to This Policy
        This policy may be updated from time to time. Important changes will be noted in the changelog or during updates.

        7. Contact
        For questions or feedback:
        • Email: protoapps_protonytetv@gmail.com
        • X: https://x.com/ProtonyteTV

        ———————————————————————
        ✅ Your data stays with you.
        jedToolKit is built to be transparent, offline-first, and respectful of your device’s privacy.

        Thank you for using jedToolKit Lite!
        """
    }
}

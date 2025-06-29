//
//  SSLFixLiteViewController.swift
//  jedToolKit
//
//  Created by aimic on 6/29/25.
//

import UIKit
 
class SSLFixLiteViewController: UIViewController {
 
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "SSLFix Lite"
        view.backgroundColor = .systemBackground
        setupUI()
    }
 
    private func setupUI() {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 20
        stack.translatesAutoresizingMaskIntoConstraints = false
 
        let descLabel = UILabel()
        descLabel.text = "Fix SSL issues on iOS 13 and iOS 14 by installing trusted root certs and secure DNS. Thanks to kylejeddev"
        descLabel.numberOfLines = 0
        descLabel.textAlignment = .center
 
        let installCerts = makeButton(title: "📥 Install Root Certificates", action: #selector(installCertsTapped))
        let installDNS = makeButton(title: "🌐 Install DNS-over-HTTPS", action: #selector(installDNSTapped))
        let clearSafari = makeButton(title: "🧹 Safari Cache Tips", action: #selector(showSafariTips))
 
        [descLabel, installCerts, installDNS, clearSafari].forEach { stack.addArrangedSubview($0) }
 
        view.addSubview(stack)
 
        NSLayoutConstraint.activate([
            stack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            stack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            stack.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
 
    private func makeButton(title: String, action: Selector) -> UIButton {
        let button = UIButton(type: .system)
        button.setTitle(title, for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 16)
        button.layer.cornerRadius = 10
        button.backgroundColor = UIColor.systemGray5
        button.setTitleColor(.label, for: .normal)
        button.heightAnchor.constraint(equalToConstant: 44).isActive = true
        button.addTarget(self, action: action, for: .touchUpInside)
        return button
    }
 
    @objc private func installCertsTapped() {
        if let url = URL(string: "https://raw.githubusercontent.com/kylejeddev/jedcerts/main/rootcert.mobileconfig") {
            UIApplication.shared.open(url)
        }
    }
 
    @objc private func installDNSTapped() {
        if let url = URL(string: "https://raw.githubusercontent.com/kylejeddev/jedcerts/main/dns.mobileconfig") {
            UIApplication.shared.open(url)
        }
    }
 
    @objc private func showSafariTips() {
        let message = """
        To ensure SSLFix works:
               
        1. Go to Settings → Safari
        2. Tap “Clear History and Website Data”
        3. Restart Safari
               
        You’re now ready to browse HTTPS sites again.
        """
        let alert = UIAlertController(title: "Safari Tip", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
}

//
//  AboutViewController.swift
//  jedToolKit
//
//  Created by aimic on 6/29/25.
//

import UIKit

class AboutViewController: UIViewController {
    
    private let textView: UITextView = {
        let tv = UITextView()
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.isEditable = false
        tv.font = UIFont.systemFont(ofSize: 15)
        tv.textColor = .label
        tv.backgroundColor = .clear
        return tv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "About"
        view.backgroundColor = .systemBackground
        view.addSubview(textView)
        
        NSLayoutConstraint.activate([
            textView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            textView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            textView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            textView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
        ])
        
        textView.text = """
        📱 jedToolKit Lite
        Developed by Kyle Genesis Fernando Lambot

        ⚙️ A toolkit for jailed iOS devices running iOS 13 and above.

        ✨ Modules included:
        • jedPhoneInfo
        • jedHWChecker
        • jedTerminal Lite
        • SSLFix Lite
        • SystemProfilePatcher
        • ShortcutThemer
        • IPSW Download Helper

        🎸 The name “jed” honors Jediah, the quiet inspiration and bassist behind the project’s name and spirit.

        🛠 Built with Swift and ❤️

        Thanks for using jedToolKit!
        """
    }
}

//
//  ToolKitViewController.swift
//  jedToolKit
//
//  Created by aimic on 6/29/25.
//

import UIKit

class ToolKitViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    private let tableView = UITableView(frame: .zero, style: .insetGrouped)

    // Section 0: jedToolKit Modules
    private let jedTools: [(name: String, subtitle: String, icon: String)] = [
        ("jedPhoneInfo", "Check device info and jedOS compatibility", "info.circle"),
        ("jedTSSChecker", "Check TSS Server for signed versions", "doc.on.doc"),
        ("jedHWChecker", "Run basic tests on your device", "gear"),
        ("jedSysPatcher", "Block OTA updates and more", "hammer"),
        ("jedTerminal Lite", "A Terminal Window", "command")
    ]

    // Section 1: General Tools
    private let generalTools: [(name: String, subtitle: String, icon: String)] = [
        ("IconThemer", "Create themed app icons using Shortcuts", "paintbrush"),
        ("SSLFix Lite", "Fix SSL on iOS 13 to 14", "signature"),
        ("IPSW Downloader", "Downloads IPSW for your device", "square.and.arrow.down")
    ]

    // Section 2: About App
    private let aboutApp: [(name: String, subtitle: String, icon: String)] = [
        ("Developers", "Meet the developers behind jedToolKit", "person.2"),
        ("Privacy Policy", "Read our Privacy Policy", "hand.raised"),
        ("About", "About jedToolKit", "person.crop.circle")
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "jedToolKit Lite"
        view.backgroundColor = .systemBackground
        setupTableView()
    }

    private func setupTableView() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 60
        view.addSubview(tableView)

        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }

    // MARK: - UITableViewDataSource

    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0: return jedTools.count
        case 1: return generalTools.count
        case 2: return aboutApp.count
        default: return 0
        }
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0: return "jedToolKit Modules"
        case 1: return "General Tools"
        case 2: return "About jedToolKit"
        default: return nil
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tool: (name: String, subtitle: String, icon: String)

        switch indexPath.section {
        case 0: tool = jedTools[indexPath.row]
        case 1: tool = generalTools[indexPath.row]
        case 2: tool = aboutApp[indexPath.row]
        default: fatalError("Invalid section")
        }

        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: nil)
        cell.textLabel?.text = tool.name
        cell.textLabel?.font = .systemFont(ofSize: 17, weight: .semibold)
        cell.detailTextLabel?.text = tool.subtitle
        cell.detailTextLabel?.font = .systemFont(ofSize: 13)
        cell.detailTextLabel?.textColor = .secondaryLabel
        cell.imageView?.image = UIImage(systemName: tool.icon)
        cell.imageView?.tintColor = .systemBlue
        cell.accessoryType = .disclosureIndicator
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        let selectedTool: String
        switch indexPath.section {
        case 0: selectedTool = jedTools[indexPath.row].name
        case 1: selectedTool = generalTools[indexPath.row].name
        case 2: selectedTool = aboutApp[indexPath.row].name
        default: return
        }

        let vc: UIViewController?

        switch selectedTool {
        case "IconThemer":
            vc = ShortcutThemerViewController()
        case "SSLFix Lite":
            vc = SSLFixLiteViewController()
        case "IPSW Downloader":
            vc = IPSWDownloadHelperViewController()
        case "jedPhoneInfo":
            vc = jedPhoneInfoViewController()
        case "jedTSSChecker":
            vc = SigningStatusViewController()
        case "jedHWChecker":
            vc = jedHWCheckerViewController()
        case "jedSysPatcher":
            vc = SystemProfilePatcherViewController()
        case "jedTerminal Lite":
            vc = jedTerminalLiteViewController()
        case "Developers":
            vc = DevelopersViewController()
        case "Privacy Policy":
            vc = PrivacyPolicyViewController() // <- Replace with your own VC
        case "About":
            vc = AboutViewController() // <- Replace with your own VC
        default:
            vc = nil
        }

        if let vc = vc {
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}

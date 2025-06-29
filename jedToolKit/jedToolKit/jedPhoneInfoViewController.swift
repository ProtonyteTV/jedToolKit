//
//  jedPhoneInfoViewController.swift
//  jedToolKit
//
//  Created by aimic on 6/29/25.
//

import UIKit
 
class jedPhoneInfoViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
 
    private let tableView = UITableView(frame: .zero, style: .insetGrouped)
    private var infoItems: [(title: String, value: String)] = []
    private var compatibilityMessage: String = ""
 
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "jedPhoneInfo"
 
        setupTableView()
        gatherDeviceInfo()
    }
 
    private func setupTableView() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorStyle = .none
        tableView.isScrollEnabled = true
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 44
        view.addSubview(tableView)
 
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
 
    private func gatherDeviceInfo() {
        let device = UIDevice.current
        let name = device.name
        let model = device.model
        let version = device.systemVersion
        let uptime = getUptime()
        let identifier = getDeviceIdentifier()
        let serial = device.identifierForVendor?.uuidString ?? "Unavailable"
 
        infoItems = [
            ("Device Name", name),
            ("Device Model", model),
            ("Identifier", identifier),
            ("iOS Version", version),
            ("Serial (UUID)", serial),
            ("ECID", "Unavailable (Jailed)"),
            ("IMEI", "Unavailable (Jailed)"),
            ("System Uptime", uptime)
        ]
 
        compatibilityMessage = checkCompatibility(for: version)
        tableView.reloadData()
    }
 
    private func getUptime() -> String {
        let uptime = ProcessInfo.processInfo.systemUptime
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.day, .hour, .minute]
        formatter.unitsStyle = .full
        return formatter.string(from: uptime) ?? "Unknown"
    }
 
    private func getDeviceIdentifier() -> String {
        var systemInfo = utsname()
        uname(&systemInfo)
        return withUnsafePointer(to: &systemInfo.machine) {
            $0.withMemoryRebound(to: CChar.self, capacity: 1) {
                String(validatingUTF8: $0) ?? "Unknown"
            }
        }
    }
 
    private func checkCompatibility(for version: String) -> String {
        guard let major = Int(version.split(separator: ".").first ?? "0") else { return "⚠️ Unable to determine compatibility." }
 
        switch major {
        case 13:
            return "✅ Your Device is Compatible with jedOS.13 — The legendary origin of the legacy movement — lightweight, snappy, and nostalgic to the bone."
        case 14:
            return "😅You’re running iOS 14, jedOS.14 is deprecated. Think of it as the filler arc of iOS, You're better off downgrading to jedOS.13 or upgrading to jedOS.15.1!"
        case 15:
            return "✅ Your Device is Compatible with jedOS.15.1 — Preserve the Legacy. Power the Present."
        case 16:
            return "🧪 jedOS.16 coming soon — Rooted in elegance and jailbreak tech."
        case 17:
            return "⚙️ jedOS.17 in development — Experimental UI and kernel blend."
        case 18:
            return "🤖 jedOS.18 – Will enable Apple Intelligence on unsupported devices."
        case 19:
            return "💠 jedOS.26 – LiquidGlass meets FlatDesign."
        default:
            return "⚠️ Unknown compatibility. jedOS may not support iOS \(version)."
        }
    }
 
    // MARK: - TableView
 
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2 // Device info + compatibility message
    }
 
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return section == 0 ? infoItems.count : 1
    }
 
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return section == 0 ? "Device Info" : "jedOS Compatibility"
    }
 
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: nil)
        cell.selectionStyle = .none
        if indexPath.section == 0 {
            let item = infoItems[indexPath.row]
            cell.textLabel?.text = item.title
            cell.detailTextLabel?.text = item.value
            cell.textLabel?.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
            cell.detailTextLabel?.font = UIFont.systemFont(ofSize: 15, weight: .regular)
            cell.detailTextLabel?.textColor = .secondaryLabel
        } else {
            cell.textLabel?.text = compatibilityMessage
            cell.textLabel?.numberOfLines = 0
            cell.textLabel?.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        }
        return cell
    }
}

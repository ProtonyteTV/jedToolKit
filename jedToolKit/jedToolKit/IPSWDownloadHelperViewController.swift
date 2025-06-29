//
//  IPSWDownloadHelperViewController.swift
//  jedToolKit
//
//  Created by aimic on 6/29/25.
//

import UIKit
 
class IPSWDownloadHelperViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
 
    private var firmwares: [[String: Any]] = []
    private let tableView = UITableView()
 
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "IPSW Downloads"
        view.backgroundColor = .systemBackground
        setupTableView()
        fetchIPSWs()
    }
 
    private func setupTableView() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
        tableView.delegate = self
        view.addSubview(tableView)
 
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
 
    private func getDeviceIdentifier() -> String? {
        var systemInfo = utsname()
        uname(&systemInfo)
        return withUnsafePointer(to: &systemInfo.machine) {
            $0.withMemoryRebound(to: CChar.self, capacity: 1) {
                String(validatingUTF8: $0)
            }
        }
    }
 
    private func fetchIPSWs() {
        guard let identifier = getDeviceIdentifier() else { return }
        let urlString = "https://api.ipsw.me/v4/device/\(identifier)?type=ios"
        guard let url = URL(string: urlString) else { return }
 
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let data = data, error == nil {
                if let json = try? JSONSerialization.jsonObject(with: data) as? [String: Any],
                   let firmwares = json["firmwares"] as? [[String: Any]] {
                    self.firmwares = firmwares
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                }
            }
        }.resume()
    }
 
    // MARK: - TableView
 
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return firmwares.count
    }
 
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let fw = firmwares[indexPath.row]
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: nil)
 
        let version = fw["version"] as? String ?? "Unknown"
        let build = fw["buildid"] as? String ?? "Unknown"
        let signed = fw["signed"] as? Bool ?? false
 
        cell.textLabel?.text = "iOS \(version) \(signed ? "✅" : "❌")"
        cell.detailTextLabel?.text = "Build: \(build)"
        cell.accessoryType = .disclosureIndicator
        return cell
    }
 
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
 
        let fw = firmwares[indexPath.row]
        if let urlString = fw["url"] as? String, let url = URL(string: urlString) {
            let alert = UIAlertController(title: "Open IPSW?", message: "Do you want to open this IPSW in Safari?", preferredStyle: .actionSheet)
            alert.addAction(UIAlertAction(title: "Open in Safari", style: .default, handler: { _ in
                UIApplication.shared.open(url)
            }))
            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
            present(alert, animated: true)
        }
    }
}

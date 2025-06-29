//
//  SigningStatusViewController.swift
//  jedToolKit
//
//  Created by aimic on 6/29/25.
//

import UIKit
 
class SigningStatusViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
 
    private var signedVersions: [String] = []
    private let tableView = UITableView(frame: .zero, style: .insetGrouped)
    private let loadingIndicator = UIActivityIndicatorView(style: .large)
 
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Signing Status"
        setupTableView()
        setupLoadingIndicator()
        fetchSigningStatus()
    }
 
    private func setupTableView() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "SigningCell")
        view.addSubview(tableView)
 
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
 
    private func setupLoadingIndicator() {
        loadingIndicator.translatesAutoresizingMaskIntoConstraints = false
        loadingIndicator.hidesWhenStopped = true
        view.addSubview(loadingIndicator)
 
        NSLayoutConstraint.activate([
            loadingIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loadingIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor)
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
 
    private func fetchSigningStatus() {
        loadingIndicator.startAnimating()
 
        guard let identifier = getDeviceIdentifier() else {
            showAlert("Failed to get device identifier.")
            return
        }
 
        let urlString = "https://api.ipsw.me/v4/device/\(identifier)?type=ios"
        guard let url = URL(string: urlString) else {
            showAlert("Invalid URL.")
            return
        }
 
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            DispatchQueue.main.async {
                self.loadingIndicator.stopAnimating()
            }
 
            if let error = error {
                self.showAlert("Network error: \(error.localizedDescription)")
                return
            }
 
            guard let data = data else {
                self.showAlert("No data received.")
                return
            }
 
            do {
                if let json = try JSONSerialization.jsonObject(with: data) as? [String: Any],
                   let firmwares = json["firmwares"] as? [[String: Any]] {
 
                    self.signedVersions = firmwares.compactMap { fw in
                        if let version = fw["version"] as? String,
                           let signed = fw["signed"] as? Bool, signed {
                            return version
                        }
                        return nil
                    }.sorted { $0.compare($1, options: .numeric) == .orderedDescending }
 
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                }
            } catch {
                self.showAlert("Failed to parse data.")
            }
        }
        task.resume()
    }
 
    private func showAlert(_ message: String) {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: "Signing Status", message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            self.present(alert, animated: true)
        }
    }
 
    // MARK: - TableView
 
    func numberOfSections(in tableView: UITableView) -> Int {
        return signedVersions.isEmpty ? 0 : 1
    }
 
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return signedVersions.count
    }
 
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Currently Signed iOS Versions"
    }
 
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let version = signedVersions[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "SigningCell", for: indexPath)
        cell.textLabel?.text = "✅ iOS \(version)"
        cell.textLabel?.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        cell.selectionStyle = .none
        return cell
    }
}

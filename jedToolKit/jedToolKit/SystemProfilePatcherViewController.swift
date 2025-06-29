//
//  SystemProfilePatcherViewController.swift
//  jedToolKit
//
//  Created by aimic on 6/29/25.
//

import UIKit
 
class SystemProfilePatcherViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
 
    struct ProfilePatch {
        let title: String
        let description: String
        let generator: () -> String
        let fileName: String
    }
 
    private var tableView: UITableView!
    private var patches: [ProfilePatch] = []
 
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "jedSysPatcher"
        view.backgroundColor = .systemBackground
 
        patches = [
            ProfilePatch(title: "🛑 Block OTA Updates",
                         description: "Prevents iOS from checking and downloading software updates.",
                         generator: generateOTABlockProfile,
                         fileName: "BlockOTA.mobileconfig"),
 
            ProfilePatch(title: "🌙 Force Dark Mode",
                         description: "Applies dark mode system-wide by default.",
                         generator: generateDarkModeProfile,
                         fileName: "DarkMode.mobileconfig"),
 
            ProfilePatch(title: "🔍 Set DuckDuckGo as Safari Search",
                         description: "Changes Safari’s search engine to DuckDuckGo.",
                         generator: generateDuckDuckGoProfile,
                         fileName: "DuckDuckGo.mobileconfig")
        ]
 
        tableView = UITableView(frame: view.bounds, style: .insetGrouped)
        tableView.dataSource = self
        tableView.delegate = self
        view.addSubview(tableView)
    }
 
    // MARK: - Table View
 
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return patches.count
    }
 
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let patch = patches[indexPath.row]
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: nil)
        cell.textLabel?.text = patch.title
        cell.detailTextLabel?.text = patch.description
        cell.accessoryType = .detailButton
        return cell
    }
 
    func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        installProfile(patch: patches[indexPath.row])
    }
 
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        installProfile(patch: patches[indexPath.row])
    }
 
    // MARK: - Profile Generators
 
    private func installProfile(patch: ProfilePatch) {
        let content = patch.generator()
        let fileURL = FileManager.default.temporaryDirectory.appendingPathComponent(patch.fileName)
 
        do {
            try content.write(to: fileURL, atomically: true, encoding: .utf8)
            let vc = UIActivityViewController(activityItems: [fileURL], applicationActivities: nil)
            present(vc, animated: true)
        } catch {
            let alert = UIAlertController(title: "Error", message: "Failed to write profile file.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            present(alert, animated: true)
        }
    }
 
    private func generateOTABlockProfile() -> String {
        return """
        <?xml version="1.0" encoding="UTF-8"?>
        <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
        <plist version="1.0">
        <dict>
          <key>PayloadContent</key>
          <array>
            <dict>
              <key>PayloadIdentifier</key>
              <string>com.apple.TVSConfigurationProfile</string>
              <key>PayloadType</key>
              <string>com.apple.TVSConfigurationProfile</string>
              <key>PayloadUUID</key>
              <string>\(UUID().uuidString)</string>
              <key>PayloadVersion</key>
              <integer>1</integer>
              <key>TVSProfileURL</key>
              <string>http://127.0.0.1</string>
            </dict>
          </array>
          <key>PayloadDisplayName</key>
          <string>Block OTA</string>
          <key>PayloadIdentifier</key>
          <string>com.jedtoolkit.blockOTA</string>
          <key>PayloadType</key>
          <string>Configuration</string>
          <key>PayloadUUID</key>
          <string>\(UUID().uuidString)</string>
          <key>PayloadVersion</key>
          <integer>1</integer>
        </dict>
        </plist>
        """
    }
 
    private func generateDarkModeProfile() -> String {
        return """
        <?xml version="1.0" encoding="UTF-8"?>
        <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
        <plist version="1.0">
        <dict>
          <key>PayloadContent</key>
          <array>
            <dict>
              <key>InterfaceStyle</key>
              <string>Dark</string>
              <key>PayloadIdentifier</key>
              <string>com.apple.interface.style</string>
              <key>PayloadType</key>
              <string>com.apple.ManagedClient.preferences</string>
              <key>PayloadUUID</key>
              <string>\(UUID().uuidString)</string>
              <key>PayloadVersion</key>
              <integer>1</integer>
            </dict>
          </array>
          <key>PayloadDisplayName</key>
          <string>Force Dark Mode</string>
          <key>PayloadIdentifier</key>
          <string>com.jedtoolkit.darkmode</string>
          <key>PayloadType</key>
          <string>Configuration</string>
          <key>PayloadUUID</key>
          <string>\(UUID().uuidString)</string>
          <key>PayloadVersion</key>
          <integer>1</integer>
        </dict>
        </plist>
        """
    }
 
    private func generateDuckDuckGoProfile() -> String {
        return """
        <?xml version="1.0" encoding="UTF-8"?>
        <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
        <plist version="1.0">
        <dict>
          <key>PayloadContent</key>
          <array>
            <dict>
              <key>PayloadIdentifier</key>
              <string>com.apple.safari.search</string>
              <key>PayloadType</key>
              <string>com.apple.ManagedClient.preferences</string>
              <key>PayloadUUID</key>
              <string>\(UUID().uuidString)</string>
              <key>PayloadVersion</key>
              <integer>1</integer>
              <key>PayloadContent</key>
              <dict>
                <key>SearchProviderIdentifier</key>
                <string>com.duckduckgo</string>
              </dict>
            </dict>
          </array>
          <key>PayloadDisplayName</key>
          <string>Safari DuckDuckGo</string>
          <key>PayloadIdentifier</key>
          <string>com.jedtoolkit.safariduck</string>
          <key>PayloadType</key>
          <string>Configuration</string>
          <key>PayloadUUID</key>
          <string>\(UUID().uuidString)</string>
          <key>PayloadVersion</key>
          <integer>1</integer>
        </dict>
        </plist>
        """
    }
}

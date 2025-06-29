//
//  jedWFIAnalyzerViewController.swift
//  jedToolKit
//
//  Created by aimic on 6/29/25.
//

import UIKit
import SystemConfiguration.CaptiveNetwork
import CoreLocation

class jedWFIAnalyzerViewController: UIViewController, CLLocationManagerDelegate {
    
    private let locationManager = CLLocationManager()
    private let infoLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "jedWFIAnalyzer"
        view.backgroundColor = .systemBackground
        setupUI()
        
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
    }

    private func setupUI() {
        infoLabel.translatesAutoresizingMaskIntoConstraints = false
        infoLabel.numberOfLines = 0
        infoLabel.textAlignment = .center
        infoLabel.font = UIFont.systemFont(ofSize: 16)
        infoLabel.textColor = .label
        view.addSubview(infoLabel)

        NSLayoutConstraint.activate([
            infoLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            infoLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            infoLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }

    // MARK: - CLLocationManagerDelegate

    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if #available(iOS 14, *) {
            if status == .authorizedWhenInUse || status == .authorizedAlways {
                fetchWiFiInfo()
            } else {
                infoLabel.text = "❌ Location permission not granted.\nPlease allow location access to analyze Wi-Fi."
            }
        } else {
            if status == .authorizedWhenInUse || status == .authorizedAlways {
                fetchWiFiInfo()
            } else if status == .denied {
                infoLabel.text = "❌ Location access denied.\nPlease enable it in Settings."
            }
        }
    }

    // MARK: - Wi-Fi Info

    private func fetchWiFiInfo() {
        guard let interfaces = CNCopySupportedInterfaces() as? [String],
              let interfaceName = interfaces.first,
              let info = CNCopyCurrentNetworkInfo(interfaceName as CFString) as? [String: Any] else {
            infoLabel.text = "⚠️ Not connected to Wi-Fi or permission denied.\nTry again after checking Settings."
            return
        }

        let ssid = info["SSID"] as? String ?? "Unknown"
        let bssid = info["BSSID"] as? String ?? "Unknown"

        infoLabel.text = """
        📶 Connected Wi-Fi Info
        
        • SSID: \(ssid)
        • BSSID: \(bssid)
        """
    }
}

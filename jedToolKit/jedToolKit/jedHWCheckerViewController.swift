import UIKit

class jedHWCheckerViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    private let tableView = UITableView(frame: .zero, style: .insetGrouped)

    private let sections: [(title: String, items: [(title: String, subtitle: String, icon: String)])] = [
        ("Core Components", [
            ("Brightness Test", "Test screen dimming and full brightness", "sun.max"),
            ("Battery Health Info", "View charge level and state", "battery.100")
        ]),
        ("Sensors", [
            ("Face ID Test", "Check biometric sensor availability", "faceid"),
            ("Gyroscope Test", "Test gyroscope motion feedback", "gyroscope"),
            ("Proximity Sensor Test", "Cover sensor to trigger test", "dot.radiowaves.left.and.right"),
            ("Touch Responsiveness", "Visualize touch points on screen", "hand.tap")
        ]),
        ("Audio & Visual", [
            ("Speaker Test", "Play audio and verify speaker output", "speaker.wave.2"),
            ("Microphone Test", "Record and play back audio", "mic"),
            ("Camera Test", "Preview and capture camera input", "camera")
        ])
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "jedHWChecker"
        view.backgroundColor = .systemBackground
        setupTableView()
    }
    
    private func setupTableView() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 60
        tableView.separatorStyle = .none
        tableView.backgroundColor = .clear
        view.addSubview(tableView)

        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }

    // MARK: - UITableViewDataSource

    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections[section].items.count
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sections[section].title
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let test = sections[indexPath.section].items[indexPath.row]
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: nil)
        cell.textLabel?.text = test.title
        cell.detailTextLabel?.text = test.subtitle
        cell.accessoryType = .disclosureIndicator
        cell.imageView?.image = UIImage(systemName: test.icon)
        cell.imageView?.tintColor = .systemBlue
        cell.backgroundColor = .clear
        
        // Container for rounded look without breaking tap gesture
        let bgView = UIView()
        bgView.backgroundColor = UIColor.secondarySystemGroupedBackground
        bgView.layer.cornerRadius = 12
        cell.backgroundView = bgView

        return cell
    }

    // MARK: - UITableViewDelegate

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        let selected = sections[indexPath.section].items[indexPath.row].title
        var vc: UIViewController?

        switch selected {
        case "Brightness Test":
            vc = BrightnessTestViewController()
        case "Speaker Test":
            vc = SpeakerTestViewController()
        case "Face ID Test":
            vc = BiometricTestViewController()
        case "Battery Health Info":
            vc = BatteryInfoViewController()
        case "Gyroscope Test":
            vc = GyroscopeTestViewController()
        case "Proximity Sensor Test":
            vc = ProximityTestViewController()
        case "Camera Test":
            vc = CameraTestViewController()
        case "Touch Responsiveness":
            vc = TouchTestViewController()
        case "Microphone Test":
            vc = MicTestViewController()
        default:
            break
        }

        if let vc = vc {
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}

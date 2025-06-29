//
//  DevelopersViewController.swift
//  jedToolKit
//
//  Created by aimic on 6/29/25.
//

import UIKit

class DevelopersViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Developers"
        view.backgroundColor = .systemBackground
        setupUI()
    }

    private func setupUI() {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(scrollView)

        let contentView = UIStackView()
        contentView.axis = .horizontal
        contentView.alignment = .center
        contentView.distribution = .equalSpacing
        contentView.spacing = 30
        contentView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(contentView)

        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),

            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.heightAnchor.constraint(equalToConstant: 160) // Fix vertical height
        ])

        // Add developers
        let dev1 = createDevView(name: "Kyle Lambot", role: "Lead Developer")
        let dev2 = createDevView(name: "Jediah Red", role: "Inspiration")

        contentView.addArrangedSubview(dev1)
        contentView.addArrangedSubview(dev2)
    }

    private func createDevView(name: String, role: String) -> UIView {
        let container = UIStackView()
        container.axis = .vertical
        container.alignment = .center
        container.spacing = 8

        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 40
        imageView.clipsToBounds = true
        imageView.layer.masksToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.widthAnchor.constraint(equalToConstant: 80),
            imageView.heightAnchor.constraint(equalToConstant: 80)
        ])

        // Load profile images based on name
        switch name {
        case "Kyle Lambot":
            imageView.image = UIImage(named: "pfp1.jpeg")
        case "Jediah Red":
            imageView.image = UIImage(named: "pfp2.jpeg")
        default:
            imageView.image = UIImage(systemName: "person.crop.circle.fill")
            imageView.tintColor = .systemGray
        }

        let nameLabel = UILabel()
        nameLabel.text = name
        nameLabel.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        nameLabel.textAlignment = .center

        let roleLabel = UILabel()
        roleLabel.text = role
        roleLabel.font = UIFont.systemFont(ofSize: 14)
        roleLabel.textColor = .secondaryLabel
        roleLabel.textAlignment = .center

        container.addArrangedSubview(imageView)
        container.addArrangedSubview(nameLabel)
        container.addArrangedSubview(roleLabel)

        return container
    }
}

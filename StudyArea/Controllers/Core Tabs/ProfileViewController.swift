//
//  ProfileViewController.swift
//  StudyArea
//
//  Created by Gio on 02/02/22.
//

import UIKit

class ProfileViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    // Profile Photo

    // Full Name

    // Email

    // List of posts

    private var user: User?

    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(AreaPreviewTableViewCell.self,
                           forCellReuseIdentifier: AreaPreviewTableViewCell.identifier)
        return tableView
    }()

    let currentEmail: String

    init(currentEmail: String) {
        self.currentEmail = currentEmail
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setUpSignOutButton()
        setUpTable()
        title = "Profile"
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }

    private func setUpTable() {
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
//        setUpTableHeader()
//        fetchProfileData()
    }

//    private func setUpTableHeader(
//        profilePhotoRef: String? = nil,
//        name: String? = nil
//    ) {
//    }

//    @objc private func didTapProfilePhoto() {

    private func fetchProfileData() {
    }

    private func setUpSignOutButton() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            title: "Sign Out",
            style: .done,
            target: self,
            action: #selector(didTapSignOut)
        )
    }

    /// Sign Out
    @objc private func didTapSignOut() {
    }

    // TableView

    private var areas: [StudyArea] = []

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return areas.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let area = areas[indexPath.row]
            guard let cell = tableView.dequeueReusableCell(withIdentifier: AreaPreviewTableViewCell.identifier, for: indexPath) as? AreaPreviewTableViewCell else {
                fatalError()
            }
        cell.configure(with: .init(room: area.room, subject: area.subject, teacher: area.teacher, queue: area.queue))
            return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 95
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }

}

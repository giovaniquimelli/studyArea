//
//  ProfileViewController.swift
//  StudyArea
//
//  Created by Gio on 02/02/22.
//

import UIKit

class ProfileViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    private var user: User?

    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(ProfileItemTableViewCell.self,
                           forCellReuseIdentifier: ProfileItemTableViewCell.identifier)
        tableView.register(EmptyItemTableViewCell.self,
                           forCellReuseIdentifier: EmptyItemTableViewCell.identifier)
        tableView.register(ProfileLogOutTableViewCell.self,
                           forCellReuseIdentifier: ProfileLogOutTableViewCell.identifier)
        return tableView
    }()
    
    private let spacer: UIView = {
        let spacer = UIView()
        spacer.backgroundColor = .systemGray4
        return spacer
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
//        setUpSignOutButton()
        setUpTable()
        title = "Profile"
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.backgroundColor = .systemGray6
        tableView.frame = view.bounds
    }

    private func setUpTable() {
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        // TODO
        // info button above
        setUpTableHeader()
    }
    
    // TODO with edit symbol above?
        private func setUpTableHeader(
            profilePhotoRef: String? = nil,
            name: String? = nil
        ) {
            let headerView = UIView(frame: CGRect(x: 0, y: 0, width: view.width/2, height: view.width/2 + 15))
//            headerView.backgroundColor = .systemBlue
//            headerView.isUserInteractionEnabled = true
            headerView.clipsToBounds = true
            tableView.tableHeaderView = headerView
    
            let profilePhoto = UIImageView(image: UIImage(systemName: "person.crop.circle.fill"))
            profilePhoto.tintColor = .systemBlue
            profilePhoto.contentMode = .scaleAspectFit
            profilePhoto.frame = CGRect(
                x: view.width/4,
                y: 0,
                width: view.width/2,
                height: view.width/2
            )
            profilePhoto.layer.masksToBounds = true
            profilePhoto.layer.cornerRadius = profilePhoto.width/2
            profilePhoto.isUserInteractionEnabled = true
            headerView.addSubview(profilePhoto)
//            let tap = UITapGestureRecognizer(target: self, action: #selector(didTapProfilePhoto))
//            profilePhoto.addGestureRecognizer(tap)
    
    
//            if let ref = profilePhotoRef {
//                // Fetch image
//                StorageManager.shared.downloadUrlForProfilePicture(path: ref) { url in
//                    guard let url = url else {
//                        return
//                    }
//                    let task = URLSession.shared.dataTask(with: url) { data, _, _ in
//                        guard let data = data else {
//                            return
//                        }
//                        DispatchQueue.main.async {
//                            profilePhoto.image = UIImage(data: data)
//                        }
//                    }
//
//                    task.resume()
//                }
//            }
        }

    private var rows: [ProfileRow] = [
        ProfileRow(title: "Name", subTitle: "Giovani Quimelli", isClickable: false),
        ProfileRow(title: "Username", subTitle: "10409330", isClickable: false),
        ProfileRow(title: "Password", subTitle: "******", isClickable: true)
    ]

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }

    // TODO password field goes to edit mode when selected.
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row < 3 {
            let row = rows[indexPath.row]
            
            let isFirstCell = indexPath.row == 0
            guard let cell = tableView.dequeueReusableCell(withIdentifier: ProfileItemTableViewCell.identifier, for: indexPath) as? ProfileItemTableViewCell else {
                fatalError()
            }
            cell.configure(with: .init(title: row.title, subTitle: row.subTitle, isClickable: row.isClickable, isFirstItem: isFirstCell))
            print(row.isClickable)
            if !row.isClickable {
                cell.selectionStyle = .none
            }
            return cell
        } else if indexPath.row == 4 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: ProfileLogOutTableViewCell.identifier, for: indexPath) as? ProfileLogOutTableViewCell else {
                fatalError()
            }
            return cell
        }
        guard let cell = tableView.dequeueReusableCell(withIdentifier: EmptyItemTableViewCell.identifier, for: indexPath) as? EmptyItemTableViewCell else {
            fatalError()
        }
        cell.selectionStyle = .none
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return UITableView.automaticDimension
        return 50    }

    // TODO password field gest button and goes to edit mode when selected
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        HapticsManager.shared.vibrateForSelection()
        return
    }

}

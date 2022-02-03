//
//  HomeViewController.swift
//  StudyArea
//
//  Created by Gio on 02/02/22.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(AreaPreviewTableViewCell.self,
                           forCellReuseIdentifier: AreaPreviewTableViewCell.identifier)
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        fetchAllAreas()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }

    private var areas: [StudyArea] = []

    private func fetchAllAreas() {
        print("Fetching home feed...")

        DatabaseManager.shared.getAllPosts { [weak self] areas in
            self?.areas = areas
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
    }

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
        return 110
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        HapticsManager.shared.vibrateForSelection()

//        guard IAPManager.shared.canViewPost else {
//            let vc = PayWallViewController()
//            present(vc, animated: true, completion: nil)
//            return
//        }

//        let vc = ViewPostViewController(post: areas[indexPath.row])
//        vc.navigationItem.largeTitleDisplayMode = .never
//        vc.title = "Post"
//        navigationController?.pushViewController(vc, animated: true)
    }
    
}


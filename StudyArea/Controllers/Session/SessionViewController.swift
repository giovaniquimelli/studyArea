//
//  SessionViewController.swift
//  StudyArea
//
//  Created by Gio on 02/02/22.
//

import UIKit

class SessionViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    private let area: StudyArea
    
    init(area: StudyArea) {
        self.area = area
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(TeacherChatBubbleTableViewCell.self,
                           forCellReuseIdentifier: TeacherChatBubbleTableViewCell.identifier)
        tableView.register(StudentChatBubbleTableViewCell.self,
                           forCellReuseIdentifier: StudentChatBubbleTableViewCell.identifier)
        tableView.register(SystemMessageTableViewCell.self,
                           forCellReuseIdentifier: SystemMessageTableViewCell.identifier)
        return tableView
    }()

    private let textInputButton: UIButton = {
        let textInputButton = UIButton()
        textInputButton.backgroundColor = .white
        textInputButton.layer.cornerRadius = 6
        textInputButton.layer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMaxYCorner]
//        joinButton.layer.shadowColor = UIColor.gray.cgColor
//        joinButton.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
//        joinButton.layer.shadowRadius = 3
//        joinButton.layer.shadowOpacity = 0.3
        textInputButton.setTitle("Message", for: .normal)
        textInputButton.titleLabel?.font = .systemFont(ofSize: 16, weight: .semibold)
        return textInputButton
    }()
    

    private let sendButton: UIButton = {
        let sendButton = UIButton()
        sendButton.backgroundColor = .systemBlue
        sendButton.layer.cornerRadius = 6
        sendButton.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMaxXMaxYCorner]
//        cancelButton.layer.shadowColor = UIColor.gray.cgColor
//        cancelButton.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
//        cancelButton.layer.shadowRadius = 3
//        cancelButton.layer.shadowOpacity = 0.3

        let largeX = UIImage.SymbolConfiguration(pointSize: 22, weight: .semibold, scale: .medium)

        let largeBoldX = UIImage(systemName: "multiply", withConfiguration: largeX)
        sendButton.setImage(largeBoldX, for: .normal)
        sendButton.tintColor = UIColor.white
        return sendButton
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        view.addSubview(textInputButton)
        view.addSubview(sendButton)
        fetchAllMessages()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.backgroundColor = .systemGray6
        tableView.frame = view.bounds
        textInputButton.frame = CGRect(x: 10, y: view.height-50, width: view.width-60, height: 40)
        sendButton.frame = CGRect(x: textInputButton.right, y: view.height-50, width: 40, height: 40)
    }

    private var messages: [Messages] = []

    private func fetchAllMessages() {
        DatabaseManager.shared.getAllPosts { [weak self] messages in
            self?.messages = messages
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let message = messages[indexPath.row]
        
//        if let areaId = selectedArea?.identifier, areaId == area.identifier {
//            guard let cell = tableView.dequeueReusableCell(withIdentifier: SelectedAreaPreviewTableViewCell.identifier, for: indexPath) as? SelectedAreaPreviewTableViewCell else {
//                fatalError()
//            }
//            cell.configure(with: .init(room: area.room, subject: area.subject, teacher: area.teacher, queue: area.queue, isFirstCell: isFirstCell))
//
//    //        tableView.reloadRows(at: [indexPath], with: .automatic)
//            return cell
//        } else {
//
//            guard let cell = tableView.dequeueReusableCell(withIdentifier: AreaPreviewTableViewCell.identifier, for: indexPath) as? AreaPreviewTableViewCell else {
//                fatalError()
//            }
//            cell.configure(with: .init(room: area.room, subject: area.subject, teacher: area.teacher, queue: area.queue, isFirstCell: isFirstCell))
//            return cell
//        }
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let message = messages[indexPath.row]
//        if let selectedAreaId = self.selectedArea?.identifier {
//            return area.identifier == selectedAreaId ? 142 : 102
//        }
//        return 102
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        HapticsManager.shared.vibrateForSelection()
        
        let message = messages[indexPath.row]
        
//        if let areaId = selectedArea?.identifier, areaId == area.identifier {
//            selectedArea = nil
//            tableView.reloadData()
//            return
//        } else {
//            selectedArea = area
//            tableView.reloadData()
//        }
        
//        let vc = SessionViewController(area: area)
//        vc.navigationItem.largeTitleDisplayMode = .never
//        vc.title = "Study Area Session"
//        navigationController?.pushViewController(vc, animated: true)
    }
    
}


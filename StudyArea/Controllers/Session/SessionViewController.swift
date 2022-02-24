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
        tableView.register(SystemMessageTableViewCell.self,
                           forCellReuseIdentifier: SystemMessageTableViewCell.identifier)
        tableView.register(TeacherMessageTableViewCell.self,
                           forCellReuseIdentifier: TeacherMessageTableViewCell.identifier)
        tableView.register(StudentMessageTableViewCell.self,
                           forCellReuseIdentifier: StudentMessageTableViewCell.identifier)
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
        configureButtons()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.backgroundColor = .systemGray6
        tableView.frame = view.bounds
        textInputButton.frame = CGRect(x: 10, y: view.height-50, width: view.width-60, height: 40)
        sendButton.frame = CGRect(x: textInputButton.right, y: view.height-50, width: 40, height: 40)
    }
    
    private func configureButtons() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(
            title: "Cancel",
            style: .done,
            target: self,
            action: #selector(didTapCancel)
        )

    }

    @objc private func didTapCancel() {
//        dismiss(animated: true, completion: nil)
        
        let alert = UIAlertController(
            title: "Cancel session",
            message: "Do you wish to cancel your current study session?",
            preferredStyle: .actionSheet
        )

        func goBackHandler(alert: UIAlertAction) {
            navigationController?.popViewController(animated: true)
        }

        let goBackAction = UIAlertAction(title: "Yes", style: .destructive, handler: goBackHandler)
        let cancelAction = UIAlertAction(title: "No", style: .cancel, handler: nil)
//        alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: nil))
        alert.addAction(goBackAction)
        alert.addAction(cancelAction)
        
        self.present(alert, animated: true, completion: nil)
    }

    private var messages: [Messages] = []

    private func fetchAllMessages() {
        DatabaseManager.shared.getAllMessages{ [weak self] messages in
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
        
        if message.sender == MessageSender.system {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: SystemMessageTableViewCell.identifier, for: indexPath) as? SystemMessageTableViewCell else {
                fatalError()
            }
            cell.configure(with: .init(text: message.text))

            return cell
        } else if message.sender == MessageSender.teacher {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: TeacherMessageTableViewCell.identifier, for: indexPath) as? TeacherMessageTableViewCell else {
                fatalError()
            }
            cell.configure(with: .init(text: message.text))

            return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: StudentMessageTableViewCell.identifier, for: indexPath) as? StudentMessageTableViewCell else {
                fatalError()
            }
            cell.configure(with: .init(text: message.text))

            return cell
        }
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 55
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}

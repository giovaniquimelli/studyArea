//
//  SelectedAreaPreviewTableViewCell.swift
//  StudyArea
//
//  Created by Gio on 02/02/22.
//

import UIKit

class SelectedAreaPreviewTableViewCellViewModel {
    var room: String
    var subject: String
    var teacher: String
    var queue: String

    init(room: String, subject: String, teacher: String, queue: String) {
        self.room = room
        self.subject = subject
        self.teacher = teacher
        self.queue = queue
    }
}

class SelectedAreaPreviewTableViewCell: UITableViewCell {
    static let identifier = "SelectedAreaPreviewTableViewCell"
    
    private let joinButton: UIButton = {
        let joinButton = UIButton()
        joinButton.backgroundColor = .systemBlue
        joinButton.layer.cornerRadius = 8
        joinButton.layer.shadowColor = UIColor.gray.cgColor
        joinButton.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
        joinButton.layer.shadowRadius = 4
        joinButton.layer.shadowOpacity = 0.5
        joinButton.setTitle("Enter Queue", for: .normal)
        return joinButton
    }()
    
    private let cancelButton: UIButton = {
        let cancelButton = UIButton()
        cancelButton.backgroundColor = .systemRed
        cancelButton.layer.cornerRadius = 8
        cancelButton.layer.shadowColor = UIColor.gray.cgColor
        cancelButton.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
        cancelButton.layer.shadowRadius = 4
        cancelButton.layer.shadowOpacity = 0.5
        cancelButton.setImage(UIImage(systemName: "multiply"), for: .normal)
        cancelButton.tintColor = UIColor.white
        return cancelButton
    }()
    
    private let cardView: UIView = {
        let cardView = UIView()
        cardView.backgroundColor = .white
        cardView.layer.cornerRadius = 8
        cardView.layer.shadowColor = UIColor.gray.cgColor
        cardView.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
        cardView.layer.shadowRadius = 4
        cardView.layer.shadowOpacity = 0.5
        return cardView
    }()
        
    private let roomLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 65, weight: .medium)
        label.textAlignment = .left
        return label
    }()
    
    private let subjectLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 14, weight: .medium)
        label.textAlignment = .right
        return label
    }()
    
    private let teacherLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 14, weight: .medium)
        label.textAlignment = .right
        return label
    }()
    
    private let queueLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 14, weight: .medium)
        label.textAlignment = .right
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.clipsToBounds = true
        contentView.addSubview(joinButton)
        contentView.addSubview(cancelButton)
        contentView.addSubview(cardView)
        contentView.addSubview(roomLabel)
        contentView.addSubview(subjectLabel)
        contentView.addSubview(teacherLabel)
        contentView.addSubview(queueLabel)
    }

    required init?(coder: NSCoder) {
        fatalError()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        joinButton.frame = CGRect(
            x: separatorInset.left,
            y: 100,
            width: contentView.width-separatorInset.left-separatorInset.left - 40,
            height: 35
        )
        cancelButton.frame = CGRect(
            x: joinButton.right + 5,
            y: 100,
            width: 35,
            height: 35
        )
        
        cardView.frame = CGRect(
            x: separatorInset.left,
            y: 5,
            width: contentView.width-separatorInset.left-separatorInset.left,
            height: 90
        )
        roomLabel.frame = CGRect(
            x: separatorInset.left+10,
            y: 15,
            width: (contentView.width-20-separatorInset.left-separatorInset.left)/3,
            height: 65
        )
        subjectLabel.frame = CGRect(
            x: roomLabel.right,
            y: 15,
            width: (contentView.width-20-separatorInset.left-separatorInset.left)/3*2,
            height: 20
        )
        teacherLabel.frame = CGRect(
            x: roomLabel.right,
            y: subjectLabel.bottom+5,
            width: (contentView.width-20-separatorInset.left-separatorInset.left)/3*2,
            height: 20
        )
        queueLabel.frame = CGRect(
            x: roomLabel.right,
            y: teacherLabel.bottom+5,
            width: (contentView.width-20-separatorInset.left-separatorInset.left)/3*2,
            height: 20
        )
//        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 15))
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        roomLabel.text = nil
        subjectLabel.text = nil
        teacherLabel.text = nil
        queueLabel.text = nil
    }

    func configure(with viewModel: SelectedAreaPreviewTableViewCellViewModel) {
        roomLabel.text = viewModel.room
        subjectLabel.text = viewModel.subject
        teacherLabel.text = viewModel.teacher
        queueLabel.text = viewModel.queue
    }
}


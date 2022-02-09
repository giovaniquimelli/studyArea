//
//  AreaPreviewTableViewCell.swift
//  StudyArea
//
//  Created by Gio on 02/02/22.
//

import UIKit

class AreaPreviewTableViewCellViewModel {
    var room: String
    var subject: String
    var teacher: String
    var queue: String
    var isFirstCell: Bool

    init(room: String, subject: String, teacher: String, queue: String, isFirstCell: Bool) {
        self.room = room
        self.subject = subject
        self.teacher = teacher
        self.queue = queue
        self.isFirstCell = isFirstCell
    }
}

class AreaPreviewTableViewCell: UITableViewCell {
    static let identifier = "AreaPreviewTableViewCell"
    
//    private let cardView: UIView = {
//        let cardView = UIView()
//        cardView.backgroundColor = .white
//        cardView.layer.cornerRadius = 6
//        cardView.layer.shadowColor = UIColor.gray.cgColor
//        cardView.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
//        cardView.layer.shadowRadius = 3
//        cardView.layer.shadowOpacity = 0.3
//        return cardView
//    }()
    private var isFirstCell: Bool = false
    
    private let separatorTop: UIView = {
        let separator = UIView()
        separator.backgroundColor = .systemGray4
        return separator
    }()
    
    private let separator: UIView = {
        let separator = UIView()
        separator.backgroundColor = .systemGray4
        return separator
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
//        contentView.addSubview(cardView)
        contentView.addSubview(separatorTop)
        contentView.addSubview(separator)
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
//        cardView.frame = CGRect(
//            x: separatorInset.left,
//            y: 5,
//            width: contentView.width-separatorInset.left-separatorInset.left,
//            height: 90
//        )
        roomLabel.frame = CGRect(
            x: separatorInset.left,
            y: 16,
            width: (contentView.width-separatorInset.left-separatorInset.left)/3,
            height: 65
        )
        subjectLabel.frame = CGRect(
            x: roomLabel.right,
            y: 15,
            width: (contentView.width-separatorInset.left-separatorInset.left)/3*2,
            height: 20
        )
        teacherLabel.frame = CGRect(
            x: roomLabel.right,
            y: subjectLabel.bottom+5,
            width: (contentView.width-separatorInset.left-separatorInset.left)/3*2,
            height: 20
        )
        queueLabel.frame = CGRect(
            x: roomLabel.right,
            y: teacherLabel.bottom+5,
            width: (contentView.width-separatorInset.left-separatorInset.left)/3*2,
            height: 20
        )
        
        if isFirstCell == true {
            separatorTop.frame = CGRect(x: 0, y: 0, width: contentView.width, height: 1)
        } else {
            separatorTop.frame = .null
        }
        separator.frame = CGRect(x: 0, y: 101, width: contentView.width, height:1)
//        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 15))
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        roomLabel.text = nil
        subjectLabel.text = nil
        teacherLabel.text = nil
        queueLabel.text = nil
        isFirstCell = false
    }

    func configure(with viewModel: AreaPreviewTableViewCellViewModel) {
        roomLabel.text = viewModel.room
        subjectLabel.text = viewModel.subject
        teacherLabel.text = viewModel.teacher
        queueLabel.text = viewModel.queue
        isFirstCell = viewModel.isFirstCell
    }
}


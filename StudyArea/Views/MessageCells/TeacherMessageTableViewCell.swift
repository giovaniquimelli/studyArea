//
//  TeacherMessageTableViewCell.swift
//  StudyArea
//
//  Created by Gio on 23/02/22.
//

import UIKit

class TeacherMessageTableViewCellViewModel {
    var text: String

    init(text: String) {
        self.text = text
    }
}

class TeacherMessageTableViewCell: UITableViewCell {
    static let identifier = "TeacherMessageTableViewCell"
    
    private let bubble: UIView = {
        let bubble = UIView()
        bubble.backgroundColor = .systemGray6
        bubble.layer.cornerRadius = 6
        bubble.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner, .layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        bubble.layer.shadowColor = UIColor.gray.cgColor
        bubble.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
        bubble.layer.shadowRadius = 3
        bubble.layer.shadowOpacity = 0.3
//        joinButton.setTitle("Enter Queue", for: .normal)
//        joinButton.titleLabel?.font = .systemFont(ofSize: 16, weight: .semibold)
        return bubble
    }()
    
    private let messageLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 15, weight: .medium)
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.clipsToBounds = true
        contentView.addSubview(bubble)
        contentView.addSubview(messageLabel)
    }

    required init?(coder: NSCoder) {
        fatalError()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        bubble.frame = CGRect(
            x: 10,
            y: 10,
            width: (contentView.width/6*5)-20,
            height: 35
        )
        
        messageLabel.frame = CGRect(
            x: 13,
            y: 18,
            width: (contentView.width/6*5)-30,
            height: 17
        )
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        messageLabel.text = nil
    }

    func configure(with viewModel: TeacherMessageTableViewCellViewModel) {
        messageLabel.text = viewModel.text
    }
}


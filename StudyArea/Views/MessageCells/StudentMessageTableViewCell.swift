//
//  StudentMessageTableViewCell.swift
//  StudyArea
//
//  Created by Gio on 23/02/22.
//

import UIKit

class StudentMessageTableViewCellViewModel {
    var text: String

    init(text: String) {
        self.text = text
    }
}

class StudentMessageTableViewCell: UITableViewCell {
    static let identifier = "StudentMessageTableViewCell"
    
    private let bubble: UIView = {
        let bubble = UIView()
        bubble.backgroundColor = .systemBlue
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
        label.textColor = .white
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
            x: (contentView.width/6*2)+10,
            y: 10,
            width: (contentView.width/6*4)-20,
            height: 35
        )
        
        messageLabel.frame = CGRect(
            x: (contentView.width/6*2)+15,
            y: 18,
            width: (contentView.width/6*4)-30,
            height: 17
        )
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        messageLabel.text = nil
    }

    func configure(with viewModel: StudentMessageTableViewCellViewModel) {
        messageLabel.text = viewModel.text
    }
}


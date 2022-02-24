//
//  SystemMessageTableViewCell.swift
//  StudyArea
//
//  Created by Gio on 02/02/22.
//

import UIKit

class SystemMessageTableViewCellViewModel {
    var text: String

    init(text: String) {
        self.text = text
    }
}

class SystemMessageTableViewCell: UITableViewCell {
    static let identifier = "SystemMessageTableViewCell"
    
    private let messageLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 15, weight: .medium)
        label.textColor = .systemBlue
        label.textAlignment = .center
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.clipsToBounds = true
        contentView.addSubview(messageLabel)
    }

    required init?(coder: NSCoder) {
        fatalError()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        messageLabel.frame = CGRect(
            x: 10,
            y: 10,
            width: contentView.width - 20,
            height: 15
        )
//        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 15))
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        messageLabel.text = nil
    }

    func configure(with viewModel: SystemMessageTableViewCellViewModel) {
        messageLabel.text = viewModel.text
    }
}


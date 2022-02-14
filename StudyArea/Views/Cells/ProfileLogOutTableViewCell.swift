//
//  ProfileLogOutTableViewCell.swift
//  StudyArea
//
//  Created by Gio on 09/02/22.
//

import UIKit

class ProfileLogOutTableViewCellViewModel {
    init() {}
}

class ProfileLogOutTableViewCell: UITableViewCell {
    static let identifier = "ProfileLogOutTableViewCell"
    
    private let separatorBottom: UIView = {
        let separator = UIView()
        separator.backgroundColor = .systemGray4
        return separator
    }()

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 20, weight: .medium)
        label.textAlignment = .center
        label.textColor = .red
        label.text = "Log out"
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.clipsToBounds = false
        contentView.addSubview(titleLabel)
        contentView.addSubview(separatorBottom)
    }

    required init?(coder: NSCoder) {
        fatalError()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        titleLabel.frame = CGRect(
            x: 0,
            y: 12,
            width: contentView.width,
            height: 24
        )
        separatorBottom.frame = CGRect(x: 0, y: 49, width: contentView.width, height:1)
    }

    override func prepareForReuse() {
        super.prepareForReuse()
    }

    func configure(with viewModel: ProfileLogOutTableViewCellViewModel) {
    }
}


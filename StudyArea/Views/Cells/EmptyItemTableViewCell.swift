//
//  EmptyItemTableViewCell.swift
//  StudyArea
//
//  Created by Gio on 09/02/22.
//

import UIKit

class EmptyItemTableViewCellViewModel {

    init() {}
}

class EmptyItemTableViewCell: UITableViewCell {
    static let identifier = "EmptyItemTableViewCell"
    
    private let separatorBottom: UIView = {
        let separator = UIView()
        separator.backgroundColor = .systemGray4
        return separator
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.clipsToBounds = true
        contentView.addSubview(separatorBottom)
        contentView.backgroundColor = .systemGray6    }

    required init?(coder: NSCoder) {
        fatalError()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        separatorBottom.frame = CGRect(x: 0, y: 49, width: contentView.width, height:1)
    }

    override func prepareForReuse() {
        super.prepareForReuse()
    }
}



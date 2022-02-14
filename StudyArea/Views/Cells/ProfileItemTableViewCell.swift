//
//  ProfileItemTableViewCell.swift
//  StudyArea
//
//  Created by Gio on 09/02/22.


import UIKit

class ProfileItemTableViewCellViewModel {
    var title: String
    var subTitle: String
    var isClickable: Bool
    var isFirstItem: Bool

    init(title: String, subTitle: String, isClickable: Bool, isFirstItem: Bool) {
        self.title = title
        self.subTitle = subTitle
        self.isClickable = isClickable
        self.isFirstItem = isFirstItem
    }
}

class ProfileItemTableViewCell: UITableViewCell {
    static let identifier = "ProfileItemTableViewCell"

    private var isClickable: Bool = {
        let isClickable = Bool()
        return isClickable
    }()
    
    private var isFirstItem: Bool = {
        let isFirstItem = Bool()
        return isFirstItem
    }()

    private let separatorTop: UIView = {
        let separator = UIView()
        separator.backgroundColor = .systemGray4
        return separator
    }()
    
    private let separatorBottom: UIView = {
        let separator = UIView()
        separator.backgroundColor = .systemGray4
        return separator
    }()

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 20, weight: .medium)
        label.textAlignment = .left
        label.textColor = .black
        return label
    }()

    private let subTitleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.font = .systemFont(ofSize: 20, weight: .medium)
        label.textAlignment = .right
        label.textColor = .systemGray3
        return label
    }()

    private let forwardButton: UIButton = {
        let button = UIButton()
//        button.backgroundColor = .systemRed
//        button.layer.cornerRadius = 6
//        button.layer.maskedCorners = .layerMaxXMaxYCorner
//        button.layer.shadowColor = UIColor.gray.cgColor
//        button.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
//        button.layer.shadowRadius = 3
//        button.layer.shadowOpacity = 0.3

        let largebutton = UIImage.SymbolConfiguration(pointSize: 12, weight: .medium, scale: .medium)

        let largeBoldbutton = UIImage(systemName: "chevron.forward", withConfiguration: largebutton)
        button.setImage(largeBoldbutton, for: .normal)
        button.tintColor = .systemGray3
        return button
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.clipsToBounds = false
        contentView.addSubview(separatorTop)
        contentView.addSubview(separatorBottom)
        contentView.addSubview(titleLabel)
        contentView.addSubview(subTitleLabel)
        contentView.addSubview(forwardButton)
    }

    required init?(coder: NSCoder) {
        fatalError()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        titleLabel.frame = CGRect(
            x: separatorInset.left,
            y: 15,
            width: (contentView.width-separatorInset.left-separatorInset.left-20)/3,
            height: 20
        )
        subTitleLabel.frame = CGRect(
            x: titleLabel.right,
            y: 15,
            width: (contentView.width-separatorInset.left-separatorInset.left-20)/3*2,
            height: 20
        )
        if isClickable {
            forwardButton.frame = CGRect(
                x: subTitleLabel.right,
                y: 15,
                width: 20,
                height: 20
            )
        }
        
        if isFirstItem {
            separatorTop.frame = CGRect(x: 0, y: 0, width: contentView.width, height: 1)
        } else {
            separatorTop.frame = .null
        }
        separatorBottom.frame = CGRect(x: 0, y: 49, width: contentView.width, height:1)
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        titleLabel.text = nil
        subTitleLabel.text = nil
        isClickable = false
        isFirstItem = false
    }

    func configure(with viewModel: ProfileItemTableViewCellViewModel) {
        titleLabel.text = viewModel.title
        subTitleLabel.text = viewModel.subTitle
        isClickable = viewModel.isClickable
        isFirstItem = viewModel.isFirstItem
    }
}


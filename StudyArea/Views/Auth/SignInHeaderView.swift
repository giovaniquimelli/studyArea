//
//  SignInHeaderView.swift
//  StudyArea
//
//  Created by Gio on 28/02/22.
//

import UIKit

class SignInHeaderView: UIView {

    private let imageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(systemName: "person.crop.circle.fill"))
        imageView.contentMode = .scaleAspectFit
//        imageView.tintColor = .systemGray4
        return imageView
    }()

//    private let label: UILabel = {
//        let label = UILabel()
//        label.textAlignment = .center
//        label.numberOfLines = 0
//        label.font = .systemFont(ofSize: 20, weight: .medium)
//        label.text = "Explore millions of articles!"
//        return label
//    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        clipsToBounds = true
//        addSubview(label)
        addSubview(imageView)
    }

    required init?(coder: NSCoder) {
        fatalError()
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        let size: CGFloat = width/4
        imageView.frame = CGRect(x: size, y: 0, width: size*2, height: size*2)
//        label.frame = CGRect(x: 20, y: imageView.bottom+10, width: width-40, height: height-size-30)
    }
}

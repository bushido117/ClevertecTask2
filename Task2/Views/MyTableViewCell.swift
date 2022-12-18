//
//  MyTableViewCell.swift
//  Task2
//
//  Created by Вадим Сайко on 16.12.22.
//

import UIKit
import SnapKit

final class MyTableViewCell: UITableViewCell {

    lazy var iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .center
        imageView.layer.cornerRadius = 30 * 0.5
        imageView.clipsToBounds = true
        imageView.backgroundColor = UIColor(red: 0.84, green: 0.85, blue: 0.86, alpha: 1.00)
        return imageView
    }()
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 0.30, green: 0.36, blue: 0.39, alpha: 1.00)
        label.adjustsFontSizeToFitWidth = true
        label.sizeToFit()
        return label
    }()
    lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 0.47, green: 0.52, blue: 0.53, alpha: 1.00)
        label.adjustsFontSizeToFitWidth = true
        label.sizeToFit()
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubviews()
        setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubviews() {
        addSubview(iconImageView)
        addSubview(titleLabel)
        addSubview(descriptionLabel)
    }
    
    private func setUpConstraints() {
        iconImageView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(15)
            make.height.equalTo(30)
            make.width.equalTo(30)
        }
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(5)
            make.leading.equalTo(iconImageView.snp.trailing).offset(10)
            make.height.equalTo(20)
        }
        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom)
            make.leading.equalTo(iconImageView.snp.trailing).offset(10)
            make.height.equalTo(14)
        }
    }
}

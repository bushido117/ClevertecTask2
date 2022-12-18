//
//  SecondVCContainerView.swift
//  Task2
//
//  Created by Вадим Сайко on 18.12.22.
//

import UIKit
import SnapKit

final class SecondVCContainerView: UIView {

    lazy var iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .center
        imageView.layer.cornerRadius = 60 * 0.5
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
    private lazy var labelsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.alignment = .center
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .systemBackground
        addSubviews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubviews() {
        labelsStackView.addArrangedSubview(titleLabel)
        labelsStackView.addArrangedSubview(descriptionLabel)
        addSubview(labelsStackView)
        addSubview(iconImageView)
    }
    
    private func setConstraints() {
        iconImageView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.height.equalTo(60)
            make.width.equalTo(60)
        }
        labelsStackView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(iconImageView.snp.bottom).offset(10)
            make.width.equalTo(70)
        }
    }

}

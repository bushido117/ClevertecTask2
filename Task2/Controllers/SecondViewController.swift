//
//  SecondViewController.swift
//  Task2
//
//  Created by Вадим Сайко on 15.12.22.
//

import UIKit
import SnapKit

final class SecondViewController: UIViewController {
    
    lazy var containerView = SecondVCContainerView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.isHidden = false
        view.addSubview(containerView)
        setConstraints()
    }
    
    override func willMove(toParent parent: UIViewController?) {
        super.willMove(toParent: parent)

        if parent == nil {
            navigationController?.navigationBar.isHidden = true
        }
    }
    
    private func setConstraints() {
        containerView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
            make.leading.equalTo(view.safeAreaLayoutGuide.snp.leading)
            make.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing)
        }
    }
}

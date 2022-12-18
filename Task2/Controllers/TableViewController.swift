//
//  ViewController.swift
//  Task2
//
//  Created by Вадим Сайко on 12.12.22.
//

import UIKit
import SnapKit

final class TableViewController: UIViewController {
    
    var tableViewModel = TableViewModel()
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(MyTableViewCell.self, forCellReuseIdentifier: String(describing: MyTableViewCell.self))
        tableView.dragInteractionEnabled = true
        tableView.dragDelegate = self
        tableView.dropDelegate = self
        tableView.delegate = self
        tableView.dataSource = self
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.isHidden = true
        view.addSubview(tableView)
        setConstraints()
    }
    
    private func setConstraints() {
        tableView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
            make.leading.equalTo(view.safeAreaLayoutGuide.snp.leading)
            make.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing)
        }
    }
}

//MARK: -TableViewDataSource
extension TableViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tableViewModel.numbers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: MyTableViewCell.self)) as? MyTableViewCell else { return UITableViewCell() }
        cell.titleLabel.text = "Title \(tableViewModel.numbers[indexPath.row])"
        cell.descriptionLabel.text = "Description \(tableViewModel.numbers[indexPath.row])"
        cell.iconImageView.image = UIImage(named: tableViewModel.icons[indexPath.row])
        return cell
    }
}

//MARK: -TableViewDelegate
extension TableViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let currentCell = tableView.cellForRow(at: indexPath) as? MyTableViewCell else { return }
        guard let currentImage = currentCell.iconImageView.image else { return }
        let resizedImage = currentImage.resizeImage(to: CGSize(width: (currentImage.size.width) * 2, height: (currentImage.size.height) * 2))
        let vc = SecondViewController()
        vc.containerView.iconImageView.image = resizedImage
        vc.containerView.titleLabel.text = currentCell.titleLabel.text ?? "No title"
        vc.containerView.descriptionLabel.text = currentCell.descriptionLabel.text ?? "No description"
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        true
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        guard sourceIndexPath != destinationIndexPath else { return }
        let number = tableViewModel.numbers.remove(at: sourceIndexPath.row)
        tableViewModel.numbers.insert(number, at: destinationIndexPath.row)
        let icon = tableViewModel.icons.remove(at: sourceIndexPath.row)
        tableViewModel.icons.insert(icon, at: destinationIndexPath.row)
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            tableViewModel.numbers.remove(at: indexPath.row)
            tableViewModel.icons.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
}

//MARK: -TableViewDragDelegate
extension TableViewController: UITableViewDragDelegate {
    func tableView(_ tableView: UITableView, itemsForBeginning session: UIDragSession, at indexPath: IndexPath) -> [UIDragItem] {
        let itemProvider = NSItemProvider()
        let item = UIDragItem(itemProvider: itemProvider)
        item.localObject = indexPath
        return [item]
    }
}

//MARK: -TableViewDropDelegate
extension TableViewController: UITableViewDropDelegate {
    func tableView(_ tableView: UITableView, performDropWith coordinator: UITableViewDropCoordinator) {
        guard let item = coordinator.session.items.first,
              let destinationIndexPath = coordinator.destinationIndexPath else { return }
        coordinator.drop(item, toRowAt: destinationIndexPath)
    }
}

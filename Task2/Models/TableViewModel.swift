//
//  TableViewModel.swift
//  Task2
//
//  Created by Вадим Сайко on 18.12.22.
//

import Foundation

struct TableViewModel {
    var icons = [[String]](repeating: ["icon0", "icon1", "icon2", "icon3", "icon4", "icon5", "icon6", "icon7", "icon8", "icon9"], count: 100).flatMap{$0}
    var numbers = Array(0...999)
}

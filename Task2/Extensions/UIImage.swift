//
//  UIImage.swift
//  Task2
//
//  Created by Вадим Сайко on 17.12.22.
//

import Foundation
import UIKit

extension UIImage {
    
    func resizeImage(to size: CGSize) -> UIImage {
        return UIGraphicsImageRenderer(size: size).image { _ in
            draw(in: CGRect(origin: .zero, size: size))
        }
    }
}

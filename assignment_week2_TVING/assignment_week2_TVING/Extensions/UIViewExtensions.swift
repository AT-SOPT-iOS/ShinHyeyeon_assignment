//
//  UIViewExtensions.swift
//  assignment_week2_TVING
//
//  Created by 신혜연 on 5/5/25.
//

import UIKit

extension UIView {
    func addSubviews(_ views: UIView...) {
        views.forEach { self.addSubview($0) }
    }
}

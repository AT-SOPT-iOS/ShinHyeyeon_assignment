//
//  TopHeaderView.swift
//  assignment_week2_TVING
//
//  Created by 신혜연 on 5/2/25.
//

import UIKit
import SnapKit

class TopHeaderView: UIViewController {
    
    private let titleImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "tving_title")
        return imageView
    }()
    
    private let searchButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "search"), for: .normal)
        return button
    }()
    
    private let smallLogoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "logo")
        return imageView
    }()
    
    private lazy var rightStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [searchButton, smallLogoImageView])
        stack.axis = .horizontal
        stack.spacing = 10
        return stack
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setLayout()
    }
    
    private func setLayout() {
        view.addSubview(titleImageView)
        view.addSubview(rightStackView)
        
        titleImageView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
                
            make.width.equalTo(191)
            make.height.equalTo(78)
        }
        
        searchButton.snp.makeConstraints { make in
            make.width.height.equalTo(30)
        }

        smallLogoImageView.snp.makeConstraints { make in
            make.width.height.equalTo(30)
        }
        
        rightStackView.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(11)
            make.centerY.equalToSuperview()
        }
    }
}

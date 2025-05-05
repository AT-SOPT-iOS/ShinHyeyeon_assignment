//
//  WelcomeViewController.swift
//  assignment_week2_TVING
//
//  Created by 신혜연 on 4/26/25.
//

import UIKit
import SnapKit

class WelcomeViewController : UIViewController {
    
    var id: String? = ""
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "tving")
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "atsopt@naver.com 님\n반가워요!"
        label.textColor = .white
        label.textAlignment = .center
        label.numberOfLines = 2
        label.font = .boldSystemFont(ofSize: 23)
        return label
    }()
    
    private let backToMainButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("메인으로", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.backgroundColor = UIColor(named:"tving_red")
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 3
        button.addTarget(self, action: #selector(backToLoginButtonDidTap), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        setLayout()
        bindID()
        
        navigationItem.hidesBackButton = true
    }
    
    func setLayout() {
        [imageView, titleLabel, backToMainButton].forEach {
            self.view.addSubview($0)
        }
        
        imageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(58)
            make.height.equalTo(211)
            make.width.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).offset(67)
            make.leading.equalToSuperview().offset(78)
            make.trailing.equalToSuperview().offset(-78)
        }
        
        backToMainButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-66)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.height.equalTo(52)
        }
    }
    
    private func bindID() {
        self.titleLabel.text = "\(id ?? "atsopt@naver.com")님 \n반가워요!"
    }
    
    @objc
    private func backToLoginButtonDidTap() {
        let mainVC = MainViewController()
        self.navigationController?.pushViewController(mainVC, animated: true)
    }
}

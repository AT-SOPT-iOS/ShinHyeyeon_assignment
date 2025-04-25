//
//  LoginViewController.swift
//  assignment_week2_TVING
//
//  Created by 신혜연 on 4/25/25.
//

import UIKit
import SnapKit

class LoginViewController: UIViewController, UITextFieldDelegate {
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "TVING ID 로그인"
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 23)
        return label
    }()
    
    private let idTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "아이디"
        textField.textColor = .white
        textField.backgroundColor = .darkGray
        textField.font = UIFont.boldSystemFont(ofSize: 15)
        textField.layer.cornerRadius = 3
        textField.addPadding(left: 22)
        
        textField.attributedPlaceholder = NSAttributedString(
            string: "아이디",
            attributes: [NSAttributedString.Key.foregroundColor : UIColor.white]
        )
        return textField
    }()
    
    private let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "비밀번호"
        textField.textColor = .white
        textField.backgroundColor = .darkGray
        textField.font = UIFont.boldSystemFont(ofSize: 15)
        textField.layer.cornerRadius = 3
        textField.addPadding(left: 22)
        
        textField.attributedPlaceholder = NSAttributedString(
            string: "비밀번호",
            attributes: [NSAttributedString.Key.foregroundColor : UIColor.white]
        )
        return textField
    }()
    
    private let loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("로그인하기", for: .normal)
        button.backgroundColor = .black
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 3
        button.layer.borderColor = UIColor.gray.cgColor
        button.layer.borderWidth = 1
        return button
    }()
    
    private let findIdButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("아이디 찾기", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        return button
    }()
    
    private let separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = .gray
        return view
    }()
    
    private let findPasswordButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("비밀번호 찾기", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        return button
    }()
    
    private let noAccountLabel: UILabel = {
        let label = UILabel()
        label.text = "아직 계정이 없으신가요?"
        label.textColor = .gray
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    private let createNicknameButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("닉네임 만들러가기", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        button.setUnderline()
        return button
    }()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        view.backgroundColor = .black
        setLayout()
        idTextField.delegate = self
        passwordTextField.delegate = self
        
        loginButton.addTarget(self, action: #selector(dismissKeyboard), for: .touchUpInside)
        findIdButton.addTarget(self, action: #selector(dismissKeyboard), for: .touchUpInside)
        findPasswordButton.addTarget(self, action: #selector(dismissKeyboard), for: .touchUpInside)
        createNicknameButton.addTarget(self, action: #selector(dismissKeyboard), for: .touchUpInside)
    }
    
    private func setLayout() {
        [titleLabel, idTextField, passwordTextField, loginButton, findIdButton, separatorView, findPasswordButton, noAccountLabel, createNicknameButton].forEach {
            self.view.addSubview($0)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            
            idTextField.snp.makeConstraints { make in
                make.top.equalTo(titleLabel.snp.bottom).offset(31)
                make.leading.equalToSuperview().offset(20)
                make.trailing.equalToSuperview().offset(-20)
                make.height.equalTo(52)
            }
            
            passwordTextField.snp.makeConstraints { make in
                make.top.equalTo(idTextField.snp.bottom).offset(7)
                make.leading.trailing.height.equalTo(idTextField)
            }
            
            loginButton.snp.makeConstraints { make in
                make.top.equalTo(passwordTextField.snp.bottom).offset(21)
                make.leading.trailing.height.equalTo(idTextField)
            }
        }
        
        findIdButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview().offset(-70)
            make.top.equalTo(loginButton.snp.bottom).offset(31)
        }
        
        separatorView.snp.makeConstraints { make in
            make.centerY.equalTo(findIdButton.snp.centerY)
            make.leading.equalTo(findIdButton.snp.trailing).offset(33)
            make.trailing.equalTo(findPasswordButton.snp.leading).offset(-33)
            make.width.equalTo(1)
            make.height.equalTo(15)
        }
        
        findPasswordButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview().offset(70)
            make.centerY.equalTo(findIdButton.snp.centerY)
        }
        
        noAccountLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(23)
            make.top.equalTo(findIdButton.snp.bottom).offset(28)
        }
        
        createNicknameButton.snp.makeConstraints { make in
            make.centerY.equalTo(noAccountLabel.snp.centerY)
            make.trailing.equalToSuperview().offset(-25)
        }
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.layer.borderColor = UIColor.white.cgColor
        textField.layer.borderWidth = 1.0
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.layer.borderColor = UIColor.darkGray.cgColor
        textField.layer.borderWidth = 0.0
    }
    
    // 화면의 다른 버튼을 눌러도 텍스트필드의 border가 비활성화됨
    @objc func dismissKeyboard() {
        if idTextField.isFirstResponder {
            idTextField.resignFirstResponder()
            textFieldDidEndEditing(idTextField)
        }
        if passwordTextField.isFirstResponder {
            passwordTextField.resignFirstResponder()
            textFieldDidEndEditing(passwordTextField)
        }
    }
}

//
//  MainViewController.swift
//  assignment_week2_TVING
//
//  Created by 신혜연 on 5/2/25.
//

import UIKit
import SnapKit

class MainViewController: UIViewController {
    
    // MARK: - Properties
    let scrollView = UIScrollView()
    let contentView = UIView()
    let headerView = TopHeaderView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        
        view.addSubview(headerView.view)
        view.addSubview(scrollView)
        
        scrollView.addSubview(contentView)
        
        setLayout()
    }

    private func setLayout() {
        
        headerView.view.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.leading.trailing.equalToSuperview()
        }
        
        scrollView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        contentView.snp.makeConstraints {
            $0.edges.equalTo(scrollView.contentLayoutGuide)
            $0.width.equalTo(scrollView.frameLayoutGuide)
        }
    }
}

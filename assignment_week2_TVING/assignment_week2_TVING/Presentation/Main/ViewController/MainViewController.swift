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
    // 오늘의 티빙 어쩌고 20해도 될 듯(함수로 묶을 필요는 없는 것 같다)
    lazy var sectionTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "오늘의 티빙 TOP 20"
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 15)
        return label
    }()
    let scrollView = UIScrollView()
    let contentView = UIView()
    let headerView = TopHeaderView()
    let categoryStackView = UIStackView()
    let underlineView = UIView()
    let posterImageView = UIImageView()
    
    let categories = ["홈", "드라마", "예능", "영화", "스포츠", "뉴스"]
    var selectedIndex = 0
    
    let todayTop = TodayTopView()
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        navigationController?.isNavigationBarHidden = true
        
        // 메서드만 선언할 수 있게
        setUI()
        setCategoryStackView()
        setUnderline()
        setPosterImageView()
        setLayout()
    }
    
    private func setUI() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(headerView.view)
        contentView.addSubview(categoryStackView)
        contentView.addSubview(underlineView)
        contentView.addSubview(posterImageView)
        contentView.addSubview(sectionTitleLabel)
        contentView.addSubview(todayTop)
    }
    
    private func setCategoryStackView() {
        categoryStackView.axis = .horizontal
        categoryStackView.distribution = .fillEqually
        categoryStackView.alignment = .fill
        categoryStackView.spacing = 0
        
        for (index, title) in categories.enumerated() {
            let label = UILabel()
            label.text = title
            label.textColor = .white
            label.textAlignment = .center
            label.isUserInteractionEnabled = true
            label.tag = index
            
            categoryStackView.addArrangedSubview(label)
        }
    }
    
    private func setUnderline() {
        underlineView.backgroundColor = .white
    }
    
    private func setPosterImageView() {
        posterImageView.image = UIImage(named: "main_poster")
        posterImageView.contentMode = .scaleAspectFill
        posterImageView.clipsToBounds = true
    }
    
    private func setLayout() {
        
        scrollView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.left.right.bottom.equalToSuperview()
        }
        
        contentView.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.width.equalTo(scrollView)
            $0.height.greaterThanOrEqualToSuperview().priority(.low)
        }
        
        headerView.view.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.trailing.equalToSuperview()
        }
        
        categoryStackView.snp.makeConstraints {
            $0.top.equalTo(headerView.view.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(27)
        }
        
        posterImageView.snp.makeConstraints {
            $0.top.equalTo(categoryStackView.snp.bottom).offset(7)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(420)
        }
        
        sectionTitleLabel.snp.makeConstraints {
            $0.top.equalTo(posterImageView.snp.bottom).offset(9)
            $0.leading.equalToSuperview().offset(12)
        }
        
        todayTop.snp.makeConstraints {
            $0.top.equalTo(sectionTitleLabel.snp.bottom).offset(10)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(230)
            $0.bottom.equalToSuperview().inset(30)
            
        }
    }
}

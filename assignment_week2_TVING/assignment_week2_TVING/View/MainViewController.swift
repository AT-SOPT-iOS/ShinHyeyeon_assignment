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
    let categoryStackView = UIStackView()
    let underlineView = UIView()
    let posterImageView = UIImageView()
    let sectionTitleLabel = UILabel()
    
    let categories = ["홈", "드라마", "예능", "영화", "스포츠", "뉴스"]
    var selectedIndex = 0
    
    let todayTopVC = TodayTopViewController().collectionView
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        
        view.addSubview(scrollView)
        view.addSubview(headerView.view)
        view.addSubview(categoryStackView)
        view.addSubview(underlineView)
        
        scrollView.addSubview(contentView)
        contentView.addSubview(posterImageView)
        contentView.addSubview(sectionTitleLabel)
        contentView.addSubview(todayTopVC)
        
        setCategoryStackView()
        setUnderline()
        setPosterImageView()
        setTitleLabel()
        setLayout()
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
    
    private func setTitleLabel() {
        sectionTitleLabel.text = "오늘의 티빙 TOP 20"
        sectionTitleLabel.textColor = .white
        sectionTitleLabel.font = .boldSystemFont(ofSize: 15)
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
        
        // 콘텐츠 뷰 안에 때려넣기
        headerView.view.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.leading.trailing.equalToSuperview()
        }
        
        categoryStackView.snp.makeConstraints {
            $0.top.equalTo(headerView.view.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(27)
        }
        
        // 첫번째 라벨에 언더라인이 중심에 위치
        guard let firstLabel = categoryStackView.arrangedSubviews.first else { return }
        underlineView.snp.makeConstraints {
            $0.top.equalTo(categoryStackView.snp.bottom)
            $0.centerX.equalTo(firstLabel.snp.centerX)
            $0.width.equalTo(15)
            $0.height.equalTo(3)
        }
        
        posterImageView.snp.makeConstraints {
            $0.top.equalTo(underlineView.snp.bottom).offset(7)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(420)
        }
        
        sectionTitleLabel.snp.makeConstraints {
            $0.top.equalTo(posterImageView.snp.bottom).offset(9)
            $0.leading.trailing.equalToSuperview().offset(12)
        }
        
        todayTopVC.snp.makeConstraints {
            $0.top.equalTo(sectionTitleLabel.snp.bottom).offset(10)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(150)
            $0.bottom.equalToSuperview().inset(30)
        }
    }
}

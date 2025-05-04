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
    
    let categories = ["홈", "드라마", "예능", "영화", "스포츠", "뉴스"]
    var selectedIndex = 0
    
    let todayTop = TodaysTop20()
    let popularLive = RealTimePopularLive()
    let popularMovie = RealTimePopularMovie()
    let baseball = Baseball()
    let channel = Channel()
    let masterpiece = Masterpiece()
    
    private let footerContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 33/255, green: 33/255, blue: 33/255, alpha: 1)
        view.layer.cornerRadius = 5
        return view
    }()
    
    private let noticeLabel: UILabel = {
        let label = UILabel()
        label.text = "공지"
        label.textColor = UIColor(red: 140/255, green: 140/255, blue: 140/255, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 11)
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "티빙 계정 공유 정책 추가 안내"
        label.textColor = UIColor(red: 217/255, green: 217/255, blue: 217/255, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 11)
        return label
    }()
    
    private let arrowImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "chevron.forward")
        imageView.tintColor = .white
        return imageView
    }()
    
    private let footerLabel: UILabel = {
        let label = UILabel()
        let text = "고객문의 • 이용약관 • 개인정보처리방침\n사업자정보 • 인재채용"
        let attributedText = NSMutableAttributedString(string: text, attributes: [
            .foregroundColor: UIColor(white: 140/255, alpha: 1)
        ])
        
        if let range = text.range(of: "개인정보처리방침") {
            attributedText.addAttribute(.foregroundColor, value: UIColor(white: 217/255, alpha: 1), range: NSRange(range, in: text))
        }
        
        label.attributedText = attributedText
        label.font = UIFont.systemFont(ofSize: 11)
        label.numberOfLines = 0
        return label
    }()
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        navigationController?.isNavigationBarHidden = true
        
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
        contentView.addSubview(todayTop)
        contentView.addSubview(popularLive)
        contentView.addSubview(popularMovie)
        contentView.addSubview(baseball)
        contentView.addSubview(channel)
        contentView.addSubview(masterpiece)
        contentView.addSubview(footerContainerView)
        contentView.addSubview(footerLabel)
        
        footerContainerView.addSubview(noticeLabel)
        footerContainerView.addSubview(descriptionLabel)
        footerContainerView.addSubview(arrowImageView)
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
            $0.height.equalTo(60)
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
        
        todayTop.snp.makeConstraints {
            $0.top.equalTo(posterImageView.snp.bottom).offset(9)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(200)
        }
        
        popularLive.snp.makeConstraints {
            $0.top.equalTo(todayTop.snp.bottom)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(200)
        }
        
        popularMovie.snp.makeConstraints {
            $0.top.equalTo(popularLive.snp.bottom)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(200)
        }
        
        baseball.snp.makeConstraints {
            $0.top.equalTo(popularMovie.snp.bottom)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(100)
        }
        
        channel.snp.makeConstraints {
            $0.top.equalTo(baseball.snp.bottom)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(50)
        }
        
        masterpiece.snp.makeConstraints {
            $0.top.equalTo(channel.snp.bottom).offset(25)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(100)
        }
        
        footerContainerView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(masterpiece.snp.bottom).offset(50)
            $0.width.equalTo(387)
            $0.height.equalTo(50)
        }
        
        noticeLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(16)
        }
        
        descriptionLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(noticeLabel.snp.trailing).offset(8)
        }
        
        arrowImageView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().inset(12)
            $0.size.equalTo(18)
        }
        
        footerLabel.snp.makeConstraints {
            $0.top.equalTo(footerContainerView.snp.bottom).offset(16)
            $0.leading.equalTo(footerContainerView.snp.leading)
            $0.bottom.equalToSuperview().inset(50)
        }
    }
}

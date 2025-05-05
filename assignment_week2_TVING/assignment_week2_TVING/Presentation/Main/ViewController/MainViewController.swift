//
//  MainViewController.swift
//  assignment_week2_TVING
//
//  Created by 신혜연 on 5/2/25.
//

import UIKit
import SnapKit
import Then

class MainViewController: UIViewController {
    
    // MARK: - Properties
    let scrollView = UIScrollView()
    let contentView = UIView()
    
    let todayTop = TodaysTop20()
    let popularLive = RealTimePopularLive()
    let popularMovie = RealTimePopularMovie()
    let baseball = Baseball()
    let channel = Channel()
    let masterpiece = Masterpiece()
    
    private let posterImageView = UIImageView().then {
        $0.contentMode = .scaleAspectFill
        $0.image = UIImage(named: "main_poster")
        $0.clipsToBounds = true
    }
    
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
        label.font = UIFont(name: "Pretendard-Medium", size: 11)
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "티빙 계정 공유 정책 추가 안내"
        label.textColor = UIColor(red: 217/255, green: 217/255, blue: 217/255, alpha: 1)
        label.font = UIFont(name: "Pretendard-Medium", size: 11)
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
        label.font = UIFont(name: "Pretendard-Medium", size: 11)
        label.numberOfLines = 0
        return label
    }()
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setStyle()
        setUI()
        setLayout()
    }
    
    // MARK: - UI Setting
    private func setStyle() {
        view.backgroundColor = .black
        scrollView.showsVerticalScrollIndicator = false
        navigationController?.isNavigationBarHidden = true
    }
    
    private func setUI() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        contentView.addSubviews(
            posterImageView,
            todayTop,
            popularLive,
            popularMovie,
            baseball,
            channel,
            masterpiece,
            footerContainerView,
            footerLabel
        )
        
        footerContainerView.addSubviews(
            noticeLabel,
            descriptionLabel,
            arrowImageView
        )
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
        
        posterImageView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(440)
        }
        
        todayTop.snp.makeConstraints {
            $0.top.equalTo(posterImageView.snp.bottom).offset(9)
            $0.leading.equalToSuperview().offset(12)
            $0.trailing.equalToSuperview()
            $0.height.equalTo(200)
        }
        
        popularLive.snp.makeConstraints {
            $0.top.equalTo(todayTop.snp.bottom)
            $0.leading.equalToSuperview().offset(13)
            $0.trailing.equalToSuperview()
            $0.height.equalTo(190)
        }
        
        popularMovie.snp.makeConstraints {
            $0.top.equalTo(popularLive.snp.bottom)
            $0.leading.equalToSuperview().offset(15)
            $0.trailing.equalToSuperview()
            $0.height.equalTo(190)
        }
        
        baseball.snp.makeConstraints {
            $0.top.equalTo(popularMovie.snp.bottom)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(80)
        }
        
        channel.snp.makeConstraints {
            $0.top.equalTo(baseball.snp.bottom).offset(28)
            $0.leading.equalToSuperview().offset(15)
            $0.trailing.equalToSuperview()
            $0.height.equalTo(50)
        }
        
        masterpiece.snp.makeConstraints {
            $0.top.equalTo(channel.snp.bottom).offset(25)
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.height.equalTo(100)
        }
        
        footerContainerView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(masterpiece.snp.bottom).offset(50)
            $0.leading.equalToSuperview().offset(14)
            $0.trailing.equalToSuperview().offset(-14)
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
            $0.leading.equalToSuperview().offset(20)
            $0.bottom.equalToSuperview().inset(50)
        }
    }
}

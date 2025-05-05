//
//  MainViewController.swift
//  assignment_week2_TVING
//
//  Created by 신혜연 on 5/5/25.
//

import UIKit
import Then

class MainViewController: UIViewController {
    
    // MARK: - Properties
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    
    let categories = ["홈", "드라마", "예능", "영화", "스포츠", "뉴스"]
    
    private let tvingTitleImageView = UIImageView().then  {
        $0.contentMode = .scaleAspectFit
        $0.image = UIImage(named: "tving_title")
    }
    
    private let headerStackView = UIStackView().then {
        $0.axis = .horizontal
        $0.spacing = 16
        $0.alignment = .center
    }
    
    private let searchImageView = UIImageView().then {
        $0.contentMode = .scaleAspectFit
        $0.image = UIImage(named: "search")
    }
    
    private let tvingLogoImageView = UIImageView().then {
        $0.contentMode = .scaleAspectFit
        $0.image = UIImage(named: "logo")
    }
    
    private lazy var segmentedControl = UISegmentedControl(items: categories).then {
        let font = UIFont(name: "Pretendard-Regular", size: 17) ?? UIFont.systemFont(ofSize: 17)
        
        $0.setTitleTextAttributes([.font: font, .foregroundColor: UIColor.white], for: .normal)
        $0.setTitleTextAttributes([.font: font, .foregroundColor: UIColor.white], for: .selected)
        $0.backgroundColor = .clear
        $0.removeBackgroundAndDivider()
        $0.selectedSegmentIndex = 0
        $0.addTarget(self, action: #selector(segmentChanged), for: .valueChanged)
    }
    
    private let underlineView = UIView().then {
        $0.backgroundColor = .white
    }
    
    private var currentChildVC: UIViewController?
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setStyle()
        setUI()
        setLayout()
        updateUnderlinePosition(animated: false)
        showChildViewController(for: segmentedControl.selectedSegmentIndex)
    }
    
    // MARK: - UI Setting
    private func setStyle() {
        view.backgroundColor = .black
        navigationController?.isNavigationBarHidden = true
    }
    
    private func setUI() {
        view.addSubview(scrollView)
        
        scrollView.addSubview(contentView)
        
        contentView.addSubviews(
            tvingTitleImageView,
            headerStackView,
            searchImageView,
            tvingLogoImageView,
            segmentedControl,
            underlineView
        )
        
        headerStackView.addArrangedSubview(searchImageView)
        headerStackView.addArrangedSubview(tvingLogoImageView)
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
        
        tvingTitleImageView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.width.equalTo(191)
            $0.height.equalTo(78)
        }
        
        headerStackView.snp.makeConstraints {
            $0.centerY.equalTo(tvingTitleImageView)
            $0.trailing.equalToSuperview().inset(20)
        }
        
        [searchImageView, tvingLogoImageView].forEach {
            $0.snp.makeConstraints {
                $0.size.equalTo(30)
            }
        }
        
        segmentedControl.snp.makeConstraints {
            $0.top.equalTo(headerStackView.snp.bottom).offset(20)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(32)
        }
        
        underlineView.snp.makeConstraints {
            $0.top.equalTo(segmentedControl.snp.bottom)
            $0.width.equalTo(15)
            $0.height.equalTo(3)
            $0.centerX.equalTo(segmentedControl.snp.leading)
        }
    }
    
    // MARK: - UI Action
    @objc private func segmentChanged(_ sender: UISegmentedControl) {
        print("선택된 카테고리: \(categories[sender.selectedSegmentIndex])")
        updateUnderlinePosition(animated: true)
    }
    
    // 언더라인 가운데 배치
    private func updateUnderlinePosition(animated: Bool = true) {
        let segmentWidth = segmentedControl.frame.width / CGFloat(categories.count)
        let centerX = segmentWidth * (CGFloat(segmentedControl.selectedSegmentIndex) + 0.5)
        
        underlineView.snp.updateConstraints {
            $0.centerX.equalTo(segmentedControl.snp.leading).offset(centerX)
        }
        
        if animated {
            UIView.animate(withDuration: 0.3) {
                self.view.layoutIfNeeded()
            }
        }
    }
    
    // MARK: - ChildViewController 관리
    private func showChildViewController(for index: Int) {
        // 이전 VC 제거하기
        if let current = currentChildVC {
            current.willMove(toParent: nil)
            current.view.removeFromSuperview()
            current.removeFromParent()
        }
        
        // 새로운 VC 보여주기
        let newVC: UIViewController
        switch index {
        case 0:
            newVC = HomeViewController()
        default:
            newVC = HomeViewController()
        }
        
        addChild(newVC)
        contentView.addSubview(newVC.view)
        
        newVC.view.snp.makeConstraints {
            $0.top.equalTo(underlineView.snp.bottom).offset(10)
            $0.leading.trailing.bottom.equalToSuperview()
        }
        
        newVC.didMove(toParent: self)
        currentChildVC = newVC
    }
}

extension UISegmentedControl {
    func removeBackgroundAndDivider() {
        let clearImage = UIImage()
        setBackgroundImage(clearImage, for: .normal, barMetrics: .default)
        setBackgroundImage(clearImage, for: .selected, barMetrics: .default)
        setBackgroundImage(clearImage, for: .highlighted, barMetrics: .default)
        setDividerImage(clearImage, forLeftSegmentState: .normal, rightSegmentState: .normal, barMetrics: .default)
    }
}

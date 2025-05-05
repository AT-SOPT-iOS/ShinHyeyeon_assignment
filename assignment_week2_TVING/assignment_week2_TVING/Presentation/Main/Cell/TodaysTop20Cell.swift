//
//  TodaysTop20Cell.swift
//  assignment_week2_TVING
//
//  Created by 신혜연 on 5/3/25.
//

import UIKit
import Then

class TodaysTop20Cell: UICollectionViewCell {
    
    // MARK: - Properties
    static let identifier = "TodaysTop20Cell"
    
    private let todayTopLabel = UILabel().then {
        $0.textColor = .white
        $0.font = UIFont(name: "Pretendard-SemiBold", size: 50)
        $0.transform = CGAffineTransform(rotationAngle: 0.15)
    }
    
    private let todayTopImageView = UIImageView().then {
        $0.contentMode = .scaleAspectFill
        $0.layer.cornerRadius = 3
        $0.clipsToBounds = true
    }
    
    // MARK: - Life Cycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UI Setting
    private func setUI() {
        addSubviews(todayTopLabel, todayTopImageView)
    }
    
    private func setLayout() {
        todayTopLabel.snp.makeConstraints {
            $0.bottom.equalTo(todayTopImageView.snp.bottom)
            $0.leading.equalToSuperview()
        }
        
        todayTopImageView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalTo(todayTopLabel.snp.trailing).offset(8)
            $0.width.equalTo(98)
            $0.height.equalTo(146)
        }
    }
}

extension TodaysTop20Cell {
    func dataBind(_ itemData: TodaysTop20Content, itemRow: Int) {
        todayTopLabel.text = "\(itemData.rank)"
        todayTopImageView.image = itemData.poster
    }
}

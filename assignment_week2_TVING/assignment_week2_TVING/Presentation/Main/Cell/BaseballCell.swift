//
//  BaseballCell.swift
//  assignment_week2_TVING
//
//  Created by 신혜연 on 5/3/25.
//

import UIKit
import Then

class BaseballCell: UICollectionViewCell {
    
    // MARK: - Properties
    static let identifier = "BaseballCell"
    
    private let backgroundContainerView = UIView()
  
    private let baseballImageView = UIImageView().then {
        $0.contentMode = .scaleAspectFit
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
        addSubview(backgroundContainerView)
        backgroundContainerView.addSubview(baseballImageView)
    }
    
    private func setLayout() {
        backgroundContainerView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.width.equalTo(80)
            $0.height.equalTo(50)
        }
        
        baseballImageView.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.size.equalTo(40)
        }
    }
}

// 셀의 홀/짝 여부에 따라 배경 색상 지정
extension BaseballCell {
    func dataBind(_ itemData: BaseballContent, itemRow: Int) {
        baseballImageView.image = itemData.logoImage
        backgroundContainerView.backgroundColor = itemRow % 2 == 1 ? .clear : .white
    }
}

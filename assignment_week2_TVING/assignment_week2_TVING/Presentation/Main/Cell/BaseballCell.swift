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
        self.backgroundColor = .black
        
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Layout
    private func setLayout() {
        contentView.addSubview(backgroundContainerView)
        backgroundContainerView.addSubview(baseballImageView)
        
        backgroundContainerView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.width.equalTo(80)
            $0.height.equalTo(50)
        }
        
        baseballImageView.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.size.equalTo(40)
        }
    }
    
    func configure(_ content: BaseballContent, index: Int) {
        baseballImageView.image = content.logoImage
        backgroundContainerView.backgroundColor = index % 2 == 1 ? .clear : .white
    }
}

extension BaseballCell {
    func dataBind(_ itemData: BaseballContent, itemRow: Int) {
        baseballImageView.image = itemData.logoImage
    }
}

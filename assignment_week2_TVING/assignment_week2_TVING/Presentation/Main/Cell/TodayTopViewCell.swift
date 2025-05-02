//
//  TodayTopCollectionViewCell.swift
//  assignment_week2_TVING
//
//  Created by 신혜연 on 5/2/25.
//

import UIKit

class TodayTopViewCell: UICollectionViewCell {
    
    static let identifier = "TodayTopCollectionViewCell"
    
    private let todayTopLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont.italicSystemFont(ofSize: 50)
        return label
    }()
    
    private let todayTopImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 3
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    
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
        [todayTopLabel, todayTopImageView].forEach {
            contentView.addSubview($0)
        }
        
        todayTopLabel.snp.makeConstraints {
            $0.bottom.equalToSuperview()
        }
        
        todayTopImageView.snp.makeConstraints {
            $0.leading.equalTo(todayTopLabel.snp.trailing).offset(8)
            $0.height.equalTo(146)
            $0.width.equalTo(98)
        }
    }
}

extension TodayTopViewCell {
    func dataBind(_ itemData: TodayTopModel, itemRow: Int) {
        todayTopLabel.text = itemData.num
        todayTopImageView.image = itemData.poster
    }
}

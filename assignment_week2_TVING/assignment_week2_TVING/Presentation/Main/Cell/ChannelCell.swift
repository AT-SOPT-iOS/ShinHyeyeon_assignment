//
//  ChannelCell.swift
//  assignment_week2_TVING
//
//  Created by 신혜연 on 5/3/25.
//

import UIKit
import Then

class ChannelCell: UICollectionViewCell {
    
    // MARK: - Properties
    static let identifier = "ChannelCell"
    
    private let backgroundContainerView = UIView()
  
    private let channelImageView = UIImageView().then {
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
        addSubview(channelImageView)
        
        channelImageView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview().offset(12)
            $0.width.equalTo(90)
            $0.height.equalTo(45)
        }
    }
    
    func configure(_ content: ChannelContent) {
        channelImageView.image = content.logoImage
    }
}

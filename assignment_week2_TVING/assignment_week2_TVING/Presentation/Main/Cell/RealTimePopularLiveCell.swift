//
//  RealTimePopularLiveCell.swift
//  assignment_week2_TVING
//
//  Created by 신혜연 on 5/3/25.
//

import UIKit
import Then

class RealTimePopularLiveCell: UICollectionViewCell {
    
    // MARK: - Properties
    static let identifier = "RealTimePopularLiveCell"
    
    private let liveImageView = UIImageView().then {
        $0.contentMode = .scaleAspectFill
        $0.layer.cornerRadius = 3
        $0.clipsToBounds = true
    }
    
    private let liveRankLabel = UILabel().then {
        $0.font = UIFont.boldSystemFont(ofSize: 19)
        $0.textColor = .white
        $0.transform = CGAffineTransform(rotationAngle: 0.15)
    }
    
    private let liveTitleLabel = UILabel().then {
        $0.textColor = .white
        $0.font = UIFont.systemFont(ofSize: 10)
    }
    
    private let liveEpisodeLabel = UILabel().then {
        $0.textColor = .gray
        $0.font = UIFont.systemFont(ofSize: 10)
    }
    
    private let liveRatingsLabel = UILabel().then {
        $0.textColor = .gray
        $0.font = UIFont.systemFont(ofSize: 10)
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
        addSubviews(
            liveImageView,
            liveRankLabel,
            liveTitleLabel,
            liveEpisodeLabel,
            liveRatingsLabel
        )
    }
    
    private func setLayout() {
        liveImageView.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(8)
            $0.height.equalTo(80)
            $0.width.equalTo(160)
        }
        
        liveRankLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(16)
            $0.top.equalTo(liveImageView.snp.bottom).offset(8)
        }
        
        liveTitleLabel.snp.makeConstraints {
            $0.leading.equalTo(liveRankLabel.snp.trailing).offset(7)
            $0.top.equalTo(liveImageView.snp.bottom).offset(10)
        }
        
        liveEpisodeLabel.snp.makeConstraints {
            $0.leading.equalTo(liveRankLabel.snp.trailing).offset(7)
            $0.top.equalTo(liveTitleLabel.snp.bottom).offset(4)
        }
        
        liveRatingsLabel.snp.makeConstraints {
            $0.leading.equalTo(liveRankLabel.snp.trailing).offset(7)
            $0.top.equalTo(liveEpisodeLabel.snp.bottom).offset(4)
        }
    }
}

extension RealTimePopularLiveCell {
    func dataBind(_ itemData: RealTimePopularLiveContent, itemRow: Int) {
        liveImageView.image = itemData.posterImage
        liveRankLabel.text = "\(itemData.rank)"
        liveTitleLabel.text = itemData.title
        liveEpisodeLabel.text = itemData.episode
        liveRatingsLabel.text = itemData.ratings

    }
}

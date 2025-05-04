//
//  RealTimePopularMovieCell.swift
//  assignment_week2_TVING
//
//  Created by 신혜연 on 5/3/25.
//

import UIKit
import Then

class RealTimePopularMovieCell: UICollectionViewCell {
    
    // MARK: - Properties
    static let identifier = "RealTimePopularMovieCell"
    
    private let movieImageView = UIImageView().then {
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 3
        $0.contentMode = .scaleAspectFill
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
        [movieImageView].forEach {
            contentView.addSubview($0)
        }
        
        movieImageView.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.width.equalTo(98)
            $0.height.equalTo(146)
        }
    }
}

extension RealTimePopularMovieCell {
    func dataBind(_ itemData: RealTimePopularMovieContent, itemRow: Int) {
        movieImageView.image = itemData.posterImage
    }
}

//
//  MasterPieceCell.swift
//  assignment_week2_TVING
//
//  Created by 신혜연 on 5/3/25.
//

import UIKit
import Then

class MasterpieceCell: UICollectionViewCell {
    
    // MARK: - Properties
    static let identifier = "MasterPieceCell"
    
    private let backgroundContainerView = UIView()
  
    private let masterPieceImageView = UIImageView().then {
        $0.contentMode = .scaleAspectFit
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
        addSubview(masterPieceImageView)
    }
    
    private func setLayout() {
        masterPieceImageView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.width.equalTo(160)
            $0.height.equalTo(90)
        }
    }
}

extension MasterpieceCell {
    func dataBind(_ itemData: MasterpieceContent, itemRow: Int) {
        masterPieceImageView.image = itemData.posterImage
    }
}

//
//  RealTimePopularLive.swift
//  assignment_week2_TVING
//
//  Created by 신혜연 on 5/3/25.
//

import UIKit
import SnapKit

// UIView로 변경하기
class RealTimePopularLive: UIView {
    
    // MARK: - Properties
    private let itemData = RealTimePopularLiveContent.dummy()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "실시간 인기 LIVE"
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 18)
        return label
    }()
    
    private let moreLabel: UILabel = {
        let label = UILabel()
        label.text = "더보기"
        label.textColor = .gray
        label.font = UIFont.systemFont(ofSize: 12)
        return label
    }()
    
    public let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 160, height: 140)
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = .black
        collectionView.register(RealTimePopularLiveCell.self, forCellWithReuseIdentifier: RealTimePopularLiveCell.identifier)
        return collectionView
    }()
    
    // MARK: - Life Cycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .black
        
        setLayout()
        setDelegate()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Layout
    private func setLayout() {
        addSubview(titleLabel)
        addSubview(moreLabel)
        addSubview(collectionView)
        
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview().offset(8)
        }
        
        moreLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.trailing.equalToSuperview().offset(-8)
        }
        
        collectionView.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(9)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(140)
        }
    }
    
    
    // MARK: - Delegate
    private func setDelegate() {
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    private func setCollectionView() {
        collectionView.register(TodaysTop20Cell.self, forCellWithReuseIdentifier: TodaysTop20Cell.identifier)
    }
}

// MARK: - UICollectionView Delegate & DataSource
extension RealTimePopularLive: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return itemData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RealTimePopularLiveCell.identifier, for: indexPath) as? RealTimePopularLiveCell else {
            return UICollectionViewCell()
        }
        cell.dataBind(itemData[indexPath.item], itemRow: indexPath.item)
        return cell
    }
}

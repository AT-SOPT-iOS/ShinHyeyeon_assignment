//
//  Channel.swift
//  assignment_week2_TVING
//
//  Created by 신혜연 on 5/3/25.
//

import UIKit
import SnapKit

class Channel: UIView, UICollectionViewDelegate {
    
    // MARK: - Properties
    private var itemData = ChannelContent.dummy()

    public let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 7
        layout.itemSize = CGSize(width: 90, height: 45)
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = .black
        return collectionView
    }()
    
    // MARK: - Life Cycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUI()
        setLayout()
        setCollectionView()
        setDelegate()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UI Setting
    private func setUI() {
        addSubview(collectionView)
    }
    
    private func setLayout() {
        collectionView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview().offset(12)
            $0.trailing.equalToSuperview()
            $0.height.equalTo(50)
        }
    }
    
    private func setCollectionView() {
        collectionView.register(ChannelCell.self, forCellWithReuseIdentifier: ChannelCell.identifier)
    }
    
// MARK: - Delegate
    private func setDelegate() {
        collectionView.delegate = self
        collectionView.dataSource = self
    }
}

// MARK: - UICollectionViewDelegate, UICollectionViewDataSource
extension Channel: UICollectionViewDataSource {
    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int {
        return itemData.count
    }

    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: ChannelCell.identifier,
            for: indexPath
        ) as? ChannelCell else {
            return UICollectionViewCell()
        }
        cell.dataBind(itemData[indexPath.item], itemRow: indexPath.item)
        return cell
    }
}

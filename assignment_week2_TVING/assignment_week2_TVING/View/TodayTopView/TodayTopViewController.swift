//
//  TodayTopViewController.swift
//  assignment_week2_TVING
//
//  Created by 신혜연 on 5/2/25.
//

import UIKit
import SnapKit

class TodayTopViewController: UIViewController {
    
    // MARK: - Properties
    private let itemData = TodayTopModel.dummy()
    public let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 140, height: 150)
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = .black
        collectionView.register(TodayTopViewCell.self, forCellWithReuseIdentifier: TodayTopViewCell.identifier)
        return collectionView
    }()
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        
        setLayout()
        setDelegate()
    }
    
    // MARK: - Layout
    private func setLayout() {
        view.addSubview(collectionView)
        
        collectionView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(9)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(200)
        }
    }
    
// MARK: - Delegate
    private func setDelegate() {
        collectionView.delegate = self
        collectionView.dataSource = self
    }
}

// MARK: - UICollectionView Delegate & DataSource
extension TodayTopViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return itemData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TodayTopViewCell.identifier, for: indexPath) as? TodayTopViewCell else {
            return UICollectionViewCell()
        }
        cell.dataBind(itemData[indexPath.item], itemRow: indexPath.item)
        return cell
    }
}

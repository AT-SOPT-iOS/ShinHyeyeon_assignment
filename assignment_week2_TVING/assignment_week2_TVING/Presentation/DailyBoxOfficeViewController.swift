//
//  DailyBoxOfficeViewController.swift
//  assignment_week2_TVING
//
//  Created by 신혜연 on 5/13/25.
//

import UIKit

class DailyBoxOfficeViewController: UIViewController {
    
    // MARK: - Properties
    
    private var boxOfficeList: [DailyBoxOffice] = []
    private let tableView = UITableView()
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        setUI()
        fetchData()
    }
    
    // MARK: - UI Setting
    
    private func setUI() {
        view.addSubview(tableView)
        tableView.frame = view.bounds
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "BoxOfficeCell")
    }
    
    // MARK: - Network
    
    private func fetchData() {
        Task {
            do {
                let result = try await GetInfoService.shared.fetchDailyBoxOfficeList(targetDate: "20250517")
                self.boxOfficeList = result
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            } catch {
                print("데이터 불러오기 실패: \(error)")
            }
        }
    }
    
    private func configureCell(_ cell: UITableViewCell, with movie: DailyBoxOffice) {
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = "\(movie.rank)위: \(movie.movieNm)\n관객 수: \(movie.audiCnt)명"
    }
}

// MARK: - UITableViewDataSource

extension DailyBoxOfficeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return boxOfficeList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let movie = boxOfficeList[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "BoxOfficeCell", for: indexPath)
        configureCell(cell, with: movie)
        return cell
    }
}

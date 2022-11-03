//
//  RoomsViewController.swift
//  DirectoryApp
//
//  Created by Pradeepthi N on 02/11/2022.
//

import UIKit

final class RoomsViewController: UIViewController, Alertable {
    
    typealias TableDataSource = UITableViewDiffableDataSource<Int, Room>

    private lazy var activityIndicator:UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView()
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        return activityIndicator
    }()

    private lazy var tableView:UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    lazy var datasource: TableDataSource = {
      let datasource = TableDataSource(tableView: tableView, cellProvider: { (tableView, indexPath, room) -> UITableViewCell? in
          guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? RoomsTableViewCell else {
              return UITableViewCell()
          }
         cell.configureData(room: room)
          return cell
      })
      return datasource
    }()
    
    private let viewModel:RoomsViewModel

    init(viewModel:RoomsViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        getRooms()
    }
}

// MARK: - Private Methods

extension RoomsViewController {
    private func getRooms() {
        Task {
            await viewModel.getRooms()
        }
    }
    
    private func setupUI() {
        self.view.addSubview(tableView)

        self.view.addSubview(activityIndicator)
        
        activityIndicator.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant:0.0).isActive = true
        
        activityIndicator.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant:0.0).isActive = true
        
        activityIndicator.widthAnchor.constraint(equalToConstant: 60.0).isActive = true
        
        activityIndicator.heightAnchor.constraint(equalToConstant: 60.0).isActive = true
        
        // TableView setup
        
        tableView.register(RoomsTableViewCell.self, forCellReuseIdentifier:"Cell")
        
        tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant:0.0).isActive = true
        
        tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant:0.0).isActive = true
        
        tableView.topAnchor.constraint(equalTo: self.view.topAnchor, constant:0.0).isActive = true
        
        tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant:0.0).isActive = true
        
        self.navigationItem.title = NSLocalizedString("rooms", comment:"")

    }
}

extension RoomsViewController: RoomsViewBehaviour {
    
    func updateSnap() {
        DispatchQueue.main.async {
            var snapshot = self.datasource.snapshot()
            snapshot.appendSections([0])
            snapshot.appendItems(self.viewModel.rooms, toSection: 0)
            self.datasource.apply(snapshot)
        }
    }
    
    func showError(message: String) {
        DispatchQueue.main.async {
            self.showAlert(message:message)
        }
    }
    
    func showActivityIndicator() {
        DispatchQueue.main.async {
            self.activityIndicator.isHidden = false
            self.activityIndicator.startAnimating()
            self.view.isUserInteractionEnabled = false
        }
    }
    
    func hideActivityIndicator() {
        DispatchQueue.main.async {
            self.activityIndicator.stopAnimating()
            self.activityIndicator.isHidden = true
            self.view.isUserInteractionEnabled = true
        }
    }
}

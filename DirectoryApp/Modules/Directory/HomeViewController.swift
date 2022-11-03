//
//  HomeViewController.swift
//  DirectoryApp
//
//  Created by Pradeepthi N on 02/11/2022.
//

import UIKit

final class HomeViewController: UIViewController {
    
    typealias DataSource = UICollectionViewDiffableDataSource<Int, Directory>
    
    typealias Snapshot = NSDiffableDataSourceSnapshot<Int, Directory>

    
    lazy var datasource: DataSource = {
        let dataSource = DataSource(
            collectionView: collectionView,
            cellProvider: { (collectionView, indexPath, directory) ->
              UICollectionViewCell? in
                guard let cell =  collectionView.dequeueReusableCell(withReuseIdentifier:"Cell", for: indexPath) as? PeopleCollectionViewCell else {
                    return UICollectionViewCell()
                }
                
                cell.configureDirectory(directory: directory)
              return cell
          })
          return dataSource
    }()
    
    private lazy var collectionView:UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical //.horizontal
        layout.minimumLineSpacing = 5
        layout.minimumInteritemSpacing = 5
        
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout:layout)
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    private weak var coordinator: Coordinator?
    private var homeViewModel: HomeViewModel
    
    init(homeViewModel: HomeViewModel, coordinator: Coordinator) {
        self.homeViewModel = homeViewModel
        self.coordinator = coordinator
        super.init(nibName:nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        applySnapshot()
    }
    
    private func setupUI() {
        self.view.addSubview(collectionView)
        // CollectionView Setup
        
        collectionView.delegate = self
        
        collectionView.register(PeopleCollectionViewCell.self, forCellWithReuseIdentifier:"Cell")
        
        collectionView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant:0.0).isActive = true
        
        collectionView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant:0.0).isActive = true
        
        collectionView.topAnchor.constraint(equalTo: self.view.topAnchor, constant:0.0).isActive = true
        
        collectionView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant:0.0).isActive = true
        
        // Set Title
        
        self.navigationItem.title = NSLocalizedString("directory", comment: "")
    }
    
    private func applySnapshot(animatingDifferences: Bool = true) {
        var snapshot = Snapshot()
        snapshot.appendSections([0])
        snapshot.appendItems(self.homeViewModel.directoreis)
        self.datasource.apply(snapshot, animatingDifferences: animatingDifferences)
        
    }
}

extension HomeViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0 :
            coordinator?.navigateToPeople()
        case 1 :
            coordinator?.navigateToRooms()
        default:
            print("")
        }
    }
}

extension HomeViewController: UICollectionViewDelegateFlowLayout {
   
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 1.0, left: 1.0, bottom: 1.0, right: 1.0)//here your custom value for spacing
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let lay = collectionViewLayout as! UICollectionViewFlowLayout
        let widthPerItem = collectionView.frame.width / 2 - lay.minimumInteritemSpacing
        
        return CGSize(width:widthPerItem, height:150)
    }
}

//
//  PeoplesViewController.swift
//  DirectoryApp
//
//  Created by Pradeepthi N on 02/11/2022.

import UIKit

final class PeoplesViewController: UIViewController, Alertable {
    
    typealias DataSource = UICollectionViewDiffableDataSource<Int, People>
    
    typealias Snapshot = NSDiffableDataSourceSnapshot<Int, People>
    
    lazy var datasource: DataSource = {
        let dataSource = DataSource(
            collectionView: collectionView,
            cellProvider: { (collectionView, indexPath, people) ->
              UICollectionViewCell? in
                guard let cell =  collectionView.dequeueReusableCell(withReuseIdentifier:"Cell", for: indexPath) as? PeopleCollectionViewCell else {
                    return UICollectionViewCell()
                }
                cell.configureData(people: people)
                
                self.viewModel.getPeopleImage(for: indexPath.row, completion: { imageData in
                    cell.posterImageView.image = UIImage(data: imageData)
                })
              return cell
          })
          return dataSource
    }()
    
    private lazy var activityIndicator:UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView()
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        return activityIndicator
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
    
    private let viewModel:PeopleViewModel
    
    init(viewModel:PeopleViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = NSLocalizedString("peoples", comment:"")
        setupCollectionView()
        getPeoples()
    }
}

// MARK: - Private Methods

extension PeoplesViewController {
    private func getPeoples() {
        Task {
            await viewModel.getPeoples()
        }
    }
    
    private func setupCollectionView() {
        
        self.view.addSubview(collectionView)

        // Activity Indicator
        self.view.addSubview(activityIndicator)

        activityIndicator.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant:0.0).isActive = true
        
        activityIndicator.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant:0.0).isActive = true
        
        activityIndicator.widthAnchor.constraint(equalToConstant: 60.0).isActive = true
        
        activityIndicator.heightAnchor.constraint(equalToConstant: 60.0).isActive = true
        
        // CollectionView Setup
        
        collectionView.delegate = self
        
        collectionView.register(PeopleCollectionViewCell.self, forCellWithReuseIdentifier:"Cell")
        
        collectionView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant:0.0).isActive = true
        
        collectionView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant:0.0).isActive = true
        
        collectionView.topAnchor.constraint(equalTo: self.view.topAnchor, constant:0.0).isActive = true
        
        collectionView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant:0.0).isActive = true
    }

    private func navigateToGalleryView() {
        viewModel.navigateToDetails(for: 1)
    }
}

extension PeoplesViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        viewModel.navigateToDetails(for: indexPath.row)
    }
}
extension PeoplesViewController: UICollectionViewDelegateFlowLayout {
   
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 1.0, left: 1.0, bottom: 1.0, right: 1.0)//here your custom value for spacing
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let lay = collectionViewLayout as? UICollectionViewFlowLayout
        let widthPerItem = collectionView.frame.width / CGFloat(Constants.iPhoneColumnCount) - (lay?.minimumInteritemSpacing ?? 0)
        return CGSize(width:widthPerItem, height:150)
    }
}

extension PeoplesViewController: PeoplesViewBehaviour {

    func applySnapshot(animatingDifferences: Bool = true) {
        DispatchQueue.main.async {
            var snapshot = Snapshot()
            snapshot.appendSections([0])
            snapshot.appendItems(self.viewModel.peoples)
            self.datasource.apply(snapshot, animatingDifferences: animatingDifferences)
            self.hideActivityIndicator()
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

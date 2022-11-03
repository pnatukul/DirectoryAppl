//
//  PeopleCollectionViewCell.swift
//  DirectoryApp
//
//  Created by Pradeepthi N on 02/11/2022.
//

import UIKit
import CoreUI

final class PeopleCollectionViewCell: UICollectionViewCell {
    
    lazy var posterImageView = UIImageView.createImageView()
    
    lazy var nameLabel = UILabel.createLabel()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupUI() {
        self.contentView.addSubview(posterImageView)
        self.contentView.addSubview(nameLabel)

        posterImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0.0).isActive = true
        
        posterImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor, constant: 0.0).isActive = true
        
        
        posterImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0.0).isActive = true
        
        posterImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0.0).isActive = true

        nameLabel.topAnchor.constraint(equalTo: posterImageView.bottomAnchor, constant: 0.0).isActive = true
        
        nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5.0).isActive = true
        
        nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 5.0).isActive = true
        
        nameLabel.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: 5.0).isActive = true
        
        nameLabel.setContentHuggingPriority(.defaultHigh, for: .vertical)
    }
    
    func configureData(people: People) {
        nameLabel.text = people.firstName + people.lastName

        posterImageView.clipsToBounds = true
    }
    
    func configureDirectory(directory:Directory) {
        nameLabel.text = directory.name

        posterImageView.image = UIImage(named: directory.iconName)
    }
    
    override func prepareForReuse() {
        nameLabel.text = ""
        posterImageView.image = nil
    }
    
}

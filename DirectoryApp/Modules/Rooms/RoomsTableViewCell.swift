//
//  RoomsTableViewCell.swift
//  DirectoryApp
//
//  Created by Pradeepthi N on 02/11/2022.
//

import UIKit

final class RoomsTableViewCell: UITableViewCell {
    
    private lazy var parentStackView: UIStackView = {
        return UIStackView.createStackView(alignment:.fill)
    }()
    
    lazy var idLabel: UILabel = UILabel.createLabel()
    
    lazy var occupiedLabel: UILabel = UILabel.createLabel()
    
    lazy var maxOccupancyLabel: UILabel = UILabel.createLabel()
    
    lazy var createdAtLabel: UILabel = UILabel.createLabel()
    
    lazy var idLabelName: UILabel = UILabel.createLabel(text:NSLocalizedString("id", comment: ""))
    
    lazy var occupiedLabelName: UILabel = UILabel.createLabel(text:NSLocalizedString("occupied_status", comment: ""))
    
    lazy var maxOccupancyLabelName: UILabel = UILabel.createLabel(text:NSLocalizedString("max_occupancy", comment: ""))
    
    lazy var createdAtLabelName: UILabel = UILabel.createLabel(text:NSLocalizedString("created_at", comment: ""))
    
    private func createGroupStackView() -> UIStackView {
        return  UIStackView.createStackView(axis: .horizontal, alignment: .center, distribution: .fillEqually)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        self.contentView.addSubview(parentStackView)
        parentStackView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant:0.0).isActive = true
        
        parentStackView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant:0.0).isActive = true
        
        parentStackView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant:0.0).isActive = true
        
        parentStackView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant:0.0).isActive = true

        [(idLabelName, idLabel), (maxOccupancyLabelName, maxOccupancyLabel), (occupiedLabelName, occupiedLabel), (createdAtLabelName, createdAtLabel)].forEach {  element in
            
            let stackView = createGroupStackView()
            stackView.addArrangedSubview(element.0)
            stackView.addArrangedSubview(element.1)

            parentStackView.addArrangedSubview(stackView)
        }
    }
    
    override func prepareForReuse() {
        idLabel.text = ""
        occupiedLabel.text = ""
        maxOccupancyLabel.text = ""
        createdAtLabel.text = ""
    }
    
    func configureData(room: Room) {
        idLabel.text = room.id
        occupiedLabel.text = room.occupiedMessage
        maxOccupancyLabel.text = "\(room.maxOccupancy)"
        if occupiedLabel.text == "Occupied" {
            occupiedLabel.textColor = .red
        } else {
            occupiedLabel.textColor = .green
        }
        let isoDate = room.createdAt
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        if let date = dateFormatter.date(from: isoDate) {
            let formatter1 = DateFormatter()
            formatter1.dateFormat = "d MMM y"
            createdAtLabel.text = formatter1.string(from: date)
        }
        
    }
}

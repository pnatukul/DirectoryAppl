//
//  PeopleDetailsViewController.swift
//  DirectoryApp
//
//  Created by Pradeepthi N on 02/11/2022.
//

import UIKit

final class PeopleDetailsViewController: UIViewController {

    private let peopleDetailsViewModel:PeopleDetailsContract

    private lazy var parentStackView: UIStackView = {
        return UIStackView.createStackView(alignment: .fill)
    }()
    
    lazy var topImageView = UIImageView.createImageView()
    lazy var nameLabel: UILabel = UILabel.createLabel(text: NSLocalizedString("name", comment: ""))
    
    lazy var nameValue: UILabel = UILabel.createLabel()
    
    lazy var emailLabel: UILabel =   UILabel.createLabel(text:NSLocalizedString("email", comment: ""))
    
    lazy var emailValue: UILabel = UILabel.createLabel()
    
    lazy var jobLabel: UILabel = UILabel.createLabel(text:NSLocalizedString("job_title", comment: ""))
    
    lazy var jobValue: UILabel = UILabel.createLabel()
    
    lazy var joinedDateLabel: UILabel = UILabel.createLabel(text:NSLocalizedString("joined_date", comment: ""))
    
    lazy var joinedDateValue: UILabel =
         UILabel.createLabel()

    init(peopleDetailsViewModel:PeopleDetailsContract) {
        self.peopleDetailsViewModel = peopleDetailsViewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupData()

    }

    private func setupUI() {
  
      self.view.addSubview(parentStackView)
        
        parentStackView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant:10.0).isActive = true

        parentStackView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant:-10.0).isActive = true

        parentStackView.topAnchor.constraint(equalTo: self.view.topAnchor, constant:100.0).isActive = true

        [(nameLabel, nameValue), (emailLabel, emailValue), (jobLabel, jobValue), (joinedDateLabel, joinedDateValue)].forEach {  element in

            let stackView = createGroupStackView()
            stackView.addArrangedSubview(element.0)
            stackView.addArrangedSubview(element.1)
            stackView.backgroundColor = .lightGray
            element.0.widthAnchor.constraint(equalToConstant: 100.0).isActive = true
            parentStackView.addArrangedSubview(stackView)
        }
    }
    
    private func setupData() {

        nameValue.text = peopleDetailsViewModel.people.firstName + " " +  peopleDetailsViewModel.people.lastName
        emailValue.text = peopleDetailsViewModel.people.email
        jobValue.text = peopleDetailsViewModel.people.jobTitle
        
        let isoDate = peopleDetailsViewModel.people.joinedDate
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        if let date = dateFormatter.date(from: isoDate) {
            let formatter1 = DateFormatter()
            formatter1.dateFormat = "d MMM y"
            joinedDateValue.text = formatter1.string(from: date)
        }

    }
    
    private func createGroupStackView() -> UIStackView {
        return  UIStackView.createStackView(axis: .horizontal, alignment: .fill, distribution: .fill)
    }

}

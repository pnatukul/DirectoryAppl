//
//  PeopleViewModelTests.swift
//  DirectoryAppTests
//
//  Created by Pradeepthi N on 03/11/2022.
//

import XCTest
@testable import DirectoryApp

class PeopleViewModelTests: XCTestCase {

    var viewModel:PeopleViewModel!
    let peopleUseCase = MokcPeopleUseCase()

    override func setUpWithError() throws {
       
        let coordinator =  AppCoordinator(navController: UINavigationController())
        
        viewModel = PeopleViewModel(peopleUseCase: peopleUseCase, coordinator: coordinator)
    }

    override func tearDownWithError() throws {
        viewModel = nil
    }

    // get People success
    func testWhenGetPeopleIsSuccess() async {
        
        //GIVEN :
        peopleUseCase.enqueuePeopelesRecords(peoplesRecords: [People(firstName:"test", avatar: "test", lastName: "test", email: "test", jobTitle: "test", joinedDate:"test")])
        // When
        await viewModel.getPeoples()

        // Then
        XCTAssertEqual(viewModel.peoples.count , 1)
        
    }
    
    // getPeople Failed
    func testWhenGetPeopleIsFailed() async {
        
        //GIVEN : People UseCase has nil records
      
        // When
         await viewModel.getPeoples()

        XCTAssertEqual(viewModel.peoples.count , 0)

    }
    
    // get downLoad image success
    func testGetPeopleAvatarIsSuccess() async {
        
        //GIVEN :
        peopleUseCase.enqueuePeopelesRecords(peoplesRecords: [People(firstName:"test", avatar: "valid", lastName: "test", email: "test", jobTitle: "test", joinedDate:"test")])
        
        await viewModel.getPeoples()

        // When
         viewModel.getPeopleImage(for:0, completion: { imageData in
            // Then
            XCTAssertNotNil(imageData)
        })
    }
    
    // get downLoad image failed
    func testGetPeopleAvatarIsFailure() async {
        
        //GIVEN :
        peopleUseCase.enqueuePeopelesRecords(peoplesRecords: [People(firstName:"test", avatar: "invalid", lastName: "test", email: "test", jobTitle: "test", joinedDate:"test")])
        
        await viewModel.getPeoples()
        
        // When
         viewModel.getPeopleImage(for:0, completion: { imageData in
            // Then
            XCTAssertNil(imageData)
        })
    }
    
}

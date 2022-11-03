//
//  RoomsViewModelTests.swift
//  DirectoryAppTests
//
//  Created by Pradeepthi N on 03/11/2022.
//

import XCTest
@testable import DirectoryApp

class RoomsViewModelTests: XCTestCase {

    var viewModel:RoomsViewModel!
    let roomsUseCase = MockRoomsUseCase()

    override func setUpWithError() throws {
       
        let coordinator =  AppCoordinator(navController: UINavigationController())

        viewModel = RoomsViewModel(roomsUseCase: roomsUseCase)
    }

    override func tearDownWithError() throws {
        viewModel = nil
    }

    // get rooms success
    func testWhenGetRoomsIsSuccess() async {
        
        //GIVEN :
        roomsUseCase.enqueueRoomsRecords(roomsRecords: [Room(createdAt:"test", occupiedMessage: "occupied", maxOccupancy: 5, id: "1")])
        // When
        await viewModel.getRooms()

        // Then
        XCTAssertEqual(viewModel.rooms.count, 1)
        
        let room = viewModel.rooms[0]

        XCTAssertEqual(room.maxOccupancy, 5)
        XCTAssertEqual(room.occupiedMessage, "occupied")

    }
    
    // getRooms Failed
    func testWhenGetPeopleIsFailed() async {
        
        //GIVEN : Room UseCase has nil records
      
        // When
         await viewModel.getRooms()

        XCTAssertEqual(viewModel.rooms.count, 0)
        
    }
}

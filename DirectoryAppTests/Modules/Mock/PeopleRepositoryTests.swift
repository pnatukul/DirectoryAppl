//
//  PeopleRepositoryTests.swift
//  DirectoryAppTests
//
//  Created by Pradeepthi N on 03/11/2022.

import XCTest
import CoreNetwork
@testable import DirectoryApp

class PeopleRepositoryTests: XCTestCase {

    var peoplesRepository: PeoplesRepository!
    let networkManager =  MockNetworkManager()
    
    override func setUp() {
        peoplesRepository = DefaultPeopleRepository(networkManager: networkManager)
    }

    // People Valid Json 
    func testGetPeopleSuccess() async {
        
        networkManager.enqueue(jsonFilePath: "ValidPeopleResonse")
        
        let peopleRecord = try? await peoplesRepository.getPeoples()
        
        XCTAssertEqual(peopleRecord?.count, 69)
        
        XCTAssertEqual(peopleRecord?.first?.firstName, "Maggie")

    }
    
    // Invalid response than parsing fails
    func testGetPeopleParsinFails() async {
        
        networkManager.enqueue(jsonFilePath: "InvalidPeopleResonse")

        do {
            let _ = try await peoplesRepository.getPeoples()

        }catch {
            XCTAssertEqual(error as! APIError, APIError.jsonParsingFailed)
        }
    }
    
    // Invalid response is empty
    func testGetPeopleEmptyResonse() async {
        
        networkManager.enqueue(jsonFilePath: "EmptyPeopleResonse")

        do {
            let _ = try await peoplesRepository.getPeoples()

        }catch {
            XCTAssertEqual(error as! APIError, APIError.emptyRecords)
        }
    }
    
    // Invalid URL
    func testGetPeopleResonseIsInvalid() async {
        
        networkManager.enqueue(jsonFilePath: "invalid")

        do {
            let _ = try await peoplesRepository.getPeoples()

        }catch {
            XCTAssertEqual(error as! APIError, APIError.invalidData)
        }
    }
    
    // Invalid URL
    func testGetPeopleValidImage() async {
        
        networkManager.enqueue(jsonFilePath: "imageDataValid")

        let imageData = try? await peoplesRepository.getImages(for:"imageDataValid")

        XCTAssertNotNil(imageData)
    }
    
    // Image Download failes
    func testGetPeopleImageDownlaodFails() async {
        
        networkManager.enqueue(jsonFilePath: "imageDataInValid")

        do {
            let _ = try await peoplesRepository.getImages(for:"imageDataValid")

        }catch {
            XCTAssertEqual(error as! APIError, APIError.invalidData)
        }
    }
}

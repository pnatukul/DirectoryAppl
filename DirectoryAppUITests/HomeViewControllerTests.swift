//
//  HomeViewControllerTests.swift
//  DirectoryAppUITests
//
//  Created by Pradeepthi N on 03/11/2022.
//

import XCTest

class HomeViewControllerTests: XCTestCase {

    var app : XCUIApplication!
    override func setUpWithError() throws {
        
        continueAfterFailure = false

        app = XCUIApplication()
        app.launch()

    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testHomeScreenTitle() {
       let texts =  app.navigationBars["Directory"].staticTexts
        
        XCTAssertEqual(texts.firstMatch.label, "Directory")
    }

    func testHomeScreenCollectionViewExists() {
        let collectionViews = app.collectionViews
    
        XCTAssertNotNil(collectionViews.firstMatch)
    }

    func testNavigatesToPeopleScreen() {
        
        let collectionViewsQuery = app.collectionViews
                collectionViewsQuery/*@START_MENU_TOKEN@*/.staticTexts["Peoples"]/*[[".cells.staticTexts[\"Peoples\"]",".staticTexts[\"Peoples\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        let texts =  app.navigationBars["Peoples"].staticTexts
         
         XCTAssertEqual(texts.firstMatch.label, "Peoples")
    }
    
    func testNavigatesToRoomsScreen() {
        
        let collectionViewsQuery = app.collectionViews
        
        collectionViewsQuery.staticTexts["Rooms"].tap()
        
        let texts =  app.navigationBars["Rooms"].staticTexts
         
         XCTAssertEqual(texts.firstMatch.label, "Rooms")
       
    }
 
}

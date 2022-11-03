//
//  UrlRequestTest.swift
//  DirectoryAppTests
//
//  Created by Pradeepthi N on 03/11/2022.
//

import XCTest
import CoreNetwork
@testable import DirectoryApp

class UrlRequestTest: XCTestCase {
    
    // rigth URL
    func testRequest_whenUrlIsCorrect() {
        
        // GIVEN
        let apiRequest = ApiRequest(baseUrl: EndPoint.baseUrl, path:"", params:["q":"test"])
        // When
        let requeast = URLRequest.getURLRequest(for: apiRequest)
        // Then
        
        XCTAssertEqual(requeast!.url!.absoluteString, "https://61e947967bc0550017bc61bf.mockapi.io/api/v1/")
    }
    
    // wrong URL
    func testRequest_whenUrlIsInCorrect() {
        
        // GIVEN
        let apiRequest = ApiRequest(baseUrl: "", path:"", params:["q":"test"])
        // When
        let requeast = URLRequest.getURLRequest(for: apiRequest)
        // Then
        
        XCTAssertNil(requeast?.url)
    }
}

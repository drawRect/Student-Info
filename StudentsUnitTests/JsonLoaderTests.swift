//
//  JsonLoaderTests.swift
//  StudentsUnitTests
//
//  Created by Sonata on 12/06/18.
//  Copyright © 2018 Dash. All rights reserved.
//

import XCTest

class JsonLoaderTests: XCTestCase {
    
    private var bundle:Bundle?
    private let invalidJSONFileName = "invalid.json"
    private let invalidFile = "invalidTextFile.txt"
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        bundle = Bundle(for: type(of: self))
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testJSONLoaderForValidJson() {
        let expectation = XCTestExpectation(description: "Test JSON file")
        let resource = Resource(name: Constants.studJSONFileName, A: Students.self)
        let stud = try? JSONLoader.loadMockFile(resource)
        XCTAssertNotNil(stud, "stud should not be nil")
        expectation.fulfill()
        self.wait(for: [expectation], timeout: 10.0)
    }
    
    func testJSONLoaderForInvalidJSON() {
        let expectation = XCTestExpectation(description: "Test Invalid JSON file")
        let resource = Resource(name: invalidJSONFileName, A: Professors.self)
        do {
            let _ = try JSONLoader.loadMockFile(resource, bundle: bundle!)
        }catch let error {
            if let e = error as? MockLoaderError {
                XCTAssertEqual(e.localizedDescription, "\(invalidJSONFileName) has Invalid JSON")
                expectation.fulfill()
            }
        }
        self.wait(for: [expectation], timeout: 10.0)
    }
    
    func testJSONLoaderForIncorrectFile() {
        let expectation = XCTestExpectation(description: "Test JSON Loader with incorrect file type")
        let resource = Resource(name: invalidFile, A: Students.self)
        do {
            let _ = try JSONLoader.loadMockFile(resource, bundle: bundle!)
        }catch let error {
            if let e = error as? MockLoaderError {
                XCTAssertEqual(e.localizedDescription, "\(invalidFile) FileName is incorrect")
                expectation.fulfill()
            }
        }
    }
}

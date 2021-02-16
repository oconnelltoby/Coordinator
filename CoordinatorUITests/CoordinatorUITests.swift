//
//  CoordinatorUITests.swift
//  CoordinatorUITests
//
//  Created by Toby O'Connell on 16/02/2021.
//

import XCTest

class CoordinatorUITests: XCTestCase {

    func testHappyPath() {
        let app = XCUIApplication()
        app.launch()
        
        ["Red", "Green", "Blue", "Cyan", "Magenta", "Yellow"].forEach {
            XCTAssert(app.staticTexts[$0].exists)
            XCTAssert(app.buttons["Next"].exists)
            app.buttons["Next"].tap()
        }
        
        XCTAssert(app.staticTexts["Finished"].exists)
    }
}

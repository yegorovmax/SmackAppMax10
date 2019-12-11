//
//  BaseTest.swift
//  Smack(10)UITests
//
//  Created by Maksim Egorov on 12/9/19.
//  Copyright © 2019 Max Egorov. All rights reserved.
//

import XCTest

class BaseTest: XCTestCase {

    override func setUp() {
        continueAfterFailure = false
        let app = XCUIApplication()
        app.launchArguments = ["deleteAllData"]
        app.launch()
    }
    
    func isTextPresent(text: String) -> Bool {
        if BaseScreen.app.staticTexts[text].waitForExistence(timeout: 15) ||
            BaseScreen.app.buttons[text].waitForExistence(timeout: 15) {
            return true
        } else {
            return false
        }
    }
}

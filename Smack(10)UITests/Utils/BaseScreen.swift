//
//  BaseScreen.swift
//  Smack(10)UITests
//
//  Created by Maksim Egorov on 12/9/19.
//  Copyright © 2019 Max Egorov. All rights reserved.
//

import XCTest

class BaseScreen {
    static let app = XCUIApplication()

    let timeout: Double = 25.0

    required init() { }

    func tap(_ element: XCUIElement) {
        element.tap()
    }

    func type(_ text: String, to element: XCUIElement) {
        element.typeText(text)
    }
}

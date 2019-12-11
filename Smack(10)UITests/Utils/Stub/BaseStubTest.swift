//
//  BaseStubTest.swift
//  Smack(10)UITests
//
//  Created by Maksim Egorov on 12/9/19.
//  Copyright © 2019 Max Egorov. All rights reserved.
//

import Embassy
import EnvoyAmbassador
import Foundation
import XCTest

class BaseStubTest: XCTestCase {

    private let ipAddress = "http://[::1]"
    private let port = 8080

    private var server: DefaultHTTPServer?

    override func setUp() {
        super.setUp()
        startStubServer()

        continueAfterFailure = false

        let app = XCUIApplication()
        app.launchArguments = ["noAuth", "deleteAllData"]
        app.launchEnvironment["TEST_BASE_URL"] = "\(ipAddress):\(port)/v1/"
        app.launch()
    }

    override func tearDown() {
        super.tearDown()
        server?.stopAndWait()
    }

    func startStubServer() {
        do {
            let loop = try SelectorEventLoop(selector: try KqueueSelector())
            let router = OrderMeRouter()
            server = DefaultHTTPServer(eventLoop: loop, port: port, app: router.app)

            // Start HTTP server to listen on the port
            try server?.start()

            // Run event loop
            DispatchQueue.global(qos: .background).async {
                loop.runForever()
            }
        } catch {
            print("Server error")
        }
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

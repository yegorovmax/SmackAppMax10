//
//  LoginScreen.swift
//  Smack(10)UITests
//
//  Created by Maksim Egorov on 12/9/19.
//  Copyright © 2019 Max Egorov. All rights reserved.
//


import XCTest

class LoginScreen: BaseScreen {

    private let loginButton: XCUIElement =
        app.buttons.element(matching: .button, identifier: "logInButton")
    private let signUpButton: XCUIElement = app.buttons["Don't have an account? Sign up here"]
    private let userNameTextField: XCUIElement = app.textFields.element(boundBy: 1)
    private let passwordTextField: XCUIElement = app.secureTextFields.element(boundBy: 0)
    
    required init() {
        super.init()

        visible()
    }

    func signUp() -> CreateAccountScreen {
        tap(signUpButton)
        return CreateAccountScreen()
    }
    
    func login(username: String, passowrd: String) -> ChannelsScreen {
        tap(userNameTextField)
        type(username, to: userNameTextField)
        tap(passwordTextField)
        type(passowrd, to: passwordTextField)
        tap(loginButton)
       
        return ChannelsScreen()
    }
}

// MARK: - Visibility

extension LoginScreen {
    private func visible() {
        guard loginButton.waitForExistence(timeout: timeout) else {
            XCTFail("Login Screen is not visible, cant find loginButton")
            return
        }
    }
}

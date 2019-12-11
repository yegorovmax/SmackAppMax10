//
//  CreateAccountScreen.swift
//  Smack(10)UITests
//
//  Created by Maksim Egorov on 12/9/19.
//  Copyright © 2019 Max Egorov. All rights reserved.
//
import XCTest

class CreateAccountScreen: BaseScreen {

    private let chooseAvatarButton: XCUIElement = app.buttons["Choose avatar"]
    private let firsProfileImage: XCUICoordinate = app.images.element(matching: .image, identifier: "imageIcon").firstMatch.coordinate(withNormalizedOffset: CGVector(dx: 0, dy: 0))
    private let smackBackButton: XCUIElement = app.buttons["smackBack"]
    private let createAcountButton: XCUIElement =
        app.buttons.element(matching: .button, identifier: "createAccountButton")
    private let passwordTextField: XCUIElement = app.secureTextFields.element(matching: .secureTextField, identifier: "passwordField")
    
    private let userNameTextField: XCUIElement = app.textFields.element(matching: .textField, identifier: "usernameField")
    
    private let emailTextField: XCUIElement = app.textFields.element(matching: .textField, identifier: "emailField")
    
    

    required init() {
        super.init()

        visible()
    }
    
    func createAccount(username: String, email: String, passowrd: String) -> ChannelsScreen {
        tap(userNameTextField)
        type(username, to: userNameTextField)
        tap(emailTextField)
        type(email, to: emailTextField)
        tap(passwordTextField)
        type(passowrd, to: passwordTextField)
        tap(chooseAvatarButton)
        firsProfileImage.tap()
        tap(createAcountButton)
        return ChannelsScreen()
    }
}

// MARK: - Visibility

extension CreateAccountScreen {
    private func visible() {
        guard createAcountButton.waitForExistence(timeout: timeout) else {
            XCTFail("CreateAccountScreen is not visible, cant find createAcountButton")
            return
        }
    }
}

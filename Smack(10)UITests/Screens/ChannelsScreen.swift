//
//  ChannelsScreen.swift
//  Smack(10)UITests
//
//  Created by Maksim Egorov on 12/9/19.
//  Copyright © 2019 Max Egorov. All rights reserved.
//
import XCTest

class ChannelsScreen: BaseScreen {

    private let channelsText: XCUIElement = app.staticTexts["CHANNELS"]
    private let userNameLoginButton: XCUIElement = app.buttons.element(matching: .button, identifier: "loginButtonUserName")
    private let smackBurgerButton: XCUIElement = app.buttons["smackBurger"]
    private let logOutButton: XCUIElement = app.buttons["Logout"]
    private let addChannelButton: XCUIElement = app.buttons.element(matching: .button, identifier: "addChannelBtn")
    private let channelNameField: XCUIElement = app.textFields.element(matching: .textField, identifier: "channelNameField")
    private let channelDescriptionField: XCUIElement = app.textFields.element(matching: .textField, identifier: "channelDescriptionField")
    private let createChannelButton: XCUIElement = app.buttons.element(matching: .button, identifier: "createChannelBtn")
    
    
    
    required init() {
        super.init()

        visible()
    }
    
    func tapUserNameLoginButton() {
        tap(userNameLoginButton)
    }
    
    func tapLogOutButton() {
        tap(logOutButton)
    }
    
    func tapSmackBurgerButton() -> ChannelsScreen {
        tap(smackBurgerButton)
        return ChannelsScreen()
    }

    func createCahnnel(channelName: String, channelDescription: String) {
        tap(addChannelButton)
        tap(channelNameField)
        type(channelName, to: channelNameField)
        tap(channelDescriptionField)
        type(channelDescription, to: channelDescriptionField)
        tap(createChannelButton)
    }
}

// MARK: - Visibility

extension ChannelsScreen {
    private func visible() {
        guard channelsText.waitForExistence(timeout: timeout) else {
            XCTFail("ChannelsScreen is not visible, cant find channelsText")
            return
        }
    }
}

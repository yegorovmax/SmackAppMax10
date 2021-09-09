//
//  Stub.swift
//  Smack(10)UITests
//
//  Created by Maksim Egorov on 12/9/19.
//  Copyright © 2019 Max Egorov. All rights reserved.
//
import XCTest
class Stub: BaseStubTest {
    let email = "test@test.test"
    let password = "123"
    let userName = "stubName"
    let channelName = "stubChannelName"
    let channelDescription = "stubChannelDescription"
    
    override class func setUp() {
        super.setUp()

    }

    func testAddNewChannelStub2() {
        return}
    
    func testAddNewChannelStub() {
        return
        login()
        let channelsScreen = ChannelsScreen()
        channelsScreen.createCahnnel(channelName: channelName, channelDescription: channelDescription)
        XCTAssert(isTextPresent(text: channelName), "Cant Find channelName")
        sleep(1)
    }
    
    func testAddNewUserStub() {
        let smackScreen = SmackScreen()
        var channelsScreen = smackScreen.tapSmackBurgerButton()
        channelsScreen.tapUserNameLoginButton()
        let loginScreen = LoginScreen()
        let createAccountScreen = loginScreen.signUp()
        channelsScreen = createAccountScreen.createAccount(username: userName, email: email, passowrd: password)
        XCTAssert(isTextPresent(text: userName), "Cant Find userName")
        logout()
    }
    func testLoginLogoutSub() {
        Session.shared.registerUser[0].email = email
        Session.shared.registerUser[0].password = password
        
        login()
        var channelsScreen = ChannelsScreen()
        XCTAssert(isTextPresent(text: userName), "Cant Find userName")
        
        //log out
        channelsScreen.tapUserNameLoginButton()
        channelsScreen.tapLogOutButton()
        channelsScreen = ChannelsScreen()
        XCTAssert(isTextPresent(text: "Login"), "Cant Find Login text")
    }
    
    func login() {
        let smackScreen = SmackScreen()
        var channelsScreen = smackScreen.tapSmackBurgerButton()
        channelsScreen.tapUserNameLoginButton()
        let loginScreen = LoginScreen()
        channelsScreen = loginScreen.login(username: email, passowrd: password)
    }
    
    func logout() {
        var channelsScreen = ChannelsScreen()
        channelsScreen.tapUserNameLoginButton()
        channelsScreen.tapLogOutButton()
        channelsScreen = ChannelsScreen()
        XCTAssert(isTextPresent(text: "Login"), "Cant Find Login text")
    }
}

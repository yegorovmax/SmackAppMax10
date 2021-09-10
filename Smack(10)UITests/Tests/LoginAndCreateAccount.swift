//
//  LoginAndCreateAccount.swift
//  Smack(10)UITests
//
//  Created by Maksim Egorov on 12/9/19.
//  Copyright © 2019 Max Egorov. All rights reserved.
//

import XCTest
import Foundation

class LoginAndCreateAccount: BaseTest {
    
    let userName = "a@a.a"
    let password = "123"
    
    func testlogin() {
       // return
        let smackScreen = SmackScreen()
        var channelsScreen = smackScreen.tapSmackBurgerButton()
        channelsScreen.tapUserNameLoginButton()
        let loginScreen = LoginScreen()
        channelsScreen = loginScreen.login(username: userName, passowrd: password)
        channelsScreen = ChannelsScreen()
        XCTAssert(isTextPresent(text: userName), "Cant Find userName")
        //need to log out
        channelsScreen.tapUserNameLoginButton()
        channelsScreen.tapLogOutButton()
        channelsScreen = ChannelsScreen()
        XCTAssert(isTextPresent(text: "Login"), "Cant Find Login text")
    }
}

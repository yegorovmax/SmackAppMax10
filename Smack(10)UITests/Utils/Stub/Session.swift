//
//  Session.swift
//  Smack(10)UITests
//
//  Created by Maksim Egorov on 12/9/19.
//  Copyright © 2019 Max Egorov. All rights reserved.
//

import Foundation

class Session {
    static var shared: Session = .init()

    var registerUser: [RegisterUser] = [
        RegisterUser(email: "test@test.test",
                   password: "123")
    ]
    
    var addChannel: [AddChannel] = [
        AddChannel(message: "Channel saved successfully")
    ]
    
    var loginUser: [LoginUser] = [
        LoginUser(user: "test@test.test",
                  token: "123STUBTOKEN")
    ]
    
    var addUser: [AddUser] = [
        AddUser(vAddUser: 0,
                avatarColor: "hexValue76767",
                avatarName: "dark56767676",
                email : "test@test.test",
                name : "stubName",
                id : "111UserID"
)
    ]
    
     var addUserPostCall: [AddUserPostCall] = [
            AddUserPostCall(
                    email : "test@test.test",
                    avatarName: "dark56767676",
                    avatarColor: "hexValue76767",
                    name : "stubName"
    )
        ]

    var findUserByEmail: [FindUserByEmail] = [
        FindUserByEmail(id: "111UserID",
                  avatarColor: "[0.9529411764705882, 0.9607843137254902, 0.5215686274509804, 1]",
                  avatarName: "dark0",
                  email: "test@test.test",
                  name: "stubName",
                  vEmail: 0)
    ]
    
    var findAllChannels: [FindAllChannels] = [
        FindAllChannels(id: "222ChannelID",
                  description: "BEST TEST Channel!",
                  name: "ChannelName1",
                  vChannels: 0),
        FindAllChannels(id: "333ChannelID",
                        description: "BEST TEST Channel!",
                        name: "ChannelName2",
                        vChannels: 0),
        FindAllChannels(id: "444ChannelID",
                        description: "BEST TEST Channel!",
                        name: "ChannelName3",
                        vChannels: 0),
        
    ]
    
    
    var findAllMessages: [FindAllMessages] = [
        FindAllMessages(vMessages: 0,
                        id: "messageID1",
                        channelId: "222ChannelID",
                        messageBody: "Stub message1",
                        timeStamp: "2019-11-24T03:11:39.059Z",
                        userAvatar: "dark0",
                        userAvatarColor: "[0.9529411764705882, 0.9607843137254902, 0.5215686274509804, 1]",
                        userId: "111UserID",
                        userName: "stubName"),
        FindAllMessages(vMessages: 0,
                        id: "messageID2",
                        channelId: "333ChannelID",
                        messageBody: "Stub message2",
                        timeStamp: "2019-11-25T03:11:39.059Z",
                        userAvatar: "dark24",
                        userAvatarColor: "[0.2784313725490196, 0.9490196078431372, 0.3843137254901961, 1]",
                        userId: "222UserID",
                        userName: "stubName2"),
        FindAllMessages(vMessages: 0,
                        id: "messageID3",
                        channelId: "444ChannelID",
                        messageBody: "Stub message3",
                        timeStamp: "2019-11-26T03:11:39.059Z",
                        userAvatar: "dark14",
                        userAvatarColor: "[0.43529411764705883, 0.5686274509803921, 0.33725490196078434, 1]",
                        userId: "333UserID",
                        userName: "stubName3")
        
        
    ]
    
    private init() {}
}

struct RegisterUser {
    var email: String
    var password: String
}

struct LoginUser {
    var user: String
    var token: String
}

struct AddUser {
    var vAddUser: Int
    var avatarColor: String
    var avatarName: String
    var email: String
    var name: String
    var id: String
}

struct AddUserPostCall {
    var email: String
    var avatarName: String
    var avatarColor: String
    var name: String
}


struct FindUserByEmail {
    var id: String
    var avatarColor: String
    var avatarName: String
    var email: String
    var name: String
    var vEmail: Int
}
    
struct FindAllChannels {
    var id: String
    var description: String
    var name: String
    var vChannels: Int
    }

struct FindAllMessages {
    var vMessages: Int
    var id: String
    var channelId: String
    var messageBody: String
    var timeStamp: String
    var userAvatar: String
    var userAvatarColor: String
    var userId: String
    var userName: String
}
struct AddChannel {
    var message: String
}

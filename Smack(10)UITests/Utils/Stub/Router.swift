//
//  Router.swift
//  Smack(10)UITests
//
//  Created by Maksim Egorov on 12/9/19.
//  Copyright © 2019 Max Egorov. All rights reserved.
//
import Embassy
import EnvoyAmbassador
import Foundation
//test
class OrderMeRouter: Router {

    private enum Endpoint {
        static let registerUser = "account/register"
        static let loginUser = "account/login"
        static let addUser = "user/add"
        static let findAllUsers = "user"
        static let findUserById = "user/111"
        static let addChannel = "channel/add"
        static let findAllChannels = "channel"
        static let findUserByEmail = "user/byEmail/test@test.test"
        static let findAllMessages = "message/byChannel/222"
        
    }

    let session: Session = .shared

    override init() {
        super.init()

        setupRegisterUser()
        setupLoginUser()
        setupAddUserRespond()
  //      setupAddUserPostCall()
        setupFindUserEmail()
        setUpFindAllChannels()
        setupFindAllMessages()
        setupAddChannel()
    }
    
    private func setupAddChannel() {
        self[Endpoint.addChannel] = JSONResponse { _ -> Any in
            return
                [
                    "message": self.session.addChannel[0].message
                ]
        }
    }
    
    private func setupFindAllMessages() {
           self[Endpoint.findAllMessages] = JSONResponse { _ -> Any in
               return
                   [
                    [
                        "__v": self.session.findAllMessages[0].vMessages,
                        "_id": self.session.findAllMessages[0].id,
                        "channelId": self.session.findAllMessages[0].channelId,
                        "messageBody": self.session.findAllMessages[0].messageBody,
                        "timeStamp": self.session.findAllMessages[0].timeStamp,
                        "userAvatar": self.session.findAllMessages[0].userAvatar,
                        "userAvatarColor": self.session.findAllMessages[0].userAvatarColor,
                        "userId": self.session.findAllMessages[0].userId,
                        "userName": self.session.findAllMessages[0].userName
                    ],
                    [
                        "__v": self.session.findAllMessages[1].vMessages,
                        "_id": self.session.findAllMessages[1].id,
                        "channelId": self.session.findAllMessages[1].channelId,
                        "messageBody": self.session.findAllMessages[1].messageBody,
                        "timeStamp": self.session.findAllMessages[1].timeStamp,
                        "userAvatar": self.session.findAllMessages[1].userAvatar,
                        "userAvatarColor": self.session.findAllMessages[1].userAvatarColor,
                        "userId": self.session.findAllMessages[1].userId,
                        "userName": self.session.findAllMessages[1].userName
                    ],
                    [
                        "__v": self.session.findAllMessages[2].vMessages,
                        "_id": self.session.findAllMessages[2].id,
                        "channelId": self.session.findAllMessages[2].channelId,
                        "messageBody": self.session.findAllMessages[2].messageBody,
                        "timeStamp": self.session.findAllMessages[2].timeStamp,
                        "userAvatar": self.session.findAllMessages[2].userAvatar,
                        "userAvatarColor": self.session.findAllMessages[2].userAvatarColor,
                        "userId": self.session.findAllMessages[2].userId,
                        "userName": self.session.findAllMessages[2].userName
                    ]
                   ]
               
           }
       }

    private func setUpFindAllChannels() {
        self[Endpoint.findAllChannels] = JSONResponse { _ -> Any in
            return
                [
                    [
                    "__v": self.session.findAllChannels[0].vChannels,
                    "_id": self.session.findAllChannels[0].id,
                    "description": self.session.findAllChannels[0].description,
                    "name": self.session.findAllChannels[0].name
                    ],
                    [
                        "__v": self.session.findAllChannels[1].vChannels,
                        "_id": self.session.findAllChannels[1].id,
                        "description": self.session.findAllChannels[1].description,
                        "name": self.session.findAllChannels[1].name
                    ],
                    [
                        "__v": self.session.findAllChannels[2].vChannels,
                        "_id": self.session.findAllChannels[2].id,
                        "description": self.session.findAllChannels[2].description,
                        "name": self.session.findAllChannels[2].name
                    ]
                ]
            
        }
    }
    
    private func setupRegisterUser() {
        self[Endpoint.registerUser] = JSONResponse { _ -> Any in
            return
                ["email": self.session.registerUser[0].email,
                 "password": self.session.registerUser[0].password
                ]
            
        }
    }
    
    private func setupLoginUser() {
        self[Endpoint.loginUser] = JSONResponse { _ -> Any in
            return [
                "user": self.session.loginUser[0].user,
                 "token": self.session.loginUser[0].token
                ]
        }
    }
    
    private func setupAddUserRespond() {
        self[Endpoint.addUser] = JSONResponse { _ -> Any in
            return [
                "__v": self.session.addUser[0].vAddUser,
                "avatarColor": self.session.addUser[0].avatarColor,
                "avatarName": self.session.addUser[0].avatarName,
                "email": self.session.addUser[0].email,
                "name": self.session.addUser[0].name,
                "_id": self.session.addUser[0].id
                ]
        }
    }
    
    private func setupAddUserPostCall() {
           self[Endpoint.addUser] = JSONResponse { _ -> Any in
               return [
                   "avatarColor": self.session.addUserPostCall[0].avatarColor,
                   "avatarName": self.session.addUserPostCall[0].avatarName,
                   "email": self.session.addUserPostCall[0].email,
                   "name": self.session.addUserPostCall[0].name
                   ]
           }
       }
    
    private func setupFindUserEmail() {
        self[Endpoint.findUserByEmail] = JSONResponse { _ -> Any in
            return [
                "_id": self.session.findUserByEmail[0].id,
                "avatarColor": self.session.findUserByEmail[0].avatarColor,
                "avatarName": self.session.findUserByEmail[0].avatarName,
                "email": self.session.findUserByEmail[0].email,
                "name": self.session.findUserByEmail[0].name,
                "__v": self.session.findUserByEmail[0].vEmail
            ]
        }
    }

    
}

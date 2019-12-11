//
//  AuthService.swift
//  Smack(10)
//
//  Created by Max Egorov on 11/15/19.
//  Copyright © 2019 Max Egorov. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class AuthService {
    static let instance = AuthService()
    let defaults = UserDefaults.standard
    
    var isLoggedIn : Bool {
        get {
            return defaults.bool(forKey: LOGGED_IN_KEY)
        }
        set {
            defaults.set(newValue, forKey: LOGGED_IN_KEY)
        }
    }
    
    var authToken : String {
        get {
            return defaults.value(forKey: TOKEN_KEY) as! String
        }
        set {
            defaults.set(newValue, forKey: TOKEN_KEY)
        }
    }
    
    
    var userEmail : String {
        get {
            return defaults.value(forKey: USER_EMAIL) as! String
        }
        set {
            defaults.set(newValue, forKey: USER_EMAIL)
        }
    }
    
    func registerUsert(email: String, password: String, completion: @escaping CopletionHandler){
        let lowerCaseEmail = email.lowercased()
        
        let body: [String:Any] = [
            "email":lowerCaseEmail,
            "password": password
        ]
        
        Alamofire.request(URL_REGISTER, method: .post, parameters: body, encoding: JSONEncoding.default, headers: HEADER).responseString
            { (response) in
                if response.result.error == nil {
                    completion(true)
                } else {
                    completion(false)
                    debugPrint(response.result.error as Any)
                }
        
        }
    }
    
    func loginUser (email: String, password: String, completion: @escaping CopletionHandler){
        let lowerCaseEmail = email.lowercased()
        
        let body: [String:Any] = [
            "email":lowerCaseEmail,
            "password": password
        ]
        
        Alamofire.request(URL_LOGIN, method: .post, parameters: body, encoding: JSONEncoding.default, headers: HEADER).responseJSON
            { (response) in
                if response.result.error == nil {
                    if let json = response.result.value as? Dictionary<String, Any>{
                   if let email = json["user"] as? String{
                       self.userEmail = email
                   }
                    if let token = json["token"] as? String {
                           self.authToken = token
                    }
                    
                    self.isLoggedIn = true
                    completion(true)
                } else {
                    completion(false)
                    debugPrint(response.result.error as Any)
                }
        
        }
    }
}
    
    func createUser (name:String, email:String, avatarName: String, avatarColor: String, completion: @escaping CopletionHandler) {
         let lowerCaseEmail = email.lowercased()
        
        let body: [String:Any] = [
            "name":name,
            "email":lowerCaseEmail,
            "avatarName":avatarName,
            "avatarColor":avatarColor
        ]
        
        
        Alamofire.request(URL_USER_ADD, method: .post, parameters: body, encoding: JSONEncoding.default, headers: BEARER_HEADER).responseJSON { (response) in
            if response.result.error == nil {
                if let json = response.result.value as? Dictionary <String, Any>{
                    guard let name = json["name"] as? String else{return}
                    
                    guard let id = json["_id"] as? String else {return}
                
                    guard let color = json["avatarColor"] as? String else {return}
                   
                    guard let avatarName = json["avatarName"] as? String else {return}

                    guard let email = json["email"] as? String else { return}
                    
                    UserDataService.instance.setUserData(id: id, color: color, avatarName: avatarName, email: email, name: name)
                    completion(true)
                }
                
            } else {
                completion(false)
                debugPrint(response.result.error as Any)
            }
        }
    }
    
    func findUserByEmail(completion: @escaping CopletionHandler){
        Alamofire.request("\(URL_USER_BY_EMAIL)\(userEmail)", method: .get, parameters: nil, encoding: JSONEncoding.default, headers: BEARER_HEADER).responseJSON { (response) in
            if response.result.error == nil {
                if let json = response.result.value as? Dictionary <String, Any>{
                    guard let name = json["name"] as? String else{return}
                    
                    guard let id = json["_id"] as? String else {return}
                
                    guard let color = json["avatarColor"] as? String else {return}
                   
                    guard let avatarName = json["avatarName"] as? String else {return}

                    guard let email = json["email"] as? String else { return}
                    
                    UserDataService.instance.setUserData(id: id, color: color, avatarName: avatarName, email: email, name: name)
                    completion(true)
                }
                
            } else {
                completion(false)
                debugPrint(response.result.error as Any)
            }
        }
    }
}

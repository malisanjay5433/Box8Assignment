//
//  UserDefault.swift
//  OceanWorld_Clearance
//
//  Created by Sanjay Mali on 12/02/18.
//  Copyright © 2018 Sanjay Mali. All rights reserved.
//

import Foundation
import UIKit
let isLogeddIN = "isLoggedIn"
let UserInfo = "userInfo"
class UserDefaultDetails{
    var userdefault = UserDefaults()
    func saveUserDetails(dic:[String:String]) {
        userdefault.set(dic, forKey:UserInfo)
        print(dic)
        userdefault.synchronize()
    }
    func loggedIN(isLoggedIN:Bool){
        userdefault.set(isLoggedIN, forKey:isLogeddIN)
        print(isLoggedIN)
        userdefault.synchronize()
    }
    func getUserDetails() ->[String:String]{
        let userInfo = userdefault.value(forKey:UserInfo)
        if userInfo != nil{
            return userInfo as! [String : String]
            
        }else{
            return [:]
        }
    }
}

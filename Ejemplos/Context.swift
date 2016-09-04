//
//  Context.swift
//  LoginExample
//
//  Created by Eden Torres on 9/4/16.
//  Copyright © 2016 Eden Torres. All rights reserved.
//

import UIKit

class Context: NSObject {
    private static let sharedInstance = Context()
    
    private var user: User = User()

    private override init() {
        
    }
    static func setUser(newUser:User) {
        sharedInstance.user = newUser
    }
    static func getUser()->User {
        return sharedInstance.user
    }
}

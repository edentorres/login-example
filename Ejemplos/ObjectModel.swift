//
//  ObjectModel.swift
//  Ejemplos
//
//  Created by Eden Torres on 8/30/16.
//  Copyright © 2016 Eden Torres. All rights reserved.
//

import UIKit

class ObjectModel: NSObject {
    public var _id:String?
    public var name : String!
    override init (){
        
    }
    init(pmDict:NSDictionary) {
        super.init()
        if pmDict["id"] != nil && !(pmDict["id"]! is NSNull) {
            self._id = pmDict.valueForKey("id") as? String
        }
        if pmDict["description"] != nil && !(pmDict["description"]! is NSNull) {
            self.name = pmDict.valueForKey("description") as? String
        }
        if pmDict["name"] != nil && !(pmDict["name"]! is NSNull) {
            self.name = pmDict.valueForKey("name") as? String
        }
    }
    
}

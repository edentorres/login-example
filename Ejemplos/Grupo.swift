//
//  Grupo.swift
//  Ejemplos
//
//  Created by Eden Torres on 8/30/16.
//  Copyright © 2016 Eden Torres. All rights reserved.
//

import UIKit

class Grupo: ObjectModel {
    public var type : String!
    public var descriptions : String!
    public var comment : String?
    public var childrenHeader : String?
    public var children : [PaymentMethod]?
    public var showIcon : Bool = false
    
    init(grupoDict:NSDictionary) {
        super.init(pmDict: grupoDict)
        self.children = Array()
        
        var children = [PaymentMethod]()
        if let childrenJson = grupoDict["children"] as? NSArray {
            for i in 0..<childrenJson.count {
                if let childJson = childrenJson[i] as? NSDictionary {
                    children.append(PaymentMethod(pmDict: childJson))
                }
            }
            self.children = children
        }

//        let pms : [NSDictionary] = (grupoDict.valueForKey("children") as? [NSDictionary])!
//        
//        for pm in pms {
//            let p:PaymentMethod = PaymentMethod(pmDict: pm)
//            self.children?.append(p)
//        }
    }
    
}

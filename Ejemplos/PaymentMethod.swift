//
//  PaymentMethod.swift
//  Ejemplos
//
//  Created by Eden Torres on 8/30/16.
//  Copyright © 2016 Eden Torres. All rights reserved.
//

import UIKit

class PaymentMethod: ObjectModel {
    public var additionalInfoNeeded : [String]!
    public var accreditationTime : Int?
    public var paymentTypeId: String!
    
    override init(pmDict:NSDictionary) {
        super.init(pmDict: pmDict)
        if pmDict["payment_type_id"] != nil && !(pmDict["payment_type_id"]! is NSNull) {
            self.paymentTypeId = pmDict.valueForKey("payment_type_id") as? String
        }
    }

}

//
//  PaymentMethodSearch.swift
//  Ejemplos
//
//  Created by Eden Torres on 9/1/16.
//  Copyright © 2016 Eden Torres. All rights reserved.
//

import UIKit

class PaymentMethodSearch: ObjectModel {
    var groups: [Grupo]!
    var paymentMethods :[PaymentMethod]!
    
    
    public class func fromJSON(json : NSDictionary) -> PaymentMethodSearch {
        let pmSearch = PaymentMethodSearch()
        var groupsDict: NSMutableDictionary = NSMutableDictionary()
        
        var groups = [Grupo]()
        if let groupsJson = json["groups"] as? NSArray {
            for i in 0..<groupsJson.count {
                if let groupDic = groupsJson[i] as? NSDictionary {
                    let grupito = Grupo(grupoDict: groupDic)
                    groups.append(grupito)
                    groupsDict.setValue(grupito, forKey: grupito._id!)
                }
            }
            pmSearch.groups = groups
        }
        
        var paymentMethods = [PaymentMethod]()
        if let paymentMethodsJson = json["payment_methods"] as? NSArray {
            for i in 0..<paymentMethodsJson.count {
                if let paymentMethodsDic = paymentMethodsJson[i] as? NSDictionary {
                    let currentPaymentMethod = PaymentMethod(pmDict: paymentMethodsDic)
                    paymentMethods.append(currentPaymentMethod)
                    let dic = (groupsDict.valueForKey(currentPaymentMethod.paymentTypeId))
                    if (dic != nil){
                        let grupito:Grupo = dic as! Grupo
                        grupito.children?.append(currentPaymentMethod)
                    }
                   
                    //currentPaymentMethod.paymentTypeId
                }
                
            }
            pmSearch.paymentMethods = paymentMethods
        }
        
        return pmSearch
    }
    
}

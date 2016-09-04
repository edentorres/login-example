//
//  PaymentMethodSearchService.swift
//  Ejemplos
//
//  Created by Eden Torres on 9/1/16.
//  Copyright © 2016 Eden Torres. All rights reserved.
//

import UIKit

class PaymentMethodSearchService: MercadoPagoService {
    public let MP_SEARCH_PAYMENTS_URI = "/v1"  + "/checkout" + "/payment_methods/search/options"
    
     public init(){
        super.init(baseURL: "https://api.mercadopago.com")
    }
    
    public func getPaymentMethods(amount : Double, publicKey : String, success: (paymentMethodSearch: PaymentMethodSearch) -> Void) {
        let params = "public_key=" + publicKey
        self.request(MP_SEARCH_PAYMENTS_URI, params: params, body: nil, method: "GET", success: { (jsonResult) -> Void in
            if let paymentSearchDic = jsonResult as? NSDictionary {
                if paymentSearchDic["error"] != nil {

                } else {
                    if paymentSearchDic.allKeys.count > 0 {
                        let paymentSearch = PaymentMethodSearch.fromJSON(jsonResult as! NSDictionary)
                        success(paymentMethodSearch : paymentSearch)
                    } else {

                    }
                }
            }

        },  failure: { (error) -> Void in
        })
    }
}

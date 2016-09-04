//
//  GruposSingleton.swift
//  Ejemplos
//
//  Created by Eden Torres on 8/31/16.
//  Copyright © 2016 Eden Torres. All rights reserved.
//

import UIKit


class GruposSingleton: NSObject {
    private static let sharedGrupos = GruposSingleton()
//    class var sharedInstance: GruposSingleton {
//        return sharedGrupos
//    }
    var grupos:[ObjectModel] = Array()
    private override init() {
        
        if let path = NSBundle.mainBundle().pathForResource("Grupos", ofType: "plist") {
            let array = NSArray(contentsOfFile: path)
            for grupo in array!{
                grupos.append(Grupo(grupoDict: grupo as! NSDictionary))
            }
        }
        
    }
    static func getGrupos()->[ObjectModel]{
        return sharedGrupos.grupos
    }
    
}

//
//  Weapon.swift
//  Secret_Of_Console
//
//  Created by axel leydier on 25/01/2019.
//  Copyright © 2019 axelleydier. All rights reserved.
//

import Foundation

// Type d'arme
enum WeaponType {
    case Sword
    case Scepter
    case Mass
    case Axe
    
    // Description des armes
    var description: String {
        switch self {
        case .Sword:
            return "Epee"
        case .Scepter:
            return "Sceptre"
        case .Mass:
            return "Masse"
        case .Axe:
            return "Hache"
        }
    }
}

class Weapon {
    
    let name: String
    let type: WeaponType
    
    init(type: WeaponType) {
        self.type = type
        self.name = type.description
    }
}

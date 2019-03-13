//
//  Weapon.swift
//  Secret_Of_Console
//
//  Created by axel leydier on 25/01/2019.
//  Copyright © 2019 axelleydier. All rights reserved.
//

import Foundation

/// Kind of weapon
enum WeaponType {
    case Sword
    case Scepter
    case Mass
    case Axe
    
    /// Description of weapons
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

enum ActionType {
    case damage(value: Int)
    case heal(value: Int)
}

class Weapon {
    
    let name: String
    let type: WeaponType
    let action: ActionType
    
    init(type: WeaponType) {
        self.type = type
        self.name = type.description
        switch type {
        case .Sword:
            self.action = .damage(value: 45)
        case .Scepter:
            self.action = .heal(value: 55)
        case .Mass:
            self.action = .damage(value: 25)
        case .Axe:
            self.action = .damage(value: 65)
        }
    }
}

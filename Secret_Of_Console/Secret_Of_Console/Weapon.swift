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
    case sword
    case scepter
    case mass
    case axe
    case bow
    case masterSword
    case healScepter
    case durandilAxe
    
    
    /// Description of weapons
    var description: String {
        switch self {
        case .sword:
            return "Epee"
        case .scepter:
            return "Sceptre"
        case .mass:
            return "Masse"
        case .axe:
            return "Hache"
        case .bow:
            return "Arc"
        case .masterSword:
            return "MasterSword"
        case .healScepter:
            return "Sceptre Ultime"
        case .durandilAxe:
            return "Hache de Durandil"
        }
    }
}

enum ActionType: Equatable {
    case damage(value: Int)
    case heal(value: Int)
}
extension ActionType {
    static func ==(lhs: ActionType, rhs: ActionType) -> Bool {
        switch (lhs, rhs) {
        case let (.damage(v1), .damage(v2)):
            return v1 == v2
        case let (.heal(v1), .heal(v2)):
            return v1 == v2
        default:
            return false
        }
    }
}

class Weapon {
    
    let name: String
    let type: WeaponType
    let action: ActionType
    
    init(type: WeaponType) {
        self.type = type
        self.name = type.description
        switch type {
        case .sword:
            self.action = .damage(value: 45)
        case .scepter:
            self.action = .heal(value: 55)
        case .mass:
            self.action = .damage(value: 25)
        case .axe:
            self.action = .damage(value: 65)
        case .bow:
            self.action = .damage(value: 70)
        case .masterSword:
            self.action = .damage(value: 80)
        case .healScepter:
            self.action = .heal(value: 80)
        case .durandilAxe:
            self.action = .damage(value: 90)
        }
    }
}

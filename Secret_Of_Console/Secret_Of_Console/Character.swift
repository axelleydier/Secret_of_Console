//
//  Character.swift
//  Secret_Of_Console
//
//  Created by axel leydier on 25/01/2019.
//  Copyright © 2019 axelleydier. All rights reserved.
//

import Foundation

// Type de personnage
enum CharacterType {
    case Fighter
    case Magus
    case Colossus
    case Dwarf
    
    // Description des personnages
    var description: String {
        switch self {
        case .Fighter:
            return "Combattant"
        case .Magus:
            return "Mage"
        case .Colossus:
            return "Colosse"
        case .Dwarf:
            return "Nain"
        }
    }
}

extension CharacterType {
    init(choice: String) {
        switch choice {
        case "1":
            self = .Magus
        case "2":
            self = .Colossus
        case "3":
            self = .Dwarf
        default:
            self = .Fighter
        }
    }
}

class Character {
    
    let name: String
    let type: CharacterType
    var weapon: Weapon
    
    init(name: String, type: CharacterType) {
        self.name = name
        self.type = type
        switch type {
        case .Fighter:
            self.weapon = Weapon(type: .Sword)
        case .Magus:
            self.weapon = Weapon(type: .Scepter)
        case .Colossus:
            self.weapon = Weapon(type: .Mass)
        case .Dwarf:
            self.weapon = Weapon(type: .Axe)
        }
    }
}

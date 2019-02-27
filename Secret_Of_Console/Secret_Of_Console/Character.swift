//
//  Character.swift
//  Secret_Of_Console
//
//  Created by axel leydier on 25/01/2019.
//  Copyright © 2019 axelleydier. All rights reserved.
//

import Foundation

/// Kind of character
enum CharacterType: String, CaseIterable {
    case magus = "Mage"
    case colossus = "Colosse"
    case dwarf = "Nain"
    case warrior = "Guerrier"
}

extension CharacterType {
    init?(choice: String) {
        switch choice {
        case "1":
            self = .magus
        case "2":
            self = .colossus
        case "3":
            self = .dwarf
        case "4":
            self = .warrior
        default:
            return nil
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
        case .warrior:
            self.weapon = Weapon(type: .Sword)
        case .magus:
            self.weapon = Weapon(type: .Scepter)
        case .colossus:
            self.weapon = Weapon(type: .Mass)
        case .dwarf:
            self.weapon = Weapon(type: .Axe)
        }
    }
}

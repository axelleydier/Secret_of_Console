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
    
    private let maxLife: Int
    let name: String
    let type: CharacterType
    var weapon: Weapon
    var life: Int
    var isAlive: Bool {
        return life > 0
    }
    
    init(name: String, type: CharacterType) {
        self.name = name
        self.type = type
        switch type {
        case .magus:
            self.weapon = Weapon(type: .scepter)
            self.life = 120
            self.maxLife = 120
        case .colossus:
            self.weapon = Weapon(type: .mass)
            self.life = 200
            self.maxLife = 200
        case .dwarf:
            self.weapon = Weapon(type: .axe)
            self.life = 50
            self.maxLife = 50
        case .warrior:
            self.weapon = Weapon(type: .sword)
            self.life = 100
            self.maxLife = 100
        }
    }
    
    func updateLife(with action: ActionType) {
        switch action {
        case .damage(value: let value):
            if isAlive {
                if value < life {
                    self.life -= value
                } else {
                    life = 0
                }
            }
        case .heal(value: let value):
            if (value + life) > maxLife {
                self.life = maxLife
            } else {
                self.life += value
            }
        }
    }
    func updateWeapon(with weapon: Weapon?) {
        guard let weapon = weapon else { return }
        if self.type == .magus, case .heal = weapon.action {
            self.weapon = weapon
        } else if self.type != .magus, case .damage = weapon.action {
            self.weapon = weapon
        }
    }
}
extension Character: CustomStringConvertible {
    var description: String {
        return "\(self.name) \(self.type) \(self.life)"
    }
}

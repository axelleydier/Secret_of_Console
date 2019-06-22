//
//  MagicChest.swift
//  Secret_Of_Console
//
//  Created by axel leydier on 29/05/2019.
//  Copyright © 2019 axelleydier. All rights reserved.
//

import Foundation

class MagicChest {
    private var weapons: [Weapon] = []
    
    init() {
        weapons = [Weapon(type: .bow),
                   Weapon(type: .masterSword),
                   Weapon(type: .healScepter),
                   Weapon(type: .durandilAxe)]
    }
    
    func randomWeapon() -> Weapon? {
        let result = Int.random(in: 0...20)
        guard result < weapons.count else { return nil }
        return weapons[result]
    }
}

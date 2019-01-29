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

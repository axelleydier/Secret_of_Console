//
//  Player.swift
//  Secret_Of_Console
//
//  Created by axel leydier on 25/01/2019.
//  Copyright © 2019 axelleydier. All rights reserved.
//

import Foundation

class Player {
    
    let name: String
    
    var characters: [Character]
    
    init(name: String) {
        self.name = name
        self.characters = []
    }
}

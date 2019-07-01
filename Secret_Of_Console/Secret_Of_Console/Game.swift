//
//  Game.swift
//  Secret_Of_Console
//
//  Created by axel leydier on 25/01/2019.
//  Copyright © 2019 axelleydier. All rights reserved.
//

import Foundation

class Game {
    
    static let maxPlayersNumber = 2
    static let maxCharactersNumber = 3
    var nbTurn = 0
    
    var players: [Player] = []
    var names: [String] = []
    
    func start() {
        print("Le jeu a démarré")
        settings()
        play()
        end()
    }
    func settings() {
        for playerIndex in 1...Game.maxPlayersNumber {
            
            print("Joueur \(playerIndex): Merci de rentrer votre nom: ")
            
            let player = createPlayer()
            
            for _ in 1...Game.maxCharactersNumber {
                let character = createCharacter()
                player.characters.append(character)
            }
            
            players.append(player)
        }
    }
    
    private func createPlayer() -> Player {
        var name = ""
        var nameCounter = 0
        repeat {
            if nameCounter >= 1 {
                print("Merci de rentrer un nom NON VIDE et pas utilisé")
            }
            if let _name = readLine() {
                name = _name
            }
            nameCounter += 1
        } while name.isEmpty || names.contains(name)
        names.append(name)
        
        let player = Player(name: name)
        return player
    }
    
    func createCharacter() -> Character {
        print("Choisissez un personnage dans la liste: ")
        
        var typeCounter = 1
        CharacterType.allCases.forEach { type in
            print("\(typeCounter): \(type.rawValue)")
            typeCounter += 1
        }
        
        let chosenCharacterType = chooseCharacterType()
        
        print("Comment il/elle s'appelle ?")
        
        let chosenCharacterName = chooseCharacterName()
        names.append(chosenCharacterName)
        
        let character = Character(name: chosenCharacterName, type: chosenCharacterType)
        return character
    }
    
    func chooseCharacterType() -> CharacterType {
        var chosenCharacterType: CharacterType?
        var characterTypeCounter = 0
        repeat {
            if characterTypeCounter >= 1 {
                print("Merci de rentrer de choisir un numéro dans la liste")
            }
            if let stringInput = readLine() {
                if let characterType = CharacterType(choice: stringInput) {
                    chosenCharacterType = characterType
                }
            } else {
                chosenCharacterType = nil
            }
            characterTypeCounter += 1
        } while chosenCharacterType == nil
        
        return chosenCharacterType!
    }
    
    func chooseCharacterName() -> String {
        var chosenCharacterName = ""
        var characterNameCounter = 0
        repeat {
            if characterNameCounter >= 1 {
                print("Merci de rentrer un nom non vide et non utilisé")
            }
            if let _name = readLine() {
                chosenCharacterName = _name
            } else {
                chosenCharacterName = ""
            }
            characterNameCounter += 1
        } while chosenCharacterName.isEmpty || names.contains(chosenCharacterName)
        return chosenCharacterName
    }
    
    private func printRecap() {
        players.forEach { (player) in
            print(player.name)
            
            player.characters.forEach({ (character) in
                print(character.description)
            })
        }
    }
    
    func chooseCharacter(at index: Int, in characters: [Character]) -> Character? {
        guard index < characters.count else { return nil }
        let character = characters[index]
        return character
    }
    
    func chosenIndex() -> Int {
        //récupérer l'entrée utilisateur et la transformer en index
        //repeat while
        var index: Int?
        var chosenIndexCounter = 0
        repeat {
            if chosenIndexCounter >= 1 {
                print("Merci de rentrer un numéro dans la liste")
            }
            if let _index = readLine() {
                let _indexInt = Int(_index)
                index = _indexInt
            } else {
                index = nil
            }
            chosenIndexCounter += 1
        } while index == nil
        return index!
    }
    
    func play() {
        repeat {
            let attacker = players[0]
            let defender = players[1]
            var targetedCharacter: Character?
            
            printRecap()
            print("Tour numéro \(nbTurn)")
            
            print("\(attacker.name): veuillez sélectionner un de vos personnages: ")
            attacker.characters.enumerated().forEach { (character) in
                print("\(character.offset): \(character.element.description)")
            }
            let selectedCharacter = chooseCharacter(at: chosenIndex(), in: attacker.characters)
            
            
            let magicChest = MagicChest()
            if let weapon = magicChest.randomWeapon() {
                print("Oh ! Un coffre magique est apparu !")
                selectedCharacter?.updateWeapon(with: weapon, callback: {
                    print("\(selectedCharacter!.name) a recu \(weapon.name)")
                })
            } else {
                print("Il ne s'est rien passé")
            }
            
            if selectedCharacter?.type == .magus {
                print("\(attacker.name): veuillez sélectionner un de vos personnages à soigner ")
                attacker.characters.enumerated().forEach { (character) in
                    print("\(character.offset): \(character.element.description)")
                }
                targetedCharacter = chooseCharacter(at: chosenIndex(), in: attacker.characters)
            } else {
                print("\(attacker.name): veuillez sélectionner un personnage ennemi: ")
                defender.characters.enumerated().forEach { (character) in
                    print("\(character.offset): \(character.element.description)")
                }
                targetedCharacter = chooseCharacter(at: chosenIndex(), in: defender.characters)
            }
            if let action = selectedCharacter?.weapon.action {
                targetedCharacter?.updateLife(with: action)
            }
            attacker.characters = deleteDeadCharacter(from: attacker.characters)
            defender.characters = deleteDeadCharacter(from: defender.characters)
            players.swapAt(0, 1)
            
            nbTurn += 1
        } while players[0].characters.contains(where: {$0.isAlive && $0.type != .magus})
            && players[1].characters.contains(where: {$0.isAlive && $0.type != .magus})
        print("Fin des combats")
        if players[0].characters.contains(where: { $0.isAlive && $0.type != .magus }) {
            print("\(players[0].name) a gagné !!")
        } else {
            print("\(players[1].name) a gagné !!")
        }
    }
    
    private func deleteDeadCharacter(from characters: [Character]) -> [Character] {
        return characters.filter({ (character) -> Bool in
            return character.isAlive
        })
    }
    
    func end() {
        print("Fin du jeu")
        print("Nombre de tours total: \(nbTurn)")
        printRecap()
    }
}

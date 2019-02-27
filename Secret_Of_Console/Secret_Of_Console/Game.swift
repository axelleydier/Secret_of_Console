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
    
    var players: [Player] = []
    
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
                print("Merci de rentrer un nom NON VIDE")
            }
            if let _name = readLine() {
                name = _name
            }
            nameCounter += 1
        } while name.isEmpty
        
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
        
        print("Comment il/elle s'appelle ?")
        var chosenCharacterName = ""
        var characterNameCounter = 0
        repeat {
            if characterNameCounter >= 1 {
                print("Merci de rentrer un nom non vide.")
            }
            if let stringInput = readLine() {
                chosenCharacterName = stringInput
            } else {
                chosenCharacterName = ""
            }
            characterNameCounter += 1
        } while chosenCharacterName.isEmpty
        
        let character = Character(name: chosenCharacterName, type: chosenCharacterType!)
        return character
    }
    
    func play() {
        
        // Répéter tant que les 2 équipes ont au moins un personnage vivant
        //      Afficher le récap des 2 équipes (noms + pv etc..)
        //      Joueur 1 sélectionne un perso de son équipe
        //      Arrivée aléatoire d'un coffre magique
        //      Si personnage selectionné == mage {
        //            Joueur 1 sélectionne un perso de son équipe
        //      } sinon {
        //            Joueur 1 sélectionne un perso de l'équipe adverse
        //      }
        //      Résolution de l'action/du combat
        // On appelle la fin du jeu
    }
    
    func end() {
        print("Fin du jeu")
        // Afficher le récap total.
    }
}

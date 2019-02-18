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
            
            for characterIndex in 1...Game.maxCharactersNumber {
                
                if characterIndex == Game.maxCharactersNumber {
                    print("Joueur \(playerIndex): Merci de rentrer le dernier chiffre correspondand au dernier personnage")
                } else {
                    print("Joueur \(playerIndex): Merci de rentrer le \(characterIndex)e chiffre correspondand au \(characterIndex)e personnage")
                }
                var chosenCharacterType: CharacterType?
                
                repeat {
                    
                    guard let stringInput = readLine() else {
                        return
                    }
                    if let characterType = CharacterType(choice: stringInput){
                        print("Vous avez choisi le : \(characterType.description)")
                        chosenCharacterType = characterType
                    }
            
                } while chosenCharacterType == nil
                
                print("Comment il/elle s'appelle ?")
                if let characterName = readLine(), let _chosenCharacterType = chosenCharacterType{
                    let character = Character(name: characterName, type: _chosenCharacterType)
                    player.characters.append(character)
                }
            }
            
            players.append(player)
        }
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

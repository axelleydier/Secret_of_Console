//
//  Game.swift
//  Secret_Of_Console
//
//  Created by axel leydier on 25/01/2019.
//  Copyright © 2019 axelleydier. All rights reserved.
//

import Foundation

class Game {
    
    var players: [Player] = []
    
    func start() {
        print("Le jeu a démarré")
        settings()
        play()
        end()
    }
    
    func settings() {
        // Répéter 2x:
        //      Choix du nom de l'équipe
        //      Répéter 3x:
        //              Choix du type de perso
        //              Choix du nom du personnage
        // On démarre le jeu on appelle la fonction play()
        
        for playerIndex in 1...2 {
            
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
            
            for characterIndex in 1...3 {
                
                print("Joueur \(playerIndex): Merci de rentrer le \(characterIndex)e chiffre correspondand au \(characterIndex)e personnage")
                
                guard let stringInput = readLine() else {
                    return
                }
                
                switch stringInput {
                case "1":
                    print("Vous avez choisi le", CharacterType.Magus.description, "!")
                    break
                case "2":
                    print("Vous avez choisi le", CharacterType.Colossus.description, "!")
                    break
                case "3":
                    print("Vous avez choisi le", CharacterType.Dwarf.description, "!")
                    break
                default:
                    print("Vous avez choisi le", CharacterType.Fighter.description, "!")
                    break
                }
                
                print("Comment il/elle s'appelle ?")
                if let characterName = readLine(){
                    let character = Character(name: characterName, type: CharacterType(choice: stringInput))
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

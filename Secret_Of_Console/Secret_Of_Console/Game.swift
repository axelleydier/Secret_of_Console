//
//  Game.swift
//  Secret_Of_Console
//
//  Created by axel leydier on 25/01/2019.
//  Copyright © 2019 axelleydier. All rights reserved.
//

import Foundation

class Game {
    
    func start() {
        print("Le jeu a démarré")
        settings()
    }
    
    func settings() {
        // Répéter 2x:
        //      Choix du nom de l'équipe
        //      Répéter 3x:
        //              Choix du type de perso
        //              Choix du nom du personnage
        // On démarre le jeu on appelle la fonction play()
        var NumberOfTeam = 0
        while NumberOfTeam != 2 {
            print ("Choisissez le nom de votre equipe")
            if let TeamName = readLine(){
                print ("Bonjour \(TeamName) choisissez vos personnages")
                
                var NumberOfCharacter = 0
                while NumberOfCharacter != 3 {
                    print("Choisissez le type de personnage que vous voulez jouer (l'opération sera répété 3 fois)")
                    //              Choix du type de perso
                    if let NameCharacter = readLine(){
                        print("Bonjour \(NameCharacter)")
                    }
                    NumberOfCharacter += 1
                }
            }
            
            NumberOfTeam += 1
        }
        play()
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
        end()
    }
    
    func end() {
        print("Fin du jeu")
        // Afficher le récap total.
    }
}

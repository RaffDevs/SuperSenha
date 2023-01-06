//
//  PasswordGenerator.swift
//  SuperSenha
//
//  Created by Rafael Veronez Dias on 04/01/23.
//

import Foundation


class PasswordGenerator {
    var numberOfCharacter: Int
    var useUppercaseLetter: Bool
    var useLowercaseLetter: Bool
    var useNumbers: Bool
    var useSpecialCharacters: Bool
    
    var passwords: [String] = []
    
    private let letters = "abcdefghijklmnoprstuvwxyz"
    private let specialCharacters = "!@#$%¨&*()-_+=[]^~/;,.<>:?"
    private let numbers = "0123456789"
    
    init(numberOfCharacter: Int, useUppercaseLetter: Bool, useLowercaseLetter: Bool, useNumbers: Bool, useSpecialCharacters: Bool) {
        var numchars = min(numberOfCharacter, 16)
        numchars = max(numchars, 1)
        
        self.numberOfCharacter = numchars
        self.useUppercaseLetter = useUppercaseLetter
        self.useLowercaseLetter = useLowercaseLetter
        self.useNumbers = useNumbers
        self.useSpecialCharacters = useSpecialCharacters
    }
    
    func generatePassword(total: Int) -> [String] {
        passwords.removeAll()
        var universe: String = ""
        
        if useLowercaseLetter {
            universe += letters
            print("minuscula", universe)
        }
        
        if useSpecialCharacters {
            universe += specialCharacters
            print("especiais", universe)

        }
        
        if useNumbers {
            universe += numbers
            print("numeros", universe)

        }
        
        if useUppercaseLetter {
            universe += letters.uppercased()
            print("maisculas", universe)

        }
        
        
        let universeArray = Array(universe)
        
        print("Universe", universe)
        
        while passwords.count < total {
            print(total)
            var password = ""
            for _ in 1...numberOfCharacter {
                let index = Int.random(in: 1..<universeArray.count)
                password += String(universeArray[index])
            }
            
            passwords.append(password)
        }
        
        
        return passwords
    }
}

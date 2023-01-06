//
//  PasswordsViewController.swift
//  SuperSenha
//
//  Created by Rafael Veronez Dias on 04/01/23.
//

import UIKit

class PasswordsViewController: UIViewController {

    @IBOutlet weak var passwordsTextView: UITextView!
    
    var numberOfCharacters: Int = 10
    var numberOfPasswords: Int = 1
    var useLowercasseLetters: Bool = false
    var useUppercaseLetters: Bool = false
    var useNumbers: Bool = false
    var useSpecialCharacters: Bool = false
    
    var passwordGenerator: PasswordGenerator!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(useNumbers, useSpecialCharacters)
        
        title = "Total de senhas: \(numberOfPasswords)"
        passwordGenerator = PasswordGenerator(
            numberOfCharacter: numberOfCharacters, useUppercaseLetter: useUppercaseLetters, useLowercaseLetter: useLowercasseLetters, useNumbers: useNumbers, useSpecialCharacters: useSpecialCharacters)
        
        generatePasswords()
        

    }
    
    func generatePasswords() {
        passwordsTextView.scrollRangeToVisible(NSRange(location: 0, length: 0))
        passwordsTextView.text = ""
        let passwords = passwordGenerator.generatePassword(total: numberOfPasswords)
        for password in passwords {
            passwordsTextView.text.append(password + "\n\n")
        }
    }
    
    @IBAction func generate(_ sender: UIButton) {
        generatePasswords()
    }
    
}

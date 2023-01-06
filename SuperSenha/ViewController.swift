//
//  ViewController.swift
//  SuperSenha
//
//  Created by Rafael Veronez Dias on 03/01/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var totalPasswordTextField: UITextField!
    @IBOutlet weak var totalCharacteresTextField: UITextField!
    @IBOutlet weak var lowercaseLetterSwitch: UISwitch!
    @IBOutlet weak var numberSwitch: UISwitch!
    @IBOutlet weak var uppercaseLetterSwitch: UISwitch!
    @IBOutlet weak var specialCharacterSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lowercaseLetterSwitch.isOn = false
        numberSwitch.isOn = false
        uppercaseLetterSwitch.isOn = false
        specialCharacterSwitch.isOn = false
        // Do any additional setup after loading the view.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let passwordViewController = segue.destination as? PasswordsViewController {
            if let numbersOfPasswords = Int(totalPasswordTextField.text!) {
                passwordViewController.numberOfPasswords = numbersOfPasswords
            }
            
            if let numberOfCharacters = Int(totalCharacteresTextField.text!) {
                passwordViewController.numberOfCharacters = numberOfCharacters
            }
            
            passwordViewController.useUppercaseLetters = uppercaseLetterSwitch.isOn
            passwordViewController.useLowercasseLetters = lowercaseLetterSwitch.isOn
            passwordViewController.useNumbers = numberSwitch.isOn
            passwordViewController.useSpecialCharacters = specialCharacterSwitch.isOn
            
            view.endEditing(true)
        }
    }

}


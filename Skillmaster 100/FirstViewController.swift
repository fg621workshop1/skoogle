//
//  FirstViewController.swift
//  Skillmaster 100
//
//  Created by Grobel Kirsti, FG-621 on 27.07.16.
//  Copyright © 2016 bmw. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var Vorname: UITextField!
    @IBOutlet weak var Nachname: UITextField!
    @IBOutlet weak var Email: UITextField!
    @IBOutlet weak var Skill: UITextField!
    @IBOutlet weak var Speichernerfolgreich: UILabel!
    @IBOutlet weak var Level: UISlider!
    
    @IBAction func zuruecksetzen(sender: AnyObject) {
        
        Vorname.text=""
        Nachname.text=""
        Email.text=""
        Skill.text=""
         Speichernerfolgreich.text=""
        self.view.endEditing(true)
        
    }
    var mySkillSpeichern = SkillSpeichernModel()
    
   //func textFieldShouldReturn(textField: UITextField) -> Bool {
    //textField.resignFirstResponder()
    //return true
    //}
    
    //override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
     /*   Vorname.resignFirstResponder()
        self.view.endEditing(true)
    }
*/
    
    
    @IBAction func TapGesture(sender: AnyObject) {
        self.view.endEditing(true)
    }


    
    @IBAction func Speichern(sender: AnyObject) {

        if Email.text == "" {
            Email.text="Emailadresse ungültig"
        }
        else{
            
        
        let SpeichernErfolgreich: Bool = mySkillSpeichern.SkillSpeichern (Vorname.text! , Nachname: Nachname.text!, Email: Email.text!, SkillName: Skill.text!, Level: Int(Level.value))
        
        
       //  let SpeichernErfolgreich: Bool = true
        
        if SpeichernErfolgreich {
           // UIAlertAction (title: "Erfolg", style: UIAlertActionStyle, handler: <#T##((UIAlertAction) -> Void)?##((UIAlertAction) -> Void)?##(UIAlertAction) -> Void#>)
        Skill.text=""
        Speichernerfolgreich.text="Skill erfasst"
            
            self.view.endEditing(true)
        }
        }
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


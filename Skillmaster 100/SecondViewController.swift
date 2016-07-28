//
//  SecondViewController.swift
//  skoogle
//
//  Created by Peters Jan, FG-621 on 27.07.16.
//  Copyright © 2016 Peters Jan, FG-621. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var SkillEingabe: UITextField!
    @IBOutlet weak var SkillSearchButton: UIButton!
    @IBOutlet weak var SkillSearchResult: UITableView!
    
    @IBAction func StartSearch(sender: UIButton) {
        print(SkillEingabe.text)
        
        
        //var accounts = skillModel.readAccountsForSkill(SkillEingabe.text)
        SkillSearchModel.readAccountsForSkill(SkillEingabe.text!)
        
        // Dictionary in SkillSearchResult anzeigen
        // Return: „name“, „surname“, „email“, „skill“, „level“ -> Inhalt jeder Zeile für Darstellung in Table SkillSearchResult
        
        self.view.endEditing(true)
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
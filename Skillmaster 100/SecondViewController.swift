//
//  SecondViewController.swift
//  skoogle
//
//  Created by Peters Jan, FG-621 on 27.07.16.
//  Copyright © 2016 Peters Jan, FG-621. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var SkillEingabe: UITextField!
    @IBOutlet weak var SkillSearchButton: UIButton!
    @IBOutlet weak var SkillSearchResult: UITableView!
    
    let textCellIdentifier = "TextCell"
    var accounts:[Account] = []
    let skillSearchModel = SkillSearchModel()
    
    @IBAction func StartSearch(sender: UIButton) {
        accounts = skillSearchModel.readAccountsForSkill(SkillEingabe.text!)
        print(SkillEingabe.text)
    
        self.SkillSearchResult.reloadData()

        
        //var accounts = skillModel.readAccountsForSkill(SkillEingabe.text)
        SkillSearchModel.readAccountsForSkill(SkillEingabe.text!)
        
        // Dictionary in SkillSearchResult anzeigen
        // Return: „name“, „surname“, „email“, „skill“, „level“ -> Inhalt jeder Zeile für Darstellung in Table SkillSearchResult
        
        self.view.endEditing(true)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        SkillSearchResult.delegate = self
        SkillSearchResult.dataSource = self
        

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return accounts.count
    }
    

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(textCellIdentifier, forIndexPath: indexPath)
        
        let row = indexPath.row
        cell.textLabel?.text = "\(accounts[row].name) \(accounts[row].surname): Level \(accounts[row].level)"
        
        return cell
    }
    
    
}
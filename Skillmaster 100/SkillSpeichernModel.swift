//
//  SkillSpeichernModel.swift
//  skoogle
//
//  Created by Grobel Kirsti, FG-621 on 27.07.16.
//  Copyright © 2016 bmw. All rights reserved.
//

import UIKit

class SkillSpeichernModel: NSObject {
    
    let baseURL = "http://62.155.157.99:3030/"
    let accountResource = "account/"
    let accountsResource = "accounts/"
    let skillResource = "skill/"
    let skillsResource = "skills/"
    let accountParams = "?email="
    
    func SkillSpeichern (Vorname:String, Nachname:String, Email:String, SkillName:String, Level:Int) -> Bool{
   
        // Account anhand E-Mail holen
        var account = getAccountByEmail(Email)
        if(account.id == 0) {
            account = createAccount(Vorname, nachname: Nachname, email: Email)
        }
        
        if(account.id == 0) {
            print("Fehler beim Account anlegen!")
            return false
        }
        
        //Skill zu der UserID speichern
        let skill = Skill()
        skill.level = Level
        skill.skill = SkillName
        skill.userId = account.id
        
        return saveSkill(skill)

        
        }
    
    func getAccountByEmail(eMail:String) -> Account {
        
        let path = baseURL + accountResource + accountParams + eMail
        let request = NSMutableURLRequest(URL: NSURL(string: path)!)
        let session = NSURLSession.sharedSession()
        
        var account = Account()
        
        let task = session.dataTaskWithRequest(request) { (data, response, error) -> Void in
            if let data = data {
                let response = NSString(data: data, encoding: NSUTF8StringEncoding)
                print(response)
                
                do {
                    let resp = try NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers)
                    print(resp)
                    
                    let accounts = ObjectConverter.convertToAccounts(data)
                    
                    if(accounts.count > 0) {
                        account = accounts[0]
                    }
                    
                }
                catch {
                    print("an error ocurred.")
                }
            }
        }
        
        task.resume()
        
        
        
        
        return account
    }
    
    func saveSkill(skill:Skill) -> Bool {
        let path = baseURL + skillResource
        let request = NSMutableURLRequest(URL: NSURL(string: path)!)
        request.HTTPMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        let dict = ["userId":String(skill.userId), "skill": skill.skill, "level":String(skill.level)]
        
        do {
            let jsonDict = try NSJSONSerialization.dataWithJSONObject(dict, options: .PrettyPrinted)
            request.HTTPBody = jsonDict
            let task = NSURLSession.sharedSession().dataTaskWithRequest(request) { (data, response, error) -> Void in }
            task.resume()
        } catch {
            print("an error ocurred.")
        }
        
        return true
        
    }
    
    func createAccount(vorname:String, nachname:String, email:String) -> Account {
        let path = baseURL + accountResource
        let request = NSMutableURLRequest(URL: NSURL(string: path)!)
        request.HTTPMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        let dict = ["name":vorname, "surname": nachname, "email":email, "pwd":"password"]
        
        do {
            let jsonDict = try NSJSONSerialization.dataWithJSONObject(dict, options: .PrettyPrinted)
            request.HTTPBody = jsonDict
            let task = NSURLSession.sharedSession().dataTaskWithRequest(request) { (data, response, error) -> Void in }
            task.resume()
        } catch {
            print("an error ocurred.")
        }
        
        return getAccountByEmail(email)
    }

}

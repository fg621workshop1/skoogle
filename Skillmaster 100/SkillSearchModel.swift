//
//  SkillSearchModel.swift
//  skoogle
//
//  Created by Martina Huelz on 28/07/16.
//  Copyright © 2016 bmw. All rights reserved.
//

import UIKit

class SkillSearchModel: NSObject {
    let baseURL = "http://62.155.157.99:3030/"
    
    
    func readAccountsForSkill (aSkill:String) -> [Account]{
        var accounts = [Account]()
        
        // let baseURLAccounts = "\(baseURL)accounts"
        
        //let baseURLSkills = "\(baseURL)skills"
        
        //var skill = "java"
        
        // var URL = "\(baseURLAccounts)?skill=\(aSkill)"
        let URL = "http://62.155.157.99:3030/accounts?skill=\(aSkill)"
        print (URL)
        
        let readAccountsRequest = NSMutableURLRequest(URL: NSURL(string: URL)!)
        
        let session = NSURLSession.sharedSession()
        
        let task = session.dataTaskWithRequest(readAccountsRequest, completionHandler: {jsonData, response, error -> Void in
            if((error) != nil) {
                print(error)
            }
            let datastring = NSString(data: jsonData!,encoding: NSUTF8StringEncoding)
            print(datastring)
            
            var err: NSError
            
            do {
                var jsonResult: NSArray = try NSJSONSerialization.JSONObjectWithData(jsonData!, options: NSJSONReadingOptions.MutableContainers) as! NSArray
                
                for i in 0 ..< jsonResult.count {
                    var dictResult = jsonResult.objectAtIndex(i) as! NSDictionary
                    var newAccount = Account()
                    newAccount.name = dictResult.valueForKey("name") as! String
                    newAccount.email = dictResult.valueForKey("email") as! String
                    newAccount.level = dictResult.valueForKey("level") as! Int
                    newAccount.surname = dictResult.valueForKey("surname") as! String
                    newAccount.skill = dictResult.valueForKey("skill") as! String
                    accounts.append(newAccount)
                }
                
                print(accounts)
            } catch {
                print(error)
            }
            
        })
        
        task.resume()
        return accounts
    }

}

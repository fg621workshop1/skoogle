//
//  ObjectConverter.swift
//  skoogle
//
//  Created by Wuerth Alexander, FG-621 on 28.07.16.
//  Copyright © 2016 bmw. All rights reserved.
//

import UIKit

class ObjectConverter: NSObject {

    class func parseJSON(inputData: NSData) -> Array<NSDictionary>{
        var result: Array<NSDictionary> = Array<NSDictionary>()
        do {
            result = try NSJSONSerialization.JSONObjectWithData(inputData, options: []) as! Array<NSDictionary>
        } catch let error as NSError {
            print("Error: ")
            print(error.localizedDescription)
        }
        return result
        
    }
    class func convertToAccount(inputData: NSDictionary) -> Account{
        let account: Account = Account()
        
        account.name = inputData.objectForKey("name") as! String
        account.surname = inputData.objectForKey("surname") as! String
        account.email = inputData.objectForKey("email") as! String
        account.id = inputData.objectForKey("id") as! Int
        
        return account
    }
    
    class func convertToAccounts(inputData: NSData) -> Array<Account>{
        
        let data: Array<NSDictionary> = self.parseJSON(inputData)
        
        var accountList: Array<Account> = Array<Account>()
        
        for var item in data {
            accountList.append(self.convertToAccount(item))
        }
        return accountList
    }

}

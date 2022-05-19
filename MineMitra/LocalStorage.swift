//
//  LocalStorage.swift
//  MineMitra
//
//  Created by Swamy on 01/05/22.
//

import UIKit
class UserDetails {
    
    private static let UserKey = "UserKey"
    
    private static func archiveNews(people : LoginData?) -> NSData {
        
        return NSKeyedArchiver.archivedData(withRootObject: people as AnyObject) as NSData
    }
    
    static func loadData() -> LoginData? {
        
        if let unarchivedObject = UserDefaults.standard.object(forKey: UserKey) as? Data {
            
            return NSKeyedUnarchiver.unarchiveObject(with: unarchivedObject as Data) as? LoginData
        }
        
        return nil
    }
    
    static func saveData(people : LoginData?) {
        
        let archivedObject = archiveNews(people: people!)
        UserDefaults.standard.set(archivedObject, forKey: UserKey)
        UserDefaults.standard.synchronize()
}
}

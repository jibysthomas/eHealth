//
//  CacheManager.swift
//  QRMobile
//
//  Created by Mohasin  on 2/12/15.
//  Copyright (c) 2015 Qatar Airways. All rights reserved.
//

import UIKit

class CacheManager: NSObject {
   
/********************************************************************************************************************************
    This function copies a file from main bundle to the dcoument path.
********************************************************************************************************************************/
    
    class func copyFileInBundleToDocumentsFolder(fileName:String, fileExtension:String)-> Bool{
        let fileManager:FileManager = FileManager.default
        let filePath:String = Utilities.getDocumentPathForUser()
        let destPath:String = filePath + "/" + fileName + "." + fileExtension
        let pathToFileInBundle: String = Bundle.main.path(forResource: fileName as String, ofType: fileExtension as String)!
        var error:NSError?
        var retVal:Bool = false
       
        do {
            try fileManager.copyItem(atPath: pathToFileInBundle as String, toPath: destPath as String)
        }
        catch let errors as NSError {
            error = errors
        }
        
        if error == nil {
            retVal = true
        }
        
        return retVal
    }
    
/********************************************************************************************************************************
    This function delete file from specified path.
********************************************************************************************************************************/
    
    class func deleteFileInPath(filePath:String)->Bool{
        let fileManager:FileManager = FileManager.default
        var retVal : Bool = false
        var error:NSError?
        if(fileManager.fileExists(atPath: filePath)) {
            do {
                try fileManager.removeItem(atPath: filePath)
            }
            catch let errors as NSError {
                error = errors
            }
            
            if error == nil {
                retVal = true
            }

        }
        return retVal
    }
    
/********************************************************************************************************************************
    This function sets the key-value pairs in the specified plist.
********************************************************************************************************************************/
    
    class func setValueForKey(key:NSString, value:AnyObject, plistName:NSString){
        let plistFileName = (plistName as String) + ".plist"
        let cacheDir:NSString = Utilities.getDocumentPathForUser() as NSString
        let userConfigFile:NSString = cacheDir.appendingPathComponent(plistFileName as String) as NSString
        let configDic:NSMutableDictionary = NSMutableDictionary(contentsOfFile: userConfigFile as String)!
        configDic.setObject(value, forKey: key)
        configDic.write(toFile: userConfigFile as String, atomically: true)
    }
    
/********************************************************************************************************************************
    This function retrieves value for a specified key in the specified plist.
********************************************************************************************************************************/
    
    class func getValueForKey(plistItem:NSString, plistName:NSString)->AnyObject?{
        let plistFileName = (plistName as String) + ".plist"
        let cacheDir:NSString = Utilities.getDocumentPathForUser() as NSString
        let userConfigFile:NSString = cacheDir.appendingPathComponent(plistFileName) as NSString
        let configDic:NSMutableDictionary = NSMutableDictionary(contentsOfFile: userConfigFile as String)!
        let retVal: AnyObject? = configDic.value(forKey: plistItem as String) as AnyObject?
        return retVal
    }
    
/********************************************************************************************************************************
    This function clears value for specified key in the specified plist.
********************************************************************************************************************************/

    class func clearCachedValue(plistItem:NSString, plistName:NSString) {
        let plistFileName = (plistName as String) + ".plist"
        let cacheDir:NSString = Utilities.getDocumentPathForUser() as NSString
        let userConfigFile:NSString = cacheDir.appendingPathComponent(plistFileName) as NSString
        let configDic:NSMutableDictionary = NSMutableDictionary(contentsOfFile: userConfigFile as String)!
        configDic.removeObject(forKey: plistItem)
        configDic .write(toFile: userConfigFile as String, atomically: true)
    }
    
/********************************************************************************************************************************
    This function deletes older plist
********************************************************************************************************************************/

    class func deleteOldPlist(plistName: String) -> Bool {
        let filePath:String = Utilities.getDocumentPathForUser() + "/" + plistName + "." + "plist"
        let isOldPlistDeleted:Bool = CacheManager.deleteFileInPath(filePath: filePath)
        return isOldPlistDeleted
    }
    
    class func saveDataObjects(objects:AnyObject, fileName:NSString) {
        let cacheDir:NSString = Utilities.getDocumentPathForUser() as NSString
        let userConfigFile:NSString = cacheDir.appendingPathComponent(fileName as String) as NSString
        NSKeyedArchiver.archiveRootObject(objects, toFile: userConfigFile as String)
    }
    
    class func getDataObjects(fileName:NSString)->AnyObject? {
        let cacheDir:NSString = Utilities.getDocumentPathForUser() as NSString
        let userConfigFile:NSString = cacheDir.appendingPathComponent(fileName as String) as NSString
        let fetchData:AnyObject? = NSKeyedUnarchiver.unarchiveObject(withFile: userConfigFile as String) as AnyObject?
        return fetchData
    }
}

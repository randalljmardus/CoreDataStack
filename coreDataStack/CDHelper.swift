//
//  CDHelper.swift
//  coreDataStack
//
//  Created by Randall Mardus on 2/8/16.
//  Copyright © 2016 Randall Mardus. All rights reserved.
//

import Foundation
import CoreData

class CDHelper {
    
    lazy var storesDirectory: NSURL = {
        let fm = NSFileManager.defaultManager()
        
        let urls = fm.URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask)
        return urls[urls.count - 1] as NSURL
    }()
    
    lazy var localStoreURL: NSURL = {
        let url = self.storesDirectory.URLByAppendingPathComponent("CoreDataStack.sqlite")
        return url
    }()
    
    
    
    lazy var modelURL: NSURL = {
        let bundle = NSBundle.mainBundle()
        
        if let url = bundle.URLForResource("Model", withExtension: "momd") {
            return url
        }
        
        print("CRITICAL - Managed Object Model file not found")
        
        abort()
        
    }()
    
    lazy var model: NSManagedObjectModel = {
        return NSManagedObjectModel(contentsOfURL: self.modelURL)!
    }()
    
}
//
//  DataManager.swift
//  SlackCodingExercise
//
//  Created by akshay on 7/27/16.
//  Copyright © 2016 akshay. All rights reserved.
//

import Foundation
import SwiftyJSON
import CoreData

class DataManager: NSObject {
    
    class func saveMember(members:JSON){
        
        
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        let managedContext = appDelegate.managedObjectContext
        
        let memberEntity = NSEntityDescription.entityForName("Members", inManagedObjectContext: managedContext)
        
        let profileEntity = NSEntityDescription.entityForName("Profile", inManagedObjectContext: managedContext)
        
        //print(members)
        
        for memberIndex in 0..<members.count{
            
            
            
            let member = Member(entity: memberEntity!, insertIntoManagedObjectContext: managedContext)
            //print(members[memberIndex])
            
            let id = members[memberIndex]["id"].string
            
                member.id = id
                member.name = members[memberIndex]["name"].string
                member.team_id = members[memberIndex]["team_id"].string
                member.deleated = members[memberIndex]["deleated"].bool
                member.status = members[memberIndex]["status"].string
                member.color = members[memberIndex]["color"].string
                member.real_name = members[memberIndex]["real_name"].string
                member.tz = members[memberIndex]["tz"].string
                member.tz_label = members[memberIndex]["tz_label"].string
                member.tz_offset = members[memberIndex]["tz_offset"].string
                member.is_admin = members[memberIndex]["is_admin"].bool
                member.is_owner = members[memberIndex]["is_owner"].bool
                member.is_primary_owner = members[memberIndex]["is_primary_owner"].bool
                member.is_restricted = members[memberIndex]["is_restricted"].bool
                member.is_ultra_restricted = members[memberIndex]["is_ultra_restricted"].bool
                member.is_bot  = members[memberIndex]["is_bot"].bool
                member.has_2fa = members[memberIndex]["has_2fa"].bool
                // member.profile = members[memberIndex][""].string
                
                let profile = Profile(entity: profileEntity!, insertIntoManagedObjectContext: managedContext)
                
                
                print(members[memberIndex]["profile"]["title"])
                profile.first_name = members[memberIndex]["profile"]["first_name"].string
                profile.last_name = members[memberIndex]["profile"]["last_name"].string
                profile.title = members[memberIndex]["profile"]["title"].string
                profile.skype = members[memberIndex]["profile"]["skype"].string
                profile.phone = members[memberIndex]["profile"]["phone"].string
                profile.image_24 = members[memberIndex]["profile"]["image_24"].string
                profile.image_32 = members[memberIndex]["profile"]["image_32"].string
                profile.image_48 = members[memberIndex]["profile"]["image_48"].string
                profile.image_72 = members[memberIndex]["profile"]["image_72"].string
                profile.image_192 = members[memberIndex]["profile"]["image_192"].string
                profile.image_original = members[memberIndex]["profile"]["image_original"].string
                profile.avatar_hash = members[memberIndex]["profile"]["avatar_hash"].string
                profile.real_name_normalized = members[memberIndex]["profile"]["real_name_normalized"].string
                profile.email = members[memberIndex]["profile"]["email"].string
                
                //          profile.ofa = member
                
                member.hasA = profile
                
                
                do{
                    try managedContext.save()
                    
                    
                }
                catch{
                    print("error")
                }
        }
    }

    
    
    
}

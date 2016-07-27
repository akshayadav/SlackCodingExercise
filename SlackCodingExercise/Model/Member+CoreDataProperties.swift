//
//  Member+CoreDataProperties.swift
//  
//
//  Created by akshay on 7/27/16.
//
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Member {

    @NSManaged var id: String?
    @NSManaged var color: String?
    @NSManaged var deleated: NSNumber?
    @NSManaged var has_2fa: NSNumber?
    @NSManaged var is_admin: NSNumber?
    @NSManaged var is_bot: NSNumber?
    @NSManaged var is_owner: NSNumber?
    @NSManaged var is_primary_owner: NSNumber?
    @NSManaged var is_restricted: NSNumber?
    @NSManaged var is_ultra_restricted: NSNumber?
    @NSManaged var name: String?
    @NSManaged var real_name: String?
    @NSManaged var status: String?
    @NSManaged var team_id: String?
    @NSManaged var tz: String?
    @NSManaged var tz_label: String?
    @NSManaged var tz_offset: String?
    @NSManaged var hasA: Profile?

}

//
//  Profile+CoreDataProperties.swift
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

extension Profile {

    @NSManaged var avatar_hash: String?
    @NSManaged var email: String?
    @NSManaged var first_name: String?
    @NSManaged var image_24_URL: String?
    @NSManaged var image_24:NSData?
    @NSManaged var image_32_URL: String?
    @NSManaged var image_32:NSData?
    @NSManaged var image_48_URL: String?
    @NSManaged var image_48:NSData?
    @NSManaged var image_72_URL: String?
    @NSManaged var image_72:NSData?
    @NSManaged var image_192_URL: String?
    @NSManaged var image_192:NSData?
    @NSManaged var image_original: String?
    @NSManaged var last_name: String?
    @NSManaged var phone: String?
    @NSManaged var real_name_normalized: String?
    @NSManaged var skype: String?
    @NSManaged var title: String?
    @NSManaged var ofA: Member?

}

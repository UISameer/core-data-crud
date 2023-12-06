//
//  Employee+CoreDataProperties.swift
//  crudCoreData
//
//  Created by Sameer Personal on 12/6/23.
//
//

import Foundation
import CoreData


extension Employee {
    
    @nonobjc public class func fetchRequest() -> NSFetchRequest<Employee> {
        return NSFetchRequest<Employee>(entityName: "Employee")
    }
    
    @NSManaged public var email: String?
    @NSManaged public var id: UUID?
    @NSManaged public var name: String?
    @NSManaged public var profilePic: Data?
    
    func convertToEmployee() -> User
    {
        return User(name: self.name, email: self.email, profilePicture: self.profilePic, id: self.id!)
    }
    
}

extension Employee : Identifiable {
    
}

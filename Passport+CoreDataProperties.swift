import Foundation
import CoreData

extension Passport {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Passport> {
        return NSFetchRequest<Passport>(entityName: "Passport")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var passportId: String?
    @NSManaged public var placeOfIssue: String?
    @NSManaged public var toEmployee: Employee?
    
    func convertToUserPassport() -> UsersPassport
    {
        return UsersPassport(id: self.id!, passportId: self.passportId, placeOfIssue: self.placeOfIssue, name: self.toEmployee?.name)
    }

}

extension Passport : Identifiable {

}

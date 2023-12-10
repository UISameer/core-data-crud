import Foundation

class UsersPassport {
    let id: UUID
    let passportId, placeOfIssue, name: String?
    
    init(id: UUID, passportId: String?, placeOfIssue: String?, name: String?) {
        self.id = id
        self.passportId = passportId
        self.placeOfIssue = placeOfIssue
        self.name = name
    }
}

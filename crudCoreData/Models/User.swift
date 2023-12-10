import Foundation

struct User
{
    var name, email : String?
    var profilePicture: Data?
    let id: UUID
    var passport: UsersPassport?
    
    init(name: String? = nil, email: String? = nil, profilePicture: Data? = nil, id: UUID, passport: UsersPassport? = nil) {
        self.name = name
        self.email = email
        self.profilePicture = profilePicture
        self.id = id
        self.passport = passport
    }
}

import Foundation
import CoreData

protocol PassportRepository: BaseRepository {
    
}

struct PassportDataRepository: PassportRepository {
    
    typealias T = UsersPassport

    func create(record: UsersPassport) {
        
    }
    
    func getAll() -> [UsersPassport]? {
        
    }
    
    func get(byIdentifier id: UUID) -> UsersPassport? {
        <#code#>
    }
    
    func update(record: UsersPassport) -> Bool {
        <#code#>
    }
        
    func delete(record: T) -> Bool {
        <#code#>
    }
    
}

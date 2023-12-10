import Foundation
import CoreData

protocol EmployeeRepository: BaseRepository {
}

struct EmployeeDataRepository: EmployeeRepository {
    
    func create(record newEmployee: User) {
        
        let employee = Employee(context: PersistentStorage.shared.context)
        employee.email = newEmployee.email
        employee.name = newEmployee.name
        employee.id = newEmployee.id
        employee.profilePic = newEmployee.profilePicture
        
        // Save
        PersistentStorage.shared.saveContext()
    }
    
    func getAll() -> [User]? {
        
        let result = PersistentStorage.shared.fetchManagedObject(managedObject: Employee.self)
        
        var users : [User] = []
        
        result?.forEach({ (user) in
            users.append(user.convertToEmployee())
        })
        
        return users
    }
    
    func get(byIdentifier id: UUID) -> User? {
        
        let result = getEmployee(byIdentifier: id)
        guard result != nil else {return nil}
        return result?.convertToEmployee()
    }
    
    func update(record employee: User) -> Bool {
        let emp = getEmployee(byIdentifier: employee.id)
        guard emp != nil else {return false}
        
        emp?.email = employee.email
        emp?.name = employee.name
        emp?.profilePic = employee.profilePicture
        
        PersistentStorage.shared.saveContext()
        return true
    }
    
    func delete(record: User) -> Bool {
        
        let emp = getEmployee(byIdentifier: record.id)
        guard emp != nil else {return false}
        
        PersistentStorage.shared.context.delete(emp!)
        PersistentStorage.shared.saveContext()
        return true
    }
    
    
    private func getEmployee(byIdentifier id: UUID) -> Employee? {
        let fetchRequest = NSFetchRequest<Employee>(entityName: "Employee")
        let predicate = NSPredicate(format: "id==%@", id as CVarArg)
        fetchRequest.predicate = predicate
        do {
            let result = try PersistentStorage.shared.context.fetch(fetchRequest).first
            guard result != nil else {return nil}
            return result
        } catch let error {
            
            debugPrint(error.localizedDescription)
        }
        return nil
    }
}

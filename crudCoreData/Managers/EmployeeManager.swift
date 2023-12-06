import Foundation

struct EmployeeManager {
    
    private let employeeDataRepository = EmployeeDataRepository()
    
    func createEmployee(employee: User) {
        employeeDataRepository.create(newEmployee: employee)
    }
    
    func fetchEmployee() -> [User]? {
        return employeeDataRepository.getAll()
    }
    
    func fetchEmployee(by id: UUID) -> User? {
        return employeeDataRepository.get(byIdentifier: id)
    }
    
    func updateEmployee(employee: User) -> Bool {
        return employeeDataRepository.update(employee: employee)
    }
    
    func deleteEmployee(employee: User) -> Bool {
        return employeeDataRepository.delete(record: employee)
    }
}

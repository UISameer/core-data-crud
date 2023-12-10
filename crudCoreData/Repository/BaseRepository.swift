import Foundation

protocol BaseRepository {
    associatedtype T
    func create(record: T)
    func getAll() -> [T]?
    func get(byIdentifier id: UUID) -> T?
    func update(record: T) -> Bool
    func delete(record: T) -> Bool
}

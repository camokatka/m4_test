import Foundation

struct Task {
    let taskName: String
    var subTask: [SubTask]
    var isOpen: Bool = false
    var isChecked: Bool = false
}

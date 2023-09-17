
import UIKit

class ViewController: UIViewController {
    
    let cellID = "cell"
    let cellIDSub = "subcell"
    
    
    let mainTableView = MakerView.shared.makeTableView()
    
    var tasks: [Task] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        mainTableView.dataSource = self
        mainTableView.delegate = self
        mainTableView.register(TableViewCell.self, forCellReuseIdentifier: cellID)
        mainTableView.register(SubTableViewCell.self, forCellReuseIdentifier: cellIDSub)
        setData()
        initUI()
        
        }
    
    func setData() {
        
        tasks = [
            Task(taskName: "Learning UI/UX", subTask: []),
            Task(taskName: "Homework", subTask: [SubTask(subTaskName: "Sport"),
                                                SubTask(subTaskName: "Mathematics"),
                                                SubTask(subTaskName: "Science")]),
            Task(taskName: "Read a book", subTask: []),
            Task(taskName: "Hangout with friends", subTask: []),
            Task(taskName: "Exercise", subTask: [SubTask(subTaskName: "Running"),
                                                 SubTask(subTaskName: "Swimming"),
                                                 SubTask(subTaskName: "Bike")]),
            Task(taskName: "Play a game", subTask: [SubTask(subTaskName: "Monopoly"),
                                                    SubTask(subTaskName: "UNO")])
                 ]
        
    }

    private func initUI() {
        
        view.backgroundColor = .white
        
        view.addSubview(mainTableView)
        mainTableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            mainTableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            mainTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50),
            mainTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mainTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
    }
    

}

extension ViewController: UITableViewDataSource {
    

    func numberOfSections(in tableView: UITableView) -> Int {
        tasks.count
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        
        if !tasks[section].isOpen {
            return 1
        } else {
            return tasks[section].subTask.count + 1
        }
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
 

        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! TableViewCell
            cell.setTask(t: tasks[indexPath.section])
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: cellIDSub, for: indexPath) as! SubTableViewCell
            cell.setSubTask(st: tasks[indexPath.section].subTask[indexPath.row - 1])
            return cell
        }
            
    }
        
}
    

 

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        var count = 0
        
        if indexPath.row == 0 {
            if tasks[indexPath.section].subTask.count != 0 {
                tasks[indexPath.section].isOpen = !tasks[indexPath.section].isOpen
            } else {
                tasks[indexPath.section].isChecked = !tasks[indexPath.section].isChecked
            }
            
            tableView.reloadData()
            
        } else {
            tasks[indexPath.section].subTask[indexPath.row - 1].isChecked = !tasks[indexPath.section].subTask[indexPath.row - 1].isChecked
            tableView.reloadData()
        }
        
        for item in tasks[indexPath.section].subTask {
            if item.isChecked {
                count += 1
            }
        }
        
        if count == tasks[indexPath.section].subTask.count {
            if count != 0 {
                tasks[indexPath.section].isChecked = true
                tableView.reloadData()
            }
        } else {
            tasks[indexPath.section].isChecked = false
            tableView.reloadData()
        }
        
    
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = .white
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        6
    }
}

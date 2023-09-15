
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
            mainTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            mainTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
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
        
        var cell = mainTableView.dequeueReusableCell(withIdentifier: cellIDSub, for: indexPath) as! SubTableViewCell

        if indexPath.row == 0 {
            cell = mainTableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! TableViewCell
        }
        
//        let cell = mainTableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! TableViewCell
        
        cell.cellArr.isHidden = true
        cell.cellCheck.isHidden = true

        
        if indexPath.row == 0 {
            
            if tasks[indexPath.section].isOpen {
                cell.cellArr.image = UIImageView(image: UIImage(systemName: "chevron.down")).image
            } else {
                cell.cellArr.image = UIImageView(image: UIImage(systemName: "chevron.right")).image
            }
            
            if tasks[indexPath.section].isChecked {
                cell.cellCheck.isHidden = false
            }
            
            cell.cellLabel.text = tasks[indexPath.section].taskName
            
            if tasks[indexPath.section].subTask.count != 0 {
                cell.cellArr.isHidden = false
            } else {
                cell.cellArr.isHidden = true
            }
            
        } else {
            
            cell.cellLabel.text = tasks[indexPath.section].subTask[indexPath.row - 1].subTaskName
            if tasks[indexPath.section].subTask[indexPath.row - 1].isChecked {
                cell.cellCheck.isHidden = false
            }
            
        }
        

        
        return cell
    }
    
}
 

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        var count = 0
        
        if indexPath.row == 0 {
            tasks[indexPath.section].isOpen = !tasks[indexPath.section].isOpen
            tableView.reloadData()
            
        }
        
        if indexPath.row != 0 {
            tasks[indexPath.section].subTask[indexPath.row - 1].isChecked = !tasks[indexPath.section].subTask[indexPath.row - 1].isChecked
            tableView.reloadData()
        }
        
        for i in 0...tasks[indexPath.section].subTask.count - 1 {
            if tasks[indexPath.section].subTask[i].isChecked {
                count += 1
            }
        }
        
        if count == tasks[indexPath.section].subTask.count {
            tasks[indexPath.section].isChecked = true
            tableView.reloadData()
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

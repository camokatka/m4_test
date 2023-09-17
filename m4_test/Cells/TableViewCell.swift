

import UIKit

class TableViewCell: UITableViewCell {
    
    var cellArr = MakerView.shared.makeImage()
    
    let cellView = MakerView.shared.makeCellVIew()

    var cellLabel = MakerView.shared.makeCellLabel()
    
    let cellImage = MakerView.shared.makeImage()
    
    let cellCheck = MakerView.shared.makeButton()
    
    


    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super .init(style: style, reuseIdentifier: reuseIdentifier)
        
        initCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initCell() {

        contentView.addSubview(cellView)
        cellView.translatesAutoresizingMaskIntoConstraints = false
        cellView.backgroundColor = UIColor(cgColor: Constants.bgdColor)
        
        NSLayoutConstraint.activate([
            cellView.topAnchor.constraint(equalTo: contentView.topAnchor),
            cellView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            cellView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            cellView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20)
        ])
        
        cellView.addSubview(cellArr)
        
        cellArr.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            cellArr.widthAnchor.constraint(equalToConstant: 20),
            cellArr.topAnchor.constraint(equalTo: cellView.topAnchor, constant: 10),
            cellArr.bottomAnchor.constraint(equalTo: cellView.bottomAnchor, constant: -10),
            cellArr.leadingAnchor.constraint(equalTo: cellView.leadingAnchor, constant: 10)
        ])
        
        
        cellView.addSubview(cellImage)
        
        cellImage.translatesAutoresizingMaskIntoConstraints = false
        cellImage.image = UIImage(named: "square")
        NSLayoutConstraint.activate([
            cellImage.topAnchor.constraint(equalTo: cellView.topAnchor, constant: 10),
            cellImage.bottomAnchor.constraint(equalTo: cellView.bottomAnchor, constant: -10),
            cellImage.leadingAnchor.constraint(equalTo: cellArr.trailingAnchor, constant: 10)
        ])
        
        cellImage.addSubview(cellCheck)
        cellCheck.setBackgroundImage(UIImage(systemName: "checkmark"), for: .normal)
        cellCheck.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            cellCheck.leadingAnchor.constraint(equalTo: cellImage.leadingAnchor),
            cellCheck.topAnchor.constraint(equalTo: cellImage.topAnchor),
            cellCheck.bottomAnchor.constraint(equalTo: cellImage.bottomAnchor),
            cellCheck.trailingAnchor.constraint(equalTo: cellImage.trailingAnchor)
        ])
        
        cellView.addSubview(cellLabel)
        
        cellLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            cellLabel.topAnchor.constraint(equalTo: cellView.topAnchor, constant: 10),
            cellLabel.bottomAnchor.constraint(equalTo: cellView.bottomAnchor, constant: -10),
            cellLabel.leadingAnchor.constraint(equalTo: cellImage.trailingAnchor, constant: 5),
        ])
        
    }
    
    func setTask(t : Task) {
        cellArr.isHidden = true
        cellCheck.isHidden = true
        
        if t.isOpen {
            cellArr.image = UIImageView(image: UIImage(systemName: "chevron.down")).image
            cellView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        } else {
            cellArr.image = UIImageView(image: UIImage(systemName: "chevron.right")).image
            cellView.layer.cornerRadius = 12
        }
        
        if t.isChecked {
            cellCheck.isHidden = false
        }
        
        cellLabel.text = t.taskName
        
        if t.subTask.count != 0 {
            cellArr.isHidden = false
        } else {
            cellArr.isHidden = true
        }
    }
}

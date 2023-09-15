

import UIKit

class TableViewCell: UITableViewCell {
    
    var cellArr_ = UIView()
    
    var cellArr = UIImageView()
    
    let cellView = MakerView.shared.makeCellVIew()

    var cellLabel = MakerView.shared.makeCellLabel()
    
    let cellImage = UIImageView(image: UIImage(named: "square"))
    
    let cellCheck = UIButton()
    
    


    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super .init(style: style, reuseIdentifier: reuseIdentifier)
        
        initCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initCell() {
        
        contentView.backgroundColor = UIColor(cgColor: Constants.bgdColor)

        
        contentView.addSubview(cellView)
        cellView.translatesAutoresizingMaskIntoConstraints = false

        
        NSLayoutConstraint.activate([

            cellView.topAnchor.constraint(equalTo: contentView.topAnchor),
            cellView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            cellView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            cellView.trailingAnchor.constraint(equalTo: contentView.leadingAnchor)
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
}

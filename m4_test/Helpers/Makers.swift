
import UIKit

class MakerView {
    
    static let shared = MakerView()
    
    func makeLabel (text: String = "",
                    textColor: UIColor = .black,
                    font: UIFont = .systemFont(ofSize: 18, weight: .regular),
                    numberOfLines: Int = 0,
                    lineBreakMode: NSLineBreakMode = .byWordWrapping,
                    shadowColor: UIColor = .clear,
                    shadowOffset: CGSize = CGSize(width: 0, height: 0),
                    opacity: Float = 1.0,
                    borderwidth: CGFloat = 0,
                    bordercolor: UIColor = .clear ) -> UILabel
    {
        let label = UILabel()
        label.text = text
        label.textColor = textColor
        label.font = font
        label.numberOfLines = numberOfLines
        label.lineBreakMode = lineBreakMode
        label.shadowColor = shadowColor
        label.shadowOffset = shadowOffset
        label.layer.opacity = opacity
        label.layer.borderWidth = borderwidth
        label.layer.borderColor = bordercolor.cgColor
        return label
    }
    
    func makeTableView (
        separator: UITableViewCell.SeparatorStyle = .none
                        ) -> UITableView
    {
        let tv = UITableView()
        tv.separatorStyle = separator
        return tv
    }
    
    func makeCellLabel (textColor: UIColor = .black,
                        font: UIFont = .boldSystemFont(ofSize: 18)
                        ) -> UILabel
    {
        let lb = UILabel()
        lb.textColor = textColor
        lb.font = font
        return lb
    }
    
    func makeCellVIew (corners: CGFloat = 12
                        ) -> UIView
    {
        let view = UIView()
        view.layer.cornerRadius = corners
        return view
    }
    
}

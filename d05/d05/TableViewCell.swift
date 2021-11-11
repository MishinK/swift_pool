//
//  TableViewCell.swift
//  d05
//
//  Created by Константин Мишин on 28.09.2021.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var Label: UILabel!
    
    var listData: (String, Double, Double, String)? {
        didSet {
            if let l = listData {
                Label.text = l.0
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

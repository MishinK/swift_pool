//
//  TableViewCell.swift
//  d09
//
//  Created by Константин Мишин on 02.10.2021.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var title: UILabel!
   
    @IBOutlet weak var imageart: UIImageView!
    
    @IBOutlet weak var content: UILabel!
    @IBOutlet weak var modification: UILabel!
    @IBOutlet weak var creation: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

//
//  DeathTableViewCell.swift
//  d02
//
//  Created by Константин Мишин on 23.09.2021.
//

import UIKit

class DeathTableViewCell: UITableViewCell {
    
    @IBOutlet weak var NameLabel: UILabel!
    @IBOutlet weak var DescriptionLabal: UILabel!
    @IBOutlet weak var DateLabel: UILabel!
    
    var DeathTable : (String, String, String)? {
        didSet {
            if let note = DeathTable {
                NameLabel?.text = note.0
                DescriptionLabal?.text = note.1
                DateLabel?.text = note.2
            }
        }
    }
}

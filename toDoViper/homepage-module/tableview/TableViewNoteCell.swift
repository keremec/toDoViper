//
//  TableViewNoteCell.swift
//  toDoViper
//
//  Created by Kerem Safa Dirican on 28.08.2022.
//

import UIKit

class TableViewNoteCell: UITableViewCell {
    
    
    
    @IBOutlet weak var noteLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    
    @IBAction func noteButtonAction(_ sender: Any) {
    }
    
}

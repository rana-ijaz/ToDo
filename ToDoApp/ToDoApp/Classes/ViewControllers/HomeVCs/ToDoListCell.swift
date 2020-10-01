//
//  ToDoListCell.swift
//  ToDoApp
//
//  Created by Ijaz on 30/09/2020.
//

import UIKit

class ToDoListCell: UITableViewCell {

    @IBOutlet weak var toDoLbl: UILabel!
    @IBOutlet weak var checkBoxBtn: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

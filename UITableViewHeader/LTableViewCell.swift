//
//  LTableViewCell.swift
//  UITableViewHeader
//
//  Created by Anderson Caxias on 13/06/15.
//  Copyright (c) 2015 Anderson Caxias. All rights reserved.
//

import UIKit

class LTableViewCell: UITableViewCell {

    @IBOutlet weak var label: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

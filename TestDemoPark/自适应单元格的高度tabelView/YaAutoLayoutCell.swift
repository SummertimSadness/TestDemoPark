//
//  YaAutoLayoutCell.swift
//  TestDemoPark
//
//  Created by ss on 15/10/9.
//  Copyright © 2015年 Yasin. All rights reserved.
//

import UIKit

class YaAutoLayoutCell: UITableViewCell {
    
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var introLabel: UILabel!
    
    var model:YaAutoLayoutCellModel? {
        didSet{
//            if newValue != nil {
//                updateView()
//            }
            
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func updateView() {
        if model != nil {
            imgView.sd_setImageWithURL(NSURL(string: model!.img))
            introLabel.text = model!.intro
        }
    }
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

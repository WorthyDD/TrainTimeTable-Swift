//
//  TableCell.swift
//  TrainTimetable1.0
//
//  Created by 武淅 段 on 2016/11/6.
//  Copyright © 2016年 武淅 段. All rights reserved.
//

import UIKit

class TableCell: UITableViewCell {

    
    @IBOutlet weak var codeLabel: UILabel!
    
    @IBOutlet weak var startTimeLabel: UILabel!
    
    @IBOutlet weak var stationLabel: UILabel!
    
    @IBOutlet weak var useDateLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func updateCellWithData(data : TimeTable){
        
        codeLabel.text = "\(data.trainCode!)次"
        startTimeLabel.text = "\(data.startTime!)开"
        stationLabel.text = "\(data.startStation!) - \(data.arriveStation!)"
        useDateLabel.text = "用时: \(data.useDate!)"
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

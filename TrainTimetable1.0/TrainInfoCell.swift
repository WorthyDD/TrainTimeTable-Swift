//
//  TrainInfoCell.swift
//  TrainTimetable1.0
//
//  Created by 武淅 段 on 2016/11/6.
//  Copyright © 2016年 武淅 段. All rights reserved.
//

import UIKit

class TrainInfoCell: UITableViewCell {

    @IBOutlet weak var stationLabel: UILabel!
    
    @IBOutlet weak var startTimeLabel: UILabel!
    
    @IBOutlet weak var arriveTimeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func updateCellWithData(data: TrainInfo){
        
        stationLabel.text = data.station!
        startTimeLabel.text = data.startTime!
        arriveTimeLabel.text = data.arriveTime!
    }

}

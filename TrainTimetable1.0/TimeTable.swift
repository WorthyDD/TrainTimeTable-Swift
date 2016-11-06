//
//  TimeTable.swift
//  TrainTimetable1.0
//
//  Created by 武淅 段 on 2016/11/6.
//  Copyright © 2016年 武淅 段. All rights reserved.
//

import UIKit

class TimeTable: NSObject {

    var trainCode : String! = ""
    var startStation : String!
    var arriveStation : String!
    var firstStation : String!
    var lastStation : String!
    var startTime : String!
    var arriveTime : String!
    var useDate : String!
    
    func printTimetable(){
        print("traincode: \(trainCode!)\nstartStation: \(startStation!)\narriveStation: \(arriveStation!)\nstartTime: \(startTime!)\narriveTime: \(arriveTime!)\nuseDate: \(useDate!)\n")
    }
}

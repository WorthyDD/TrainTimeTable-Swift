//
//  TimeTableParser.swift
//  TrainTimetable1.0
//
//  Created by 武淅 段 on 2016/11/6.
//  Copyright © 2016年 武淅 段. All rights reserved.
//

import UIKit
import Foundation
class TimeTableParser: NSObject, XMLParserDelegate{

    var timetableArr : Array<TimeTable> = []
    
    var currentValue : String! = ""
    var trainCode : String! = ""
    var startStation : String! = ""
    var arriveStation : String! = ""
    var startTime : String! = ""
    var arriveTime : String! = ""
    var useDate : String! = ""
    
    var isTimeTable : Bool = false
    
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
        
        if elementName == "TimeTable"{
            isTimeTable = true
        }
    }
    
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        
        if isTimeTable == true{
            if elementName == "TrainCode"{
                trainCode = currentValue!
            }
            else if elementName == "StartStation"{
                startStation = currentValue!
            }
            else if elementName == "ArriveStation"{
                arriveStation = currentValue!
            }
            else if elementName == "StartTime"{
                startTime = currentValue!
            }
            else if elementName == "ArriveTime"{
                arriveTime = currentValue!
            }
            else if elementName == "UseDate"{
                useDate = currentValue!
            }
            else if elementName == "TimeTable"{
                let timeTable : TimeTable! = TimeTable()
                timeTable.trainCode = trainCode!
                timeTable.startStation = startStation!
                timeTable.arriveStation = arriveStation!
                timeTable.startTime = startTime!
                timeTable.arriveTime = arriveTime!
                timeTable.useDate = useDate!
                timetableArr.append(timeTable)
                isTimeTable = false
            }
        }
    }
    
    func parser(_ parser: XMLParser, foundCharacters string: String) {
        
        let str = string.trimmingCharacters(in: NSCharacterSet.whitespacesAndNewlines)
        currentValue = str 
    }
    
    func parser(_ parser: XMLParser, parseErrorOccurred parseError: Error) {
        print("解析错误")
    }
    

    
}

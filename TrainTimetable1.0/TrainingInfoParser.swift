//
//  TrainingInfoParser.swift
//  TrainTimetable1.0
//
//  Created by 武淅 段 on 2016/11/6.
//  Copyright © 2016年 武淅 段. All rights reserved.
//

import UIKit
import Foundation

class TrainingInfoParser: NSObject , XMLParserDelegate{

    var trainInfoArr : Array<TrainInfo> = []
    
    var currentValue : String! = ""
    var trainStation : String! = ""
    var startTime : String! = ""
    var arriveTime : String! = ""
    
    var isTrainStation : Bool = false
    
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
        
        if elementName == "TrainDetailInfo"{
            isTrainStation = true
        }
    }
    
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        
        if isTrainStation == true{
            if elementName == "TrainStation"{
                trainStation = currentValue!
            }
            else if elementName == "StartTime"{
                startTime = currentValue!
            }
            else if elementName == "ArriveTime"{
                arriveTime = currentValue!
            }
            else if elementName == "TrainDetailInfo"{
                let trainInfo : TrainInfo = TrainInfo()
                
                trainInfo.station = trainStation
                trainInfo.startTime = startTime
                trainInfo.arriveTime = arriveTime
                trainInfoArr.append(trainInfo)
                isTrainStation = false
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

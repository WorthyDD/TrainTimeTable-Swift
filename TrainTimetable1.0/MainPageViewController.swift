//
//  MainPageViewController.swift
//  TrainTimetable1.0
//
//  Created by 武淅 段 on 2016/11/6.
//  Copyright © 2016年 武淅 段. All rights reserved.
//

import UIKit
import Alamofire
import Toast_Swift
import Foundation


let baseUrl = "http://cors.itxti.net/?"


class MainPageViewController: UIViewController, XMLParserDelegate{

    @IBOutlet weak var startStationField: UITextField!
    
    @IBOutlet weak var destStationField: UITextField!
    
    @IBOutlet weak var trainNumField: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
    }


    @IBAction func tapSearch(_ sender: BaseButton) {
        
        let start = startStationField.text
        let dest = destStationField.text
//        let num = trainNumField.text
        
        var urlStr = ""
        var params : Dictionary<String, String> = [:];
        if trainNumField.text!.characters.count > 0{
            urlStr = baseUrl+"www.webxml.com.cn/WebServices/TrainTimeWebService.asmx/getStationAndTimeDataSetByLikeTrainCode?"
            params = ["UserID" : "",
                      "TrainCode" : trainNumField.text!]
        }
        else{
            urlStr = baseUrl+"www.webxml.com.cn/WebServices/TrainTimeWebService.asmx/getStationAndTimeByStationName?"
            params = ["UserID" : "",
                      "StartStation" : start as String!,
                      "ArriveStation" : dest as String!]
        }
        
        MBProgressHUD.showAdded(to: self.view, animated: true)
        Alamofire.request(urlStr, method: .get, parameters: params).responseString { (response) in
            
           print("result-->\(response.result.value)")
            MBProgressHUD.hide(for: self.view, animated: true)
            if response.result.value != nil{
                let delegate = TimeTableParser()
                let parser = XMLParser(data: response.data!)
                parser.delegate = delegate
                parser.parse()
                
                for t in delegate.timetableArr{
                    t.printTimetable()
                }
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "TimeTableListController") as! TimeTableListController
                vc.timeTableArr = delegate.timetableArr
                self.navigationController?.pushViewController(vc, animated: true)
            }
        }
        
        
//        let delegate = TimeTableParser()
//        let parser = XMLParser(contentsOf: URL(fileURLWithPath: Bundle.main.path(forResource: "data", ofType: "xml")!))!
//        parser.delegate = delegate
//        parser.parse()
        
        
//        for t in delegate.timetableArr{
//            t.printTimetable()
//        }
        
//        let vc = self.storyboard?.instantiateViewController(withIdentifier: "TimeTableListController") as! TimeTableListController
//        vc.timeTableArr = delegate.timetableArr
//        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
        
}

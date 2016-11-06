//
//  TimeTableListController.swift
//  TrainTimetable1.0
//
//  Created by 武淅 段 on 2016/11/6.
//  Copyright © 2016年 武淅 段. All rights reserved.
//

import UIKit

class TimeTableListController: UIViewController, UITableViewDataSource, UITableViewDelegate{

    var timeTableArr : Array<TimeTable> = []
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return timeTableArr.count
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 15
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 10
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! TableCell
        let data = timeTableArr[indexPath.row]
        cell.updateCellWithData(data: data)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "TrainInfoController") as! TrainInfoController
        let data = timeTableArr[indexPath.row]
        vc.trainCode = data.trainCode
        self.navigationController?.pushViewController(vc, animated: true)
    }

}

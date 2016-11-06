//
//  TrainInfoController.swift
//  TrainTimetable1.0
//
//  Created by 武淅 段 on 2016/11/6.
//  Copyright © 2016年 武淅 段. All rights reserved.
//

import UIKit
import Foundation

class TrainInfoController: UIViewController, UITableViewDataSource, UITableViewDelegate{

    var trainCode : String!
    var trainInfoArr : Array<TrainInfo> = []
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        let label  = UILabel(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 60))
        label.text = "\n\n    \(trainCode!)次"
        label.numberOfLines = 0
        label.font = UIFont.boldSystemFont(ofSize: 20)
        tableView.tableHeaderView = label
        tableView.backgroundColor = UIColor.white
        let delegate = TrainingInfoParser()
        let parser = XMLParser(contentsOf: URL(fileURLWithPath: Bundle.main.path(forResource: "data2", ofType: "xml")!))!
        parser.delegate = delegate
        parser.parse()
        
        
        trainInfoArr = delegate.trainInfoArr
        tableView.reloadData()
        
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return trainInfoArr.count
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.1
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 10
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! TrainInfoCell
        let data = trainInfoArr[indexPath.row]
        cell.updateCellWithData(data: data)
        return cell
    }
    
}

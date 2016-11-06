//
//  BaseButton.swift
//  TrainTimetable1.0
//
//  Created by 武淅 段 on 2016/11/6.
//  Copyright © 2016年 武淅 段. All rights reserved.
//

import UIKit

class BaseButton: UIButton {

    @IBInspectable var cornerRadius : CGFloat = 0.0{
        
        didSet{
            layer.cornerRadius = cornerRadius
            layer.masksToBounds = true
        }
    }
    
    @IBInspectable var borderWidth : CGFloat = 0.0{
        didSet{
            layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable var borderColor : UIColor = UIColor(){
        didSet{
            layer.borderColor = borderColor.cgColor
        }
    }
}

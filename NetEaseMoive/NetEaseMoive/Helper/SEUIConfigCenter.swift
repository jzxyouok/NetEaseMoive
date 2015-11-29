//
//  SEUIConfigCenter.swift
//  NetEaseMoive
//
//  Created by ftxbird on 15/11/29.
//  Copyright © 2015年 swiftMe. All rights reserved.
//

import Foundation
import UIKit

class SEUIConfigCenter {
    
    let appFontDefaultColor = UIColor(red:0.9, green:0.44, blue:0.23, alpha:1)
    
    class var sharedCenter : SEUIConfigCenter {
        struct Static {
            static var onceToken : dispatch_once_t = 0
            static var sharedCenter : SEUIConfigCenter? = nil
        }
        dispatch_once(&Static.onceToken) {
            Static.sharedCenter = SEUIConfigCenter()
        }
        return Static.sharedCenter!
    }
    
    
    
    
    
    
    
    
}
//
//  Logger.swift
//  tictactoe
//
//  Created by David Askew on 9/25/16.
//  Copyright © 2016 David Askew. All rights reserved.
//

import Foundation

class Logger
{
    static func LogStart(type: Any, _ function: String = #function, _ message: String = "Start")
    {
        Log(type,function,message)
    }
    
    static func LogEnd(type: Any, _ function: String = #function, _ message: String = "End")
    {
        Log(type,function,message)
    }
    
    static func Log(type: Any, _ function: String = #function, _ message: String = "")
    {
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy HH:mm:ss:SSS"
        
        var date: String { return dateFormatter.stringFromDate(NSDate())}
        
        print("\(date) - \(String(type)) - \(function) : \(message)")
    }
}


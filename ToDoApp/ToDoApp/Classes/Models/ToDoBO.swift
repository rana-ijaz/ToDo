//
//  ToDoBO.swift
//  ToDoApp
//
//  Created by Ijaz on 30/09/2020.
//

import UIKit

class ToDoBO: NSObject, NSCoding {
    
    var task : String?
    var isCompleted : Bool?
    
    init(task: String, isCompleted: Bool) {
    
        self.task = task
        self.isCompleted = isCompleted
    }
    
    // MARK: NSCoding
    required init(coder decoder: NSCoder) {
        self.task = decoder.decodeObject(forKey: Strings.TASK_KEY) as? String
        self.isCompleted = decoder.decodeObject(forKey: Strings.IS_COMPLETED_KEY) as? Bool
    }
    
    public func encode(with coder: NSCoder) {
        coder.encode(self.task, forKey: Strings.TASK_KEY)
        coder.encode(self.isCompleted, forKey: Strings.IS_COMPLETED_KEY)
    }
}


//
//  ToDoManager.swift
//  ToDoApp
//
//  Created by Ijaz on 01/10/2020.
//

import UIKit

class ToDoManager: NSObject {
    
    var toDoArr: [ToDoBO] = []
    static let shared = ToDoManager()
    private override init() {
    }
    
    // MARK: Set a model
    func setToDoArr(newToDoArr: [ToDoBO]) {
        self.toDoArr = newToDoArr
        
        print(self.pathForToDo())
        NSKeyedArchiver.archiveRootObject(self.toDoArr, toFile: pathForToDo())
    }
    // MARK: Return a model
    func getToDoArr() -> [ToDoBO] {
        readToDoArr()
        return self.toDoArr
    }
    
    func readToDoArr() {
        print(self.pathForToDo())
        let toDoModelArr: [ToDoBO]? = NSKeyedUnarchiver.unarchiveObject(withFile: self.pathForToDo()) as? [ToDoBO]
        if toDoModelArr != nil {
            self.toDoArr = toDoModelArr!
        }
    }
    
    // MARK: Helper method
    func pathForToDo() -> String {
        let documentsPath = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true).first
        let path = documentsPath?.appending("/toDo")
        return path!
    }
    
}

//
//  ToDoVC.swift
//  ToDoApp
//
//  Created by Ijaz on 30/09/2020.
//

import UIKit

class ToDoVC: UIViewController {
    
    @IBOutlet weak var toDoTxtView: UITextView!
    
    var isUpdate = false
    var selectedIndex = 0
    var toDosArr: [ToDoBO] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        toDosArr = ToDoManager.shared.getToDoArr()
        
        if isUpdate {
            let toDoBO = toDosArr[selectedIndex]
            toDoTxtView.text = toDoBO.task
        }
        else{
            toDoTxtView.becomeFirstResponder()
        }
    }
    
    // MARK: - IBAction methods
    @IBAction func backBtnClicked(_ sender: Any){
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func doneBtnClicked(_ sender: Any){
        
        if (toDoTxtView.text != "" && toDoTxtView.text != nil) {
            setToDo()
        }
        self.navigationController?.popViewController(animated: true)
    }
    
    // MARK: - Helper methods
    func setToDo(){
        
        let toDoBO = ToDoBO(task: toDoTxtView.text, isCompleted: false) // Remove check mark if already completed
        if isUpdate {
            toDosArr.remove(at: selectedIndex)
        }
        toDosArr.insert(toDoBO, at: 0) // To show most recent edit at top
        
        // To in Coredata call DBController
        // ....
        
        // Store in File
        ToDoManager.shared.setToDoArr(newToDoArr: toDosArr)
        
        // Sync with backend server via APIs
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

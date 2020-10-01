//
//  ToDoListVC.swift
//  ToDoApp
//
//  Created by Ijaz on 30/09/2020.
//

import UIKit

class ToDoListVC: UIViewController {
    
    @IBOutlet weak var tblToDos: UITableView!
    var toDosArr: [ToDoBO] = []

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        toDosArr = ToDoManager.shared.getToDoArr()
        tblToDos.reloadData()
    }

}

extension ToDoListVC: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDosArr.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoListCell", for: indexPath) as! ToDoListCell
        
        let toDoBo = toDosArr[indexPath.row]
        cell.toDoLbl.text = toDoBo.task!
        
        cell.checkBoxBtn.tag = indexPath.row
        cell.checkBoxBtn.addTarget(self, action: #selector(checkBoxBtnClicked), for: .touchUpInside)
        
        if (toDoBo.isCompleted)! {
            cell.checkBoxBtn.setImage(UIImage(named: "check"), for: .normal)
        }
        else{
            cell.checkBoxBtn.setImage(UIImage(named: "uncheck"), for: .normal)
        }
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: StoryboardNames.MAIN, bundle: Bundle.main)
        let toDoVC = storyboard.instantiateViewController(withIdentifier: ViewControllerIdentifiers.ToDoVC) as! ToDoVC
        toDoVC.isUpdate = true
        toDoVC.selectedIndex = indexPath.row
        self.navigationController?.pushViewController(toDoVC, animated: true)
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete
        {
            toDosArr.remove(at: indexPath.row)
            self.tblToDos.reloadData()
            
            var toDoArrForFile = ToDoManager.shared.getToDoArr()
            toDoArrForFile.remove(at: indexPath.row)
            ToDoManager.shared.setToDoArr(newToDoArr: toDoArrForFile)
        }
    }
    
    @objc func checkBoxBtnClicked(sender: UIButton){ // USE THIS.
        if sender.currentImage == UIImage(named: "check") {
            sender.setImage(UIImage(named: "uncheck"), for: .normal)
            
            let toDoOBNew = toDosArr[sender.tag]
            toDoOBNew.isCompleted = false
            toDosArr[sender.tag] = toDoOBNew
            ToDoManager.shared.setToDoArr(newToDoArr: toDosArr)
        }
        else {
            sender.setImage(UIImage(named: "check"), for: .normal)
            
            let toDoBONew = toDosArr[sender.tag]
            toDoBONew.isCompleted = true
            toDosArr[sender.tag] = toDoBONew
            ToDoManager.shared.setToDoArr(newToDoArr: toDosArr)
        }
    }
}

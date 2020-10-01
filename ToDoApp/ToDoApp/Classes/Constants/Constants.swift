//
//  ToDoListVC.swift
//  ToDoApp
//
//  Created by Ijaz on 30/09/2020.
//


import Foundation
import UIKit

struct AppColors {
    
    static let White = UIColor.white
    static let Blue = UIColor(red: 57/255.0, green: 176/255.0, blue: 206/255.0, alpha: 1)
}

struct ViewControllerIdentifiers
{
    static let ToDoVC = "ToDoVC"
    static let ToDoListVC = "ToDoListVC"
    
}

/** All constants related to api's */
struct APIConstants
{
    
    static let BASEURL = ""
    
    static let auth_user = ""
    static let auth_password = ""
    
    static let login = BASEURL + "login"

}

struct StoryboardNames
{
    static let MAIN = "Main"
    static let PROFILE = "Profile"
}

struct Strings{
    static let TASK_KEY = "task"
    static let IS_COMPLETED_KEY = "isCompleted"
    
}

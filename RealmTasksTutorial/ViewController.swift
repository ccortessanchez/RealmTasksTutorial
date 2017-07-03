//
//  ViewController.swift
//  RealmTasksTutorial
//
//  Created by User01 on 03/07/17.
//  Copyright © 2017 User01. All rights reserved.
//

import UIKit
import RealmSwift

//MARK: Model

final class TaskList: Object {
    dynamic var text = ""
    dynamic var id = ""
    let items = List<Task>()
    
    override static func primaryKey() -> String {
        return "id"
    }
}

final class Task: Object {
    dynamic var text = ""
    dynamic var completed = false
}

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        title = "My Tasks"
    }

}


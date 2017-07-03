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

class ViewController: UITableViewController {
    
    var items = List<Task>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        items.append(Task(value: ["text":"My first task"]))
    }
    
    func setupUI() {
        title = "My Tasks"
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    //MARK: UITableView
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let item = items[indexPath.row]
        cell.textLabel?.text = item.text
        cell.textLabel?.alpha = item.completed ? 0.5:1
        return cell
    }

}


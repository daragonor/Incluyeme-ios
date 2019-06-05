//
//  ScheduleViewController.swift
//  Incluyeme
//
//  Created by Developer on 6/3/19.
//  Copyright © 2019 Developer. All rights reserved.
//

import UIKit

class ScheduleViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var classes: [ScheduleClassesResponse] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "BaseAlterTableViewCell", bundle: nil), forCellReuseIdentifier: "BaseAlterTableViewCell")
        tableView.delegate = self
        tableView.dataSource = self
        //tableView.allowsSelection = true
    }
    
    @IBAction func backAction(_ sender: Any) {
        self.dismiss(animated: false, completion: nil)
    }
}

extension ScheduleViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let height = self.view.safeAreaLayoutGuide.layoutFrame.size.height
        return height*0.125
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return classes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell  = tableView.dequeueReusableCell(withIdentifier: "BaseAlterTableViewCell", for: indexPath) as! BaseTableViewCell
        let className = classes[indexPath.row].courseName
        let classroom = classes[indexPath.row].classroom
        let schedule = "DE \(classes[indexPath.row].startTime) A \(classes[indexPath.row].endTime)"
        cell.titleLabel.text = "\(className)\nAULA \(classroom)\n\(schedule)"
        return cell
    }
}

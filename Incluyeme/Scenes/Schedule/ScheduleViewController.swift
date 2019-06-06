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
    }
    override func viewDidAppear(_ animated: Bool) {
        if (!Utils.checkInternetConnection()){
            Utils.internetAlert(self)
        }
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
        let startTime = Int(classes[indexPath.row].startTime.prefix(2))!
        let startHour = startTime > 12 ? "\(startTime - 12) PM" : "\(startTime) AM"
        let endTime = Int(classes[indexPath.row].endTime.prefix(2))!
        let endHour = endTime > 12 ? "\(endTime - 12) PM" : "\(endTime) AM"
        let schedule = "DE \(startHour) A \(endHour)"
        cell.titleLabel.text = "\(className)\nAULA \(classroom)\n\(schedule)"
        return cell
    }
}

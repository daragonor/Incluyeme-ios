//
//  GradesViewController.swift
//  Incluyeme
//
//  Created by Developer on 6/4/19.
//  Copyright © 2019 Developer. All rights reserved.
//

import UIKit

class GradesViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var grades: [GradeResponse] = []
    var key = IncluyemeKey.grades
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "BaseAlterTableViewCell", bundle: nil), forCellReuseIdentifier: "BaseAlterTableViewCell")
        tableView.delegate = self
        tableView.dataSource = self
        IncluyemeAPI<GradesBodyResponse>.get(key,responseHandler: {
            data in
            self.grades = data.response.responseGradesList.list
            self.grades.removeFirst()
            self.tableView.reloadData()
        },errorHandler: {_ in
            if let data = UserDefaults.standard.data(forKey: self.key.rawValue),
                let response = try? JSONDecoder().decode(GradesBodyResponse.self, from: data){
                self.grades = response.responseGradesList.list
                self.grades.removeFirst()
                print(self.grades)
            }
        })
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

extension GradesViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UIScreen.main.bounds.height*0.125
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return grades.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell  = tableView.dequeueReusableCell(withIdentifier: "BaseAlterTableViewCell", for: indexPath) as! BaseTableViewCell
        let grade = grades[indexPath.row]
        cell.titleLabel.text = "\(grade.CodTipoPrueba!) \(grade.NumPrueba!): \(grade.Nota!)"
        return cell
    }
}

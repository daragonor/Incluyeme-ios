//
//  CoursesViewController.swift
//  Incluyeme
//
//  Created by Developer on 6/3/19.
//  Copyright © 2019 Developer. All rights reserved.
//

import UIKit

class CoursesViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    var courses: [CourseResponse] = []
    var key = IncluyemeKey.courses

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "BaseTableViewCell", bundle: nil), forCellReuseIdentifier: "BaseTableViewCell")
        tableView.delegate = self
        tableView.dataSource = self
        IncluyemeAPI<CourseBodyResponse>.get(.courses,responseHandler: {
            data in
            self.courses = data.response.courseListResponse.courseList
            self.tableView.reloadData()
        },errorHandler: { _ in
            if let data = UserDefaults.standard.data(forKey: self.key.rawValue),
                let response = try? JSONDecoder().decode(CourseBodyResponse.self, from: data){
                self.courses = response.courseListResponse.courseList
                print(self.courses)
            }
        })
    }
    

    @IBAction func backAction(_ sender: Any) {
        self.dismiss(animated: false, completion: nil)
    }
}

extension CoursesViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let height = self.view.safeAreaLayoutGuide.layoutFrame.size.height
        return height*0.125
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return courses.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell  = tableView.dequeueReusableCell(withIdentifier: "BaseTableViewCell", for: indexPath) as! BaseTableViewCell
        cell.titleLabel.text = courses[indexPath.row].courseName
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let viewController = self.storyboard!.instantiateViewController(withIdentifier: "GradesViewController")
        self.present(viewController, animated: false, completion: nil)
    }
}

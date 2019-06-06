//
//  WeekViewController.swift
//  Incluyeme
//
//  Created by Developer on 6/3/19.
//  Copyright © 2019 Developer. All rights reserved.
//

import UIKit

class WeekViewController: UIViewController {
    enum Day: String{
        case lunes = "LUNES"
        case martes = "MARTES"
        case miercoles = "MIÉRCOLES"
        case jueves = "JUEVES"
        case viernes = "VIERNES"
        case sabado = "SÁBADO"
    }
    var classes: [ScheduleClassesResponse] = []
    var key = IncluyemeKey.schedule

    override func viewDidLoad() {
        super.viewDidLoad()
        IncluyemeAPI<ScheduleBodyResponse>.get(.schedule, responseHandler: {data in
            self.classes = data.response.scheduleResponse.detail.classes
        },errorHandler: {_ in
            if let data = UserDefaults.standard.data(forKey: self.key.rawValue),
                    let response = try? JSONDecoder().decode(ScheduleBodyResponse.self, from: data){
                self.classes = response.scheduleResponse.detail.classes
                print(self.classes)
            }
        })
    }
    
    func goToSchedule(day: Day){
        let viewController = self.storyboard!.instantiateViewController(withIdentifier: "ScheduleViewController") as! ScheduleViewController
        var data = classes.filter {$0.day == day.rawValue}
        var dayClasses: [ScheduleClassesResponse] = []
        if data.count > 0{
            dayClasses = [data[0]]
            for n in 0..<data.count {
                if dayClasses.last!.startTime != data[n].startTime{
                    dayClasses.append(data[n])
                }
            }
        }
        viewController.classes = dayClasses
        self.present(viewController, animated: false, completion: nil)
    }

    @IBAction func backAction(_ sender: Any) {
        self.dismiss(animated: false, completion: nil)
    }
    @IBAction func LunesButtonAction(_ sender: Any) {
        goToSchedule(day: .lunes)
    }
    @IBAction func MartesButtonAction(_ sender: Any) {
        goToSchedule(day: .martes)
    }
    @IBAction func MiercolesButtonAction(_ sender: Any) {
        goToSchedule(day: .miercoles)
    }
    @IBAction func JuevesButtonAction(_ sender: Any) {
        goToSchedule(day: .jueves)
    }
    @IBAction func ViernesButtonAction(_ sender: Any) {
        goToSchedule(day: .viernes)
    }
    @IBAction func SabadoButtonAction(_ sender: Any) {
        goToSchedule(day: .sabado)
    }
    
}

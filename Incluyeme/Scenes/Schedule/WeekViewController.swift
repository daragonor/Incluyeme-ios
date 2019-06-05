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

    override func viewDidLoad() {
        super.viewDidLoad()
        IncluyemeAPI.getSchedule(responseHandler: {
            data in
            self.classes = data.response.scheduleResponse.detail.classes
        })
    }
    
    func goToSchedule(day: Day){
        let viewController = self.storyboard!.instantiateViewController(withIdentifier: "ScheduleViewController") as! ScheduleViewController
        let data = classes.filter {$0.day == day.rawValue}
        viewController.classes = data
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

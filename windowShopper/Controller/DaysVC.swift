//
//  DaysVC.swift
//  windowShopper
//
//  Created by kalle hallden on 2018-01-22.
//  Copyright © 2018 Elite Athlete Coaching. All rights reserved.
//

import UIKit

class DaysVC: UIViewController {
    
    @IBOutlet weak var dayslbl: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var hoursPerDayTxt: DaysTextField!
    
    var hours: Hours!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(hours.totalHours)
        
        setupButton()
        resultLabel.isHidden = true
        dayslbl.isHidden = true
    }
    
    func setupButton() {
        let calcBtn = UIButton(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 50))
        calcBtn.backgroundColor = #colorLiteral(red: 0, green: 0.5603182912, blue: 0, alpha: 0.6978274829)
        calcBtn.setTitle("Calculate", for: .normal)
        calcBtn.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
        calcBtn.addTarget(self, action: #selector(DaysVC.calculate), for: .touchUpInside)
        
        hoursPerDayTxt.inputAccessoryView = calcBtn
    }
    
    @IBAction func clearBtnWasPressed(_ sender: Any) {
        resultLabel.isHidden = true
        dayslbl.isHidden = true
        hoursPerDayTxt.text = ""
        
    }
    
    
    @objc func calculate() {
        if let horsPerdayText = Double(hoursPerDayTxt.text!), let hour = hours.totalHours {
                view.endEditing(true)
                resultLabel.isHidden = false
                dayslbl.isHidden = false
            resultLabel.text = "\(DaysCalc.getDays(forTotalHours: hour, andHoursPerDay: horsPerdayText))"
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

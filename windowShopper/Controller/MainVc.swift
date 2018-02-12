//
//  ViewController.swift
//  windowShopper
//
//  Created by kalle hallden on 2018-01-22.
//  Copyright © 2018 Elite Athlete Coaching. All rights reserved.
//

import UIKit

class MainVc: UIViewController {

    @IBOutlet weak var wageTxt: CurrencyTxtField!
    @IBOutlet weak var priceTxt: CurrencyTxtField!
    
    @IBOutlet weak var resultLbl: UILabel!
    @IBOutlet weak var hoursLbl: UILabel!
    
    @IBOutlet weak var daysBtn: UIButton!
    
    var hours: Hours!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        hours = Hours()
        
        setupButton()
        resultLbl.isHidden = true
        hoursLbl.isHidden = true
    }
    
    func setupButton() {
        let calcBtn = UIButton(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 50))
        calcBtn.backgroundColor = #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1)
        calcBtn.setTitle("Calculate", for: .normal)
        calcBtn.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
        calcBtn.addTarget(self, action: #selector(MainVc.calculate), for: .touchUpInside)
        
        wageTxt.inputAccessoryView = calcBtn
        priceTxt.inputAccessoryView = calcBtn
    }


    @IBAction func nxtBtnTapped(_ sender: Any) {
        performSegue(withIdentifier: "daysVCSeque", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let daysVC = segue.destination as? DaysVC {
            daysVC.hours = hours
        }
    }
    
    @objc func calculate() {
        if let wageText = wageTxt.text, let priceText = priceTxt.text {
            if let wage = Double(wageText), let price = Double(priceText) {
            view.endEditing(true)
            resultLbl.isHidden = false
                hoursLbl.isHidden = false
                resultLbl.text = "\(Wage.getHours(forWage: wage, andPrice: price))"
                totHours(ttlhours: Wage.getHours(forWage: wage, andPrice: price))
            }
        }
    }
    
    func totHours(ttlhours: Int) {
        hours.totalHours = ttlhours
        daysBtn.isEnabled = true
    }
    
    @IBAction func clearBtnPressed(_ sender: Any) {
        resultLbl.isHidden = true
        hoursLbl.isHidden = true
        wageTxt.text = ""
        priceTxt.text = ""
    }
    
    @IBAction func unwindFromDaysVC(unwindsegue: UIStoryboardSegue) {
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}


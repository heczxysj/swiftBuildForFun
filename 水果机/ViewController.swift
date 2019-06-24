//
//  ViewController.swift
//  水果机
//
//  Created by hanggit on 2019/6/23.
//  Copyright © 2019 hanggit. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var imagePickerView: UIPickerView!
    @IBOutlet weak var rollButton: UIButton!
    let imageArray = ["🤪","🥶","🐥","🌝","🍭","🍀","🐲","🐒","🤖","🦹‍♂️"]
    var array1 = Array<String>()
    var array2 = [String]()
    var array3 = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        rollButton.layer.cornerRadius = 5.0
        
        for _ in 0...100{
            array1.append(imageArray[Int(arc4random() % 10)])
            array2.append(imageArray[Int(arc4random() % 10)])
            array3.append(imageArray[Int(arc4random() % 10)])
        }
        
        imagePickerView.delegate = self
        imagePickerView.dataSource = self
        imagePickerView.selectRow(50, inComponent: 0, animated: false)
        imagePickerView.selectRow(50, inComponent: 1, animated: false)
        imagePickerView.selectRow(50, inComponent: 2, animated: false)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }


    @IBAction func rollButtonAction(_ sender: Any) {
        let timer0 = Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(rollComponent0), userInfo: nil, repeats: true)
        Timer.scheduledTimer(withTimeInterval: 5, repeats: false) { (Timer) in
            timer0.invalidate()
        }

        let timer1 = Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(rollComponent1), userInfo: nil, repeats: true)
        Timer.scheduledTimer(withTimeInterval: 7, repeats: false) { (Timer) in
            timer1.invalidate()
        }

        let timer2 = Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(rollComponent2), userInfo: nil, repeats: true)
        Timer.scheduledTimer(withTimeInterval: 9, repeats: false) { (Timer) in
            timer2.invalidate()
        }
    }
    
    @objc func rollComponent0(){
        self.imagePickerView.selectRow(Int(arc4random() % 90), inComponent: 0, animated: true)
    }
    @objc func rollComponent1(){
        self.imagePickerView.selectRow(Int(arc4random() % 90), inComponent: 1, animated: true)
    }
    @objc func rollComponent2(){
        self.imagePickerView.selectRow(Int(arc4random() % 90), inComponent: 2, animated: true)
    }
    
    
}

extension ViewController:UIPickerViewDelegate,UIPickerViewDataSource{
    //MARK:--------------------dataSource------------------------
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 100
    }
    //MARK:--------------------delegate------------------------
    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        return 100
    }
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 200
    }
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let label = UILabel()
        if component == 0 {
            label.text = array1[row]
        }else if component == 1 {
            label.text = array2[row]
        }else {
            label.text = array3[row]
        }
        label.font = UIFont(name: "Apple Color Emoji", size: 80)
        label.textAlignment = .center
        return label
    }
}


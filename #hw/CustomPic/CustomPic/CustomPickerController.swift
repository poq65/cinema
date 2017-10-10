//
//  CustomPickerController.swift
//  CustomPic
//
//  Created by 지현 on 2017. 10. 4..
//  Copyright © 2017년 지현. All rights reserved.
//

import UIKit

class CustomPickerController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    
    @IBOutlet var hiddenView: UIView!
    @IBOutlet var inputTheater: UITextField!
    @IBOutlet var textfiledInfo: UITextField!
    @IBOutlet var picker: UIPickerView!
    @IBOutlet var imageInfo: UIImageView!
    
    let dayArray: Array<String> = ["10.09", "10.10", "10.11", "10.12"]
    let timeArray: Array<String> = ["12:00", "1:40", "4:20", "6:00","10:30","11:00"]
    let nameArray: [String] = ["킹스맨: 골든서클", "범죄도시", "남한산성", "아이 캔 스피크", "희생부활자"]
    var imageArray = [UIImage?] ()
    var imageFileName=["2.jpg","1.jpg", "3.jpg", "4.png", "5.jpg" ]
    override func viewDidLoad() {
        super.viewDidLoad()
        hiddenView.isHidden=true
    }
    @IBAction func find(_ sender: UIButton) {
        
        hiddenView.isHidden=false
    }
    
    
    //button 입력 후
    @IBAction func getValue() {
        if inputTheater.text==""{
            let alert = UIAlertController(title: "알림", message: "영화관을 입력해주세요!", preferredStyle: UIAlertControllerStyle.alert)
            
            let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default,handler : nil )

            alert.addAction(okAction)
            present(alert, animated: true, completion: nil)
            
            
        }

    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0 {
            return dayArray.count
        }
        else if component==1{
            return timeArray.count
        }
        else {
            return nameArray.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 0 {
            return dayArray[row]
        }
        else if component==1{
            return timeArray[row]
        }
        else {
            return nameArray[row]
        }
}
   
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let day: String = dayArray[self.picker.selectedRow(inComponent: 0)]
        let time: String = timeArray[self.picker.selectedRow(inComponent: 1)]
        let dept: String = nameArray[self.picker.selectedRow(inComponent: 2)]
        
        textfiledInfo.text = day + "  " + time + "PM  " + dept
        
        let seleted: Int=self.picker.selectedRow(inComponent: 2)
        
        for i in 0 ..< imageFileName.count {
            let image = UIImage(named: imageFileName[i])
            imageArray.append(image)
        }
        imageInfo.image=imageArray[seleted]
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "CustomPickerController2"){
            let dest = segue.destination as! CustomPickerController2
            let dept: String = nameArray[self.picker.selectedRow(inComponent: 2)]
            
            dest.info="< \(dept) > \n 예매가 완료되었습니다 "
            let date: String = "\(dayArray[self.picker.selectedRow(inComponent: 0)])" + "  " + "\(timeArray[self.picker.selectedRow(inComponent: 1)])" + "PM  "
            
            dest.date=date
            let seleted: Int=self.picker.selectedRow(inComponent: 2)
            let place: String=inputTheater.text!
            dest.place=place
            dest.selected=seleted
            
        }
    }
    
}

//
//  CustomPickerController2.swift
//  CustomPic
//
//  Created by 지현 on 2017. 10. 9..
//  Copyright © 2017년 지현. All rights reserved.
//

import UIKit

class CustomPickerController2: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet var pay: UISegmentedControl!
    @IBOutlet var labelInfo: UILabel!
    @IBOutlet var pickerUniv: UIPickerView!
    
    
    let personArray: Array<String> = ["1", "2", "3", "4","5","6","7","8"]
    let seatArray: Array<String> = ["A1", "A2", "A3", "A4","A5","A6","A7","B1", "B2", "B3", "B4","B5","B6","B7","C1", "C2", "C3", "C4","C5","C6","C7","D1", "D2", "D3", "D4","D5","D6","D7"]
   
    var info: String?
    var infoo: String!
    
    var date: String?
    var datee: String!
    
    var place: String?
    var placee: String!
  
    var selected: Int?
    var selectedd: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let contentString = info {
            infoo = contentString
        }
        if let contentString2 = date {
            datee = contentString2
        }
        if let contentString3 = place {
            placee = contentString3
        }
        if let contentInt = selected{
            selectedd=contentInt
        }
    
        
    }
    //button 입력 후
    @IBAction func getValue() {
        
        let alert = UIAlertController(title: "예매 완료", message: "예매를 완료하시겠습니까?", preferredStyle: UIAlertControllerStyle.alert)
        
        
        
        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default,handler : {(action) -> Void in
            //The (withIdentifier: "VC2") is the Storyboard Segue identifier.
            self.performSegue(withIdentifier: "ReceiptViewController", sender: self)
        })
        
        
        
        let cancel = UIAlertAction(title: "cancel", style: UIAlertActionStyle.cancel,handler : nil)
        
        
        
        alert.addAction(cancel)
        
        alert.addAction(okAction)
        
        present(alert, animated: true, completion: nil)
        
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0 {
            return personArray.count
        }
        else {
            return seatArray.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 0 {
            return personArray[row]
        }
        else {
            return seatArray[row]
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let day: String = personArray[self.pickerUniv.selectedRow(inComponent: 0)]
        let time: String = seatArray[self.pickerUniv.selectedRow(inComponent: 1)]
        
        labelInfo.text = day + "  명   " + time + "  열"
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "ReceiptViewController"){
            let dest = segue.destination as! ReceiptViewController
            let person: String=personArray[self.pickerUniv.selectedRow(inComponent: 0)]
            let seat: String = seatArray[self.pickerUniv.selectedRow(inComponent: 1)]
            
            let select: String! = pay.titleForSegment(at: pay.selectedSegmentIndex)
        
            dest.seatinfo="\(person) 명 , \(seat) 열 "
          
            dest.payinfo="\(select!) 선택"
            dest.info=infoo
            dest.date=datee
            dest.place=placee
            dest.selected=selectedd
          
        }
    }

}

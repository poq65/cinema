//
//  ReceiptViewController.swift
//  CustomPic
//
//  Created by 지현 on 2017. 10. 9..
//  Copyright © 2017년 지현. All rights reserved.
//

import UIKit

class ReceiptViewController: UIViewController {

    @IBOutlet var image: UIImageView!
    @IBOutlet var theater: UILabel!
    @IBOutlet var dateTime: UILabel!
    @IBOutlet var payInfo: UILabel!
    @IBOutlet var seatInfo: UILabel!
    @IBOutlet var infoLabel: UILabel!
    var info: String?
    var seatinfo: String?
    var payinfo: String?
    var date: String?
    var place: String?
    var imageArray = [UIImage?] ()
    var imageFileName=["2.jpg","1.jpg", "3.jpg", "4.png", "5.jpg" ]
    var selected: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let contentString = info {
            infoLabel.text = contentString
        }
        if let contentString2 = seatinfo {
            seatInfo.text = contentString2
        }
        if let contentString3 = payinfo {
            payInfo.text = contentString3
        }
        if let contentString4 = date {
            dateTime.text = contentString4
        }
        if let contentString5 = place {
            theater.text = contentString5
        }
        for i in 0 ..< imageFileName.count {
            let image = UIImage(named: imageFileName[i])
            imageArray.append(image)
        }
        image.image=imageArray[selected!]
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

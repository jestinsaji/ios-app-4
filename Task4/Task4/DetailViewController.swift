//
//  DetailViewController.swift
//  Task4
//
//  Created by Apps Team Mac book Air on 27/09/21.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet var lbl: UILabel!
    @IBOutlet var img: UIImageView!
    var name = ""
//    var myimage = UIImage()
//   var imagename = String()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lbl.text = name
        img.image = UIImage(named:name)

    }
    
}

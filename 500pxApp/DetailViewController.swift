//
//  DetailViewController.swift
//  500pxApp
//
//  Created by brn.developers on 9/10/18.
//  Copyright © 2018 brn.developers. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var detailImage: UIImageView!
    @IBOutlet weak var imageName: UILabel!
    
    @IBOutlet weak var smallImage: UIImageView!
    
    @IBOutlet weak var likeLabel: UILabel!
    
    var image = UIImage()
    var name = ""
    var value:UInt8 = 0
    var checked = false
    override func viewDidLoad() {
        super.viewDidLoad()
       title = "Description"
       
       detailImage.image = image
       smallImage.image = image
       imageName.text = name
       likeLabel.text = ""
    }

    @IBAction func onLikeBtnTap(_ sender: UIButton)
    {
        if checked {
            sender.setImage(UIImage(named:"like"), for: .normal)
            checked = false
            // value += 1
            likeLabel.text = "\(1) Like"
            
        } else {
            sender.setImage(UIImage(named:"unlike"), for: .normal)
            checked = true
            likeLabel.text = ""
        }
        
    }
    

}

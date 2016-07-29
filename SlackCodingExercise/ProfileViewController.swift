//
//  ProfileViewController.swift
//  SlackCodingExercise
//
//  Created by akshay on 7/28/16.
//  Copyright © 2016 akshay. All rights reserved.
//

import UIKit
import ChameleonFramework
import QuartzCore


class ProfileViewController: UIViewController {

    @IBOutlet var Background: UIView!
    @IBOutlet weak var middleGround: UIView!
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var bottomView: UIView!
    @IBOutlet weak var imageAndNameView: UIView!

    @IBOutlet weak var memberImageView: UIImageView!
    
    @IBOutlet weak var deletedImageView: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    
    var member:Member?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        memberImageView.image = UIImage(data: NSData(data: (member?.hasA?.image_192)!))
        
        memberImageView.image = memberImageView.image?.circleMasking
        middleGround.backgroundColor = UIColor(hexString: member?.color)
        topView.backgroundColor = UIColor(hexString: member?.color)
        bottomView.backgroundColor = UIColor(hexString: member?.color)
        imageAndNameView.backgroundColor = UIColor(hexString: member?.color)
        
        nameLabel.text = member?.name
        nameLabel.adjustsFontSizeToFitWidth = true
        nameLabel.backgroundColor = UIColor(complementaryFlatColorOf: UIColor.whiteColor(),withAlpha: 0.25)
        
        nameLabel.layer.cornerRadius = 5.0
        
        
    }
    
  
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}

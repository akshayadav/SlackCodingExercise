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
    @IBOutlet weak var bioView: UIView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var realName: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var phoneNumber: UILabel!
    @IBOutlet weak var email: UILabel!
    
    var member:Member?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        memberImageView.image = UIImage(data: NSData(data: (member?.hasA?.image_192)!))
        memberImageView.image = memberImageView.image?.circleMasking
        middleGround.backgroundColor = UIColor(hexString: member?.color)
        topView.backgroundColor = UIColor(hexString: member?.color)
        bottomView.backgroundColor = UIColor(hexString: member?.color)
        imageAndNameView.backgroundColor = UIColor(hexString: member?.color)
        bioView.backgroundColor = UIColor(complementaryFlatColorOf: UIColor.whiteColor(),withAlpha: 0.25)
        
        nameLabel.text = member?.name
        nameLabel.adjustsFontSizeToFitWidth = true
        nameLabel.backgroundColor = UIColor(hexString: member?.color,withAlpha: 0.25)
        nameLabel.layer.cornerRadius = 5.0
        
        realName.adjustsFontSizeToFitWidth = true
        titleLabel.adjustsFontSizeToFitWidth = true
        email.adjustsFontSizeToFitWidth = true
        phoneNumber.adjustsFontSizeToFitWidth = true
        
        if (member?.deleated?.boolValue) != nil {
            deletedImageView.hidden = !(member?.deleated?.boolValue)!
        }
        
        if (member?.real_name) != nil{
            realName.text = "Real Name: "+(member?.real_name)!
        }
        else{
            realName.text = "Real Name Unavailable"
        }
        
        if(member?.hasA?.title) != nil{
            titleLabel.text = "Title: "+(member?.hasA?.title)!
        }
        else{
            titleLabel.text = "Title Unavailable"
        }
        
        if(member?.hasA?.phone) != nil{
            phoneNumber.text = "☏ "+(member?.hasA?.phone)!
        }
        else{
            phoneNumber.text = "Phone Number Unavilable"
        }
        
        if(member?.hasA?.email) != nil{
            email.text = "Email ID: "+(member?.hasA?.email)!
        }
        else{
            email.text = "Email Unavailable"
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

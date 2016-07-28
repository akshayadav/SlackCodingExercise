//
//  ProfileViewController.swift
//  SlackCodingExercise
//
//  Created by akshay on 7/28/16.
//  Copyright © 2016 akshay. All rights reserved.
//

import UIKit
import ChameleonFramework


class ProfileViewController: UIViewController {

    @IBOutlet var Background: UIView!
    
    @IBOutlet weak var mainImageView: UIImageView!
    
    @IBOutlet weak var translucentBackground: UIView!
    
    @IBOutlet weak var usernameLabel: UILabel!
   
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var deletedImageView: UIImageView!
    
    @IBOutlet weak var stackView: UIStackView!
    
    var member:Member?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        
        Background.backgroundColor = UIColor(hexString: member?.color)
        mainImageView.image = UIImage(data: (member?.hasA?.image_192)!)
        translucentBackground.backgroundColor = UIColor(complementaryFlatColorOf: UIColor.whiteColor() ,withAlpha: 0.25)
        let compFlatColor: UIColor = UIColor(complementaryFlatColorOf: FlatBlackDark())
        
        usernameLabel.text = member?.name
        usernameLabel.textColor = compFlatColor
        titleLabel.text = member?.hasA?.title
        titleLabel.textColor = compFlatColor
        
        if(member!.deleated!.boolValue){
            deletedImageView.hidden = false
        }
        
        
        
        
        
        
       
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

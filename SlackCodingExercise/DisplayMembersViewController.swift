//
//  DisplayMembersViewController.swift
//  SlackCodingExercise
//
//  Created by akshay on 7/27/16.
//  Copyright © 2016 akshay. All rights reserved.
//

import UIKit
import Alamofire
import SVProgressHUD
import SwiftyJSON
import CoreData
import ChameleonFramework

class DisplayMembersViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    @IBOutlet weak var tableView: UITableView!
    var token:String = "xoxp-4698769766-4698769768-18910479235-8fa82d53b2"
    var membersLocal = [NSManagedObject]()
    
    var selectedMemberIndex = 0

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        fetchJSON()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: - Fetching the JSON 
    
    func fetchJSON(){
        
        SVProgressHUD.show()
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), {
            
            Alamofire.request(.GET, "https://slack.com/api/users.list"+"?token="+self.token).responseJSON{
                response in
                
                
                
                
                dispatch_async(dispatch_get_main_queue()){
                    
                    if((response.result.value != nil)&&(response.result.value!["members"] != nil)){
                
                    let json = JSON(response.result.value!)
                    
                    DataManager.saveMember(json["members"])
                    self.membersLocal = DataManager.fetchExistingMembers()
                    self.tableView.reloadData()
                    
                    SVProgressHUD.dismiss()
                    }
                    else{
                        let alert = UIAlertController(title: "Application Running Offline", message: "Please check internet connectivity.\nApplication will now run offline", preferredStyle: .Alert)
                        let alertAction = UIAlertAction(title: "OK", style: .Default,handler: nil)
                        
                        
                        alert.addAction(alertAction)
                        
                        self.presentViewController(alert,animated:true, completion:nil)
                        print("Something Is Wrong!")
                        self.membersLocal = DataManager.fetchExistingMembers()
                        self.tableView.reloadData()
                        
                        SVProgressHUD.dismiss()
                }
                }
                
                
            }
            
            
            
            
        })
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(membersLocal.count)
        return membersLocal.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell")as! MemberTableViewCell
        
        let member = membersLocal[indexPath.row] as! Member
        
        cell.backgroundOfDetailsView.backgroundColor = UIColor(complementaryFlatColorOf: UIColor.whiteColor(), withAlpha: 0.25)
        
        cell.titleLabel!.text = member.real_name //This is REAL_NAME not TITLE
        cell.phoneLabel.text = member.hasA?.phone // ☏ 
        cell.emailLabel.text = member.hasA?.email
        cell.idLabel.text = member.id
        cell.roleLabel.text = member.hasA?.title // Misspelled Title Earlier, naming 'title' as ROLE
        
        let image = UIImage(data: (member.hasA?.image_192)!)
        cell.memberImage.image = image
        
        let color: UIColor = UIColor(hexString: member.color)
        cell.backgroundColor = color
        
        
        let compFlatColor: UIColor = UIColor(complementaryFlatColorOf: FlatBlackDark())
        
        cell.titleLabel.adjustsFontSizeToFitWidth = true
        cell.roleLabel.adjustsFontSizeToFitWidth = true
        cell.idLabel.adjustsFontSizeToFitWidth = true
        cell.phoneLabel.adjustsFontSizeToFitWidth = true
        cell.emailLabel.adjustsFontSizeToFitWidth = true
        
        cell.titleLabel.textColor = compFlatColor
        cell.roleLabel.textColor = compFlatColor
        cell.phoneLabel.textColor = compFlatColor
        cell.emailLabel.textColor = compFlatColor
        cell.idLabel.textColor = compFlatColor
        
        
        
        if(member.deleated!.boolValue){
            cell.deletedImageView.image = UIImage(named: "deleted")
        }
        if(member.is_admin!.boolValue){
            cell.adminLabel.hidden = false
        }
        
        return cell
        
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
       // let member:Member = membersLocal[indexPath.row] as! Member
        
        self.selectedMemberIndex = indexPath.row
        
        performSegueWithIdentifier("memberSelected", sender: self)
        
     
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if(segue.identifier == "memberSelected"){
            let nextVC = segue.destinationViewController as! UINavigationController
            let profileVC = nextVC.topViewController as! ProfileViewController
            
            profileVC.member = membersLocal[selectedMemberIndex]as? Member
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

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

class DisplayMembersViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    @IBOutlet weak var tableView: UITableView!
    var token:String = "xoxp-4698769766-4698769768-18910479235-8fa82d53b2"
    var membersLocal = [NSManagedObject]()

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
            
            Alamofire.request(.GET, "https://slack.com/api/users.list"+"?token="+self.token).responseJSON{ response in
                
                
                
                
                dispatch_async(dispatch_get_main_queue()){
                    
                    let json = JSON(response.result.value!)
                    
                    DataManager.saveMember(json["members"])
                    self.membersLocal = DataManager.fetchExistingMembers()
                    
                    self.tableView.reloadData()
                    
                    
                   // print(self.membersLocal)
                    
                    SVProgressHUD.dismiss()
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
        cell.titleLabel!.text = member.real_name
        
        print(member.real_name)
        
        return cell
        
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

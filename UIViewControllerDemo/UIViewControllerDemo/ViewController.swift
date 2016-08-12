//
//  ViewController.swift
//  UIViewControllerDemo
//
//  Created by xianmingchen on 16/8/5.
//  Copyright © 2016年 xianmingchen. All rights reserved.
//

import UIKit
class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UIPopoverPresentationControllerDelegate {

    let kCellStringIdentifier = "CellStringIdentifier"
    var transitionResult : Int = 0
    var presentResult : Int = 0
    
    let transitionStyleArray = [UIModalTransitionStyle.CoverVertical,
                                UIModalTransitionStyle.FlipHorizontal,
                                UIModalTransitionStyle.CrossDissolve,
                                UIModalTransitionStyle.PartialCurl]
    
    let presentationStyleArray = [UIModalPresentationStyle.FullScreen,
                                  UIModalPresentationStyle.PageSheet,
                                  UIModalPresentationStyle.FormSheet,
                                  UIModalPresentationStyle.CurrentContext,
                                  UIModalPresentationStyle.Custom,
                                  UIModalPresentationStyle.OverFullScreen,
                                  UIModalPresentationStyle.OverCurrentContext,
                                  UIModalPresentationStyle.Popover]
    
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //MARK:Action
    @IBAction func buttonClicked(sender: AnyObject) {
        let button = sender as! UIButton
        if  UIModalPresentationStyle(rawValue:self.presentResult) == UIModalPresentationStyle.Popover{
            self .presentPopViewController(button)
        }
        else{
            let myViewController : MyViewController = MyViewController(nibName: "MyViewController", bundle: NSBundle.mainBundle())
            myViewController.modalPresentationStyle = UIModalPresentationStyle(rawValue:self.presentResult)!
            myViewController.modalTransitionStyle = UIModalTransitionStyle(rawValue:self.transitionResult)!
            self.presentViewController(myViewController, animated: true, completion: nil)
        }
    }
    
    func presentPopViewController(sourceView : UIView) {
        let myViewController : MyViewController = MyViewController(nibName: "MyViewController", bundle: NSBundle.mainBundle())
        
        
        myViewController.modalPresentationStyle = .Popover
        myViewController.popoverPresentationController?.delegate = self
        myViewController.popoverPresentationController?.sourceView = sourceView
        myViewController.popoverPresentationController?.permittedArrowDirections = UIPopoverArrowDirection.Any
        myViewController.modalTransitionStyle = UIModalTransitionStyle(rawValue: self.transitionResult)!;
        self.presentViewController(myViewController, animated: true
            , completion: nil)

    }
    
    func adaptivePresentationStyleForPresentationController(controller: UIPresentationController) -> UIModalPresentationStyle {
        return UIModalPresentationStyle.None
    }
    
    //MARK:UITableViewDelegate
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        if indexPath.section == 0 {
            self.transitionResult = indexPath.row
        }
        else {
            self.presentResult = indexPath.row
        }
        
        tableView .reloadData()
    }
    
    //MARK:UITableViewDataSource
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "transitionStyle"
        }
        else {
            return "presentStyle"
        }
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return transitionStyleArray.count //UIModalTransitionStyle.PartialCurl + 1
        }
        else if section == 1{
            return presentationStyleArray.count //UIModalPresentationStyle.None + 1
        }
        return 0
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let tableViewCell : UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: kCellStringIdentifier);
        
        switch indexPath.section {
        case 0:
            tableViewCell.textLabel?.text = self.titleStringForTransitionStyle(UIModalTransitionStyle(rawValue: indexPath.row)!);
            if indexPath.row == self.transitionResult {
                tableViewCell.accessoryType = UITableViewCellAccessoryType.Checkmark
            }
            else{
                tableViewCell.accessoryType = UITableViewCellAccessoryType.None
            }
        case 1:
            tableViewCell.textLabel?.text = self.titleStringForPresentStyle(UIModalPresentationStyle(rawValue: indexPath.row)!);
            if indexPath.row == self.presentResult {
                tableViewCell.accessoryType = UITableViewCellAccessoryType.Checkmark
            }
            else{
                tableViewCell.accessoryType = UITableViewCellAccessoryType.None
            }
        default:
            NSLog("%d", 1)
        }
        
        return tableViewCell
    };
    
    //MARK:other
    func titleStringForTransitionStyle(style: UIModalTransitionStyle) ->String? {
        var resultString : String? = nil;
        
        switch style {
        case UIModalTransitionStyle.CoverVertical:
            resultString = "CoverVertical"
        case UIModalTransitionStyle.CrossDissolve:
            resultString = "CrossDissolve"
        case UIModalTransitionStyle.FlipHorizontal:
            resultString = "FlipHorizontal"
        case UIModalTransitionStyle.PartialCurl:
            resultString = "PartialCurl"
        }
        
        return resultString;
    }
    
    func titleStringForPresentStyle(style: UIModalPresentationStyle) ->String? {
        var resultString : String? = nil;
        
        switch style {
        case UIModalPresentationStyle.CurrentContext:
            resultString = "CurrentContext"
        case UIModalPresentationStyle.Custom:
            resultString = "Custom"
        case UIModalPresentationStyle.FormSheet:
            resultString = "FormSheet"
        case UIModalPresentationStyle.FullScreen:
            resultString = "FullScreen"
        case UIModalPresentationStyle.None:
            resultString = "None"
        case UIModalPresentationStyle.OverFullScreen:
            resultString = "OverFullScreen"
        case UIModalPresentationStyle.OverCurrentContext:
            resultString = "OverCurrentContext"
        case UIModalPresentationStyle.PageSheet:
            resultString = "PageSheet"
        case UIModalPresentationStyle.Popover:
            resultString = "Popover"
        }
        return resultString
    }
}
//
//  RootTableViewController.swift
//  TestDemoPark
//
//  Created by ss on 15/10/9.
//  Copyright © 2015年 Yasin. All rights reserved.
//

import UIKit

class RootTableViewController: UITableViewController {
    let titleArr = ["测试webView","水杯动画","estimatedRowHeight行高自适应","自定义输入框","网络请求提示框","RSA加密","让你的应用“动”起来"]
    let detailTextArr = ["","点击可以再次播放","实现基于约束的自适应单元格的高度tabelView","MMTextFieldEffects","","","让你的应用“动”起来"]
    let viewControllerArr = ["YaWebViewController","WaterGlassAnimationViewController","YaAutoLayoutTableViewController","MMTextFieldEffectsTableViewController","NetworkLoadTestViewController","RSAEncryptorViewController","CALayerAniViewController"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        tableView.estimatedRowHeight = 100
        tableView.rowHeight = UITableViewAutomaticDimension
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return titleArr.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "RootTableViewCell")
        cell.textLabel?.text = titleArr[indexPath.row]
        cell.detailTextLabel?.text = detailTextArr[indexPath.row]
        cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
        // Configure the cell...

        return cell
    }
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let classNameStr = viewControllerArr[indexPath.row]
        if classNameStr == "WaterGlassAnimationViewController" {
            if let view = swiftClassFromString(classNameStr) {
                view.title = titleArr[indexPath.row]
                self.navigationController?.pushViewController(view, animated: true)
            }
        } else if let view = self.storyboard?.instantiateViewControllerWithIdentifier(classNameStr) {
            self.navigationController?.pushViewController(view, animated: true)
            return
        }
    }
    func swiftClassFromString(className: String) -> UIViewController? {
        //方法 NSClassFromString 在Swift中已经不起作用了no effect，需要适当更改
        //官方文档方法：let myPersonClass: AnyClass? = NSClassFromString("MyGreatApp.Person")
        if  let appName = NSBundle.mainBundle().objectForInfoDictionaryKey("CFBundleName") as? String {
            let classStringName = "_TtC\(appName.characters.count)\(appName)\(className.characters.count)\(className)"
            let  cls: AnyClass? = NSClassFromString(classStringName)
            assert(cls != nil, "class not found,please check className")
            if let viewClass = cls as? UIViewController.Type {
                let view = viewClass.init()
                return view
            }
        }
        return nil;
    }
    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

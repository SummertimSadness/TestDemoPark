//
//  NetworkLoadTestViewController.swift
//  TestDemoPark
//
//  Created by ss on 15/10/15.
//  Copyright © 2015年 Yasin. All rights reserved.
//

import UIKit

class NetworkLoadTestViewController: UIViewController,YANetworkLoadViewDelegate {
    var mobile = 1
    @IBOutlet weak var networkLoadView: YANetworkLoadView!
    override func viewDidLoad() {
        super.viewDidLoad()
        networkLoadView.delegate = self
        
        setupNetworkData()

    }
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    func setupNetworkData(){
        networkLoadView.showLoadingView()
//        let config = NSURLSessionConfiguration.defaultSessionConfiguration()
//        let cache = NSURLCache(memoryCapacity: 10*1024*1024, diskCapacity: 20*1024*1024, diskPath: nil)
//        config.URLCache = cache
//        config.requestCachePolicy = NSURLRequestCachePolicy.ReloadIgnoringLocalCacheData
        let manager = AFHTTPSessionManager(baseURL: NSURL(string: "http://api.themoviedb.org"))//,sessionConfiguration: config)
        let url = "3/discover/movie"
        manager.GET(url, parameters: ["page":"\(mobile)","api_key":"328c283cd27bd1877d9080ccb1604c91","sort_by":"popularity.desc"], success: { (operation:NSURLSessionDataTask, response:AnyObject) -> Void in
//            self.hidenNetworkLoadView()
            self.networkLoadView.showErrorView()
            }) { (operation:NSURLSessionDataTask, error:NSError) -> Void in
                self.networkLoadView.showErrorView()
        }
        mobile++
    }
    func hidenNetworkLoadView() {
//        hwcDelay(3.0) { () -> () in
            UIView.transitionWithView(self.view, duration: 0.3, options: UIViewAnimationOptions.TransitionCrossDissolve, animations: { () -> Void in
                self.networkLoadView.removeFromSuperview()
                }, completion: nil)
//        }
    }
    func hwcDelay(delay:Double, closure:()->()) {
        dispatch_after(
            dispatch_time(
                DISPATCH_TIME_NOW,
                Int64(delay * Double(NSEC_PER_SEC))
            ),
            dispatch_get_main_queue(), closure)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func retryRequest() {
        setupNetworkData()
    }

    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.

    }


}

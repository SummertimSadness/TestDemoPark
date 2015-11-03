//
//  YaWebViewController.swift
//  TestDemoPark
//
//  Created by ss on 15/10/12.
//  Copyright © 2015年 Yasin. All rights reserved.
//

import UIKit

class YaWebViewController: UIViewController,UIWebViewDelegate {

    @IBOutlet weak var webView: UIWebView!
    var urlStr = "http://app.art998.com/login"
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "正在加载..."
        // Do any additional setup after loading the view.
        if let url = NSURL(string: urlStr) {
            let reque = NSMutableURLRequest(URL:url , cachePolicy: NSURLRequestCachePolicy.UseProtocolCachePolicy, timeoutInterval: 20)
            webView.loadRequest(reque)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func webView(webView: UIWebView, shouldStartLoadWithRequest request: NSURLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        let SS = request.URL?.absoluteString
        return true
    }
    func webViewDidFinishLoad(webView: UIWebView) {
        if let title = webView.stringByEvaluatingJavaScriptFromString("document.title") {
            self.title = title
        }
    }
}

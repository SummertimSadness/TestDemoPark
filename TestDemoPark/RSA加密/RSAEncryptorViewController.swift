//
//  RSAEncryptorViewController.swift
//  TestDemoPark
//
//  Created by ss on 15/10/16.
//  Copyright © 2015年 Yasin. All rights reserved.
//

import UIKit

class RSAEncryptorViewController: UIViewController,YANetworkLoadViewDelegate {
    @IBOutlet weak var networkLoadView: YANetworkLoadView!

    override func viewDidLoad() {
        super.viewDidLoad()
        networkLoadView.delegate = self
        setupNetworkData()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupNetworkData() {
        networkLoadView.showLoadingView()
        let pubkey = "-----BEGIN PUBLIC KEY-----\nMIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCzdOrWUDGWCLcXiIJK3Rb0jZKo\ndZa5P8IO4nYQXaRXdV4NYe9ri1OS0OCuCd/DNGYPrecL5vR/IdnS/wnflkB1uTBo\nNJZwYY7C/0licWeZ/AU+swp1UOy37cf48ZWVNIEDSOoLIgofIdIYukhKNAd4YmA+\ni/mk3uR8HjBDbHZVMQIDAQAB\n-----END PUBLIC KEY-----";
        let privkey = "-----BEGIN RSA PRIVATE KEY-----\nMIICXQIBAAKBgQCzdOrWUDGWCLcXiIJK3Rb0jZKodZa5P8IO4nYQXaRXdV4NYe9r\ni1OS0OCuCd/DNGYPrecL5vR/IdnS/wnflkB1uTBoNJZwYY7C/0licWeZ/AU+swp1\nUOy37cf48ZWVNIEDSOoLIgofIdIYukhKNAd4YmA+i/mk3uR8HjBDbHZVMQIDAQAB\nAoGAFsS/wt8721hRupekSFFSx0ZrFBqPPAO94FuVNTBcWIhYnYQOd2ue9+KujwZL\nsJ2mUVj0Fot/+91UoLOhEhAjL1YTWVqSeozvSFUddxTgyqZw80f2+/ViQ9YZnGk+\ntOfH7T8xGzZ+1Y6G/ZQ2NgDW66WCVrOVAN1c7lOdCPbBv9ECQQDgxRZ9t4OCKpjk\nmr28poWAW8P/vuC5TXzrlDnlXK2W5DUs+UwbXAxzkdoTYSZipfx28kv70H2zB2/E\nB29iTUDNAkEAzGQSI91SDyXvKg0vu5+wmbkgxaL1WMcAYKUnDZqmszsNnt6pTV3+\nEpJCjkd31gg3KEwa9YXnFz3yYaE4qRCV9QJBALjdoOf5XbJbcrDjDJbypu6xivz3\nc0E1GD9yBEQ++48VVx8MU6pVBPCwzxoNV1LfjkwOcKxGCHyM60Hhk5zYSSkCQQCD\nDSMIde8YoWURHHVfowuT9TzLHCqeKrLWRO6ebWu3fgTEudXqMnsnIzqjibWPuaLM\nJsgeZyX+JA0Whk4TMPxFAkA/XKfDlDMhyrTkXLjsJ5paf3ycM9G28o3dkAPE6uJN\nOcOIOcjXu4JcTZ1a5QqwO1wW7spJCDGnDV3Ywge1SVCV\n-----END RSA PRIVATE KEY-----"
        let manager = AFHTTPSessionManager(baseURL: NSURL(string: "http://api.art998.com"))
        let url = "login"
        var mobile = "18621707429"
        // 解码有问题，解析不出来，但是PHP端没有问题
        let mobileWithPubKey = RSA.encryptString("\(mobile)", publicKey: pubkey)
        let mobileWithPrivKey = RSA.decryptString(mobileWithPubKey, privateKey: privkey)
        let pwdWithPubKey = RSA.encryptString("aaaaaa", publicKey: pubkey)
        let pwdWithPrivKey = RSA.decryptString(pwdWithPubKey, privateKey: privkey)
        
        print(mobileWithPrivKey)
        print(pwdWithPrivKey)
        
        manager.POST(url, parameters: ["mobile":mobileWithPubKey,"password":pwdWithPubKey], success: { (operation:NSURLSessionDataTask, response:AnyObject) -> Void in
            //            self.hidenNetworkLoadView()
            self.networkLoadView.showErrorView()
            }) { (operation:NSURLSessionDataTask, error:NSError) -> Void in
                self.networkLoadView.showErrorView()
        }
//        mobile++
    }
    func retryRequest() {
        setupNetworkData()
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

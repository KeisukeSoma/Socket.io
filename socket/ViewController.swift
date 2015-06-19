//
//  ViewController.swift
//  socket
//
//  Created by mikilab on 2015/06/08.
//  Copyright (c) 2015年 mikilab. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // ここから
        let appDelegate: AppDelegate = UIApplication.sharedApplication().delegate as AppDelegate
        socket = appDelegate.socket
        
        socket.on("from_server") { (data, emitter) in
            if let message = data as? [String] {
                self.myLabel.text = message[0]
            }
        }
    }
    @IBAction func pushButton(sender: UIButton) {
        socket.emit("from_client", "button pushed!!")
    }
    //ここまで
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

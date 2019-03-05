//
//  AboutViewController.swift
//  mobileParadigmWeek1
//
//  Created by Bank on 30/1/2562 BE.
//  Copyright © 2562 Bank. All rights reserved.
//

import UIKit
import WebKit
class AboutViewController: UIViewController {
    @IBOutlet weak var webView:WKWebView!
    @IBAction func close(){
        dismiss(animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let url = Bundle.main.url(forResource:"BullsEye",
                                     withExtension:"html"){
            let request = URLRequest(url:url)
            webView.load(request)
        }

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

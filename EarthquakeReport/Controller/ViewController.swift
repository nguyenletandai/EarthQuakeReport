//
//  ViewController.swift
//  EarthquakeReport
//
//  Created by daicudu on 3/28/19.
//  Copyright © 2019 daicudu. All rights reserved.
//
import WebKit
import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var webView: WKWebView!
    var urlFromTableView: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        if let url = URL(string: urlFromTableView!) {
            webView.load(URLRequest(url: url))
        }

    }


}


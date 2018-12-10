//
//  ViewController.swift
//  SampleApp1
//
//  Created by André Vellori on 10/12/2018.
//  Copyright © 2018 André Vellori. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBOutlet  weak var label: UILabel!
    
    @IBAction func tappityTap() {
        let url = URL(string: "https://demo0530658.mockable.io/spiderman")!
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else {
                return
            }
            DispatchQueue.main.async {
                self.dataLoaded(data: data)
            }
        }
        task.resume()
    }
    
    func dataLoaded(data: Data) {
        let string = String(data: data, encoding: .ascii)
        label.text = string
    }

}


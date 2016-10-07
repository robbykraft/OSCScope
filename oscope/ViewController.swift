//
//  ViewController.swift
//  oscope
//
//  Created by Robby on 10/7/16.
//  Copyright © 2016 Robby Kraft. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIGestureRecognizerDelegate {

	let osc:OSCController = OSCController()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		let gesture:UITapGestureRecognizer = UITapGestureRecognizer.init(target: self, action: #selector(touchHandler))
		self.view.addGestureRecognizer(gesture)
		gesture.delegate = self
	}
	
	func touchHandler() {
		osc.send()
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}


}


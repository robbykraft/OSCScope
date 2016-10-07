//
//  ViewController.swift
//  oscope
//
//  Created by Robby on 10/7/16.
//  Copyright © 2016 Robby Kraft. All rights reserved.
//

import UIKit
import CoreMotion

class ViewController: UIViewController, UIGestureRecognizerDelegate {

	let osc:OSCController = OSCController()
	
	let mm = CMMotionManager.init()
	
	var sending:Bool = false
	
	var loopTimer:Timer?
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		let gesture:UITapGestureRecognizer = UITapGestureRecognizer.init(target: self, action: #selector(touchHandler))
		self.view.addGestureRecognizer(gesture)
		gesture.delegate = self

		self.view.backgroundColor = UIColor.black
	}
	
	func touchHandler() {
		sending = !sending
		
		if sending {
			self.mm.startDeviceMotionUpdates()
			loopTimer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(loop), userInfo: nil, repeats: true)
			self.view.backgroundColor = UIColor.white
		} else{
			self.mm.stopDeviceMotionUpdates()
			loopTimer?.invalidate()
			loopTimer = nil
			self.view.backgroundColor = UIColor.black
		}
	}
	
	
	func loop(){
		if let motion = mm.deviceMotion {
			let pitch:Float = Float(motion.attitude.pitch)
			let roll:Float = Float(motion.attitude.roll)
			let yaw:Float = Float(motion.attitude.yaw)
			osc.sendPitch(pitch, roll: roll, yaw: yaw)
		}
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}


}


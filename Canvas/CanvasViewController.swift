//
//  CanvasViewController.swift
//  Canvas
//
//  Created by Denny Ho on 10/22/18.
//  Copyright © 2018 Denny Ho. All rights reserved.
//

import UIKit

class CanvasViewController: UIViewController {

    @IBOutlet weak var arrowImageView: UIImageView!
    @IBOutlet weak var trayView: UIView!
    var trayOriginalCenter: CGPoint!
    var trayDown: CGPoint!
    var trayUp: CGPoint!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        trayOriginalCenter = trayView.center
        let trayDownOffset = 180
        trayDown = CGPoint(x: Double(trayView.center.x) ,y: Double(trayView.center.y) + Double(trayDownOffset)) // The position of the tray transposed down
        // Do any additional setup after loading the view.
        trayUp = trayOriginalCenter
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didPanTray(_ sender: UIPanGestureRecognizer) {
        let translation = sender.translation(in: view)
        let velocity = sender.velocity(in: view)

        if (sender.state == .began) {
            trayOriginalCenter = trayView.center
        }
        if (sender.state == .changed) {
            trayView.center = CGPoint(x: trayOriginalCenter.x, y: trayOriginalCenter.y + translation.y)
        }
        if (sender.state == .ended) {
            if (velocity.y > 0) {
                UIView.animate(withDuration: 0.5, animations: {
                    // Animate view properties here...
                }) { (Bool) in
                    self.trayView.center = self.trayDown
                    self.arrowImageView.image = UIImage(named: "up_arrow")
                    // Code to run after animation has finished...
                }
            }
            else {
                UIView.animate(withDuration: 0.5, animations: {
                    // Animate view properties here...
                }) { (Bool) in
                    self.trayView.center = self.trayUp
                    self.arrowImageView.image = UIImage(named: "down_arrow")
                    // Code to run after animation has finished...
                }
            }
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

//
//  ViewController.swift
//  SkinAndMorph
//
//  Created by 撒景賢 on 10/28/15.
//  Copyright © 2015 Speed 3D Inc. All rights reserved.
//

import UIKit
import SceneKit

class ViewController: UIViewController {
    
    @IBOutlet weak var toolbarView: UIView!
    var sceneView: SCNView!
    var scene: SCNScene!
    
    @IBAction func loadResource(sender: UIButton) {
        
        if sender.tag == 0 {
            loadSceneFromFormat("scn")
        } else {
            loadSceneFromFormat("dae")
        }
    }
    
    func loadSceneFromFormat(format:String){
        scene = SCNScene(named: "skin_and_morph_example.\(format)")
        sceneView.scene = scene
        
        let cylinder = scene?.rootNode.childNodeWithName("pCylinder1", recursively: true)
        let a1 = CABasicAnimation(keyPath: "morpher.weights[0]")
        a1.fromValue = 0
        a1.toValue = 1
        a1.duration = 1
        a1.beginTime = 1
        a1.autoreverses = true
        a1.repeatCount = MAXFLOAT
        
        cylinder?.addAnimation(a1, forKey: nil)
        
        let joint4 = scene?.rootNode.childNodeWithName("joint4", recursively: true)
        let spin = CABasicAnimation(keyPath: "rotation.w")
        spin.fromValue = -1.0*M_PI
        spin.toValue = 1.0*M_PI
        spin.duration = 10
        spin.repeatCount = .infinity
        
        joint4?.addAnimation(spin, forKey: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sceneView = SCNView(frame: self.view.bounds)
        sceneView.allowsCameraControl = true
        sceneView.showsStatistics = true
        self.view.insertSubview(sceneView, atIndex: 0)
        
        loadSceneFromFormat("scn")
    }

}


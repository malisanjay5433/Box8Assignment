//
//  HomeViewController.swift
//  Box8Assignment
//
//  Created by Sanjay Mali on 17/03/18.
//  Copyright © 2018 Sanjay Mali. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    var titleLabelHeightAnchor: NSLayoutConstraint?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Box8"
        navigationController?.navigationBar.prefersLargeTitles = true
        self.view.addSubview(titleLabel)
        self.view.backgroundColor = UIColor.red
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    let titleLabel: UILabel = {
        let tf = UILabel()
        tf.text = "Welcome to Box8"
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.layer.masksToBounds = false;
        tf.layer.shadowOffset = CGSize(width:10, height:10);
        tf.layer.shadowRadius = 5;
        tf.layer.shadowOpacity = 0.5;
        return tf
    }()
    

}

//
//  DetailViewController.swift
//  TableViewTest
//
//  Created by Aluno Mack on 11/09/19.
//  Copyright © 2019 MaatheusGois.Academy.Storybord.Trainer. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var imageViewOutlet: UIImageView!
    @IBOutlet weak var titleOutlet: UILabel!
    @IBOutlet weak var descriptionOutlet: UILabel!
    
    var video: Video?

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()

        // Do any additional setup after loading the view.
    }
    
    func setUI(){
        imageViewOutlet.image = video?.image
        titleOutlet.text = video?.title
    }
    

    @IBAction func buttonTapped(_ sender: Any) {
    }
    
}

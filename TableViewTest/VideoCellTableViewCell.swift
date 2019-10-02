//
//  VideoCellTableViewCell.swift
//  TableViewTest
//
//  Created by Aluno Mack on 11/09/19.
//  Copyright © 2019 MaatheusGois.Academy.Storybord.Trainer. All rights reserved.
//

import UIKit

class VideoCellTableViewCell: UITableViewCell {


    @IBOutlet weak var imageOutlet: UIImageView!
    @IBOutlet weak var labelOutlet: UILabel!
    
    func setVideo(video: Video){
        imageOutlet.image = video.image
        labelOutlet.text = video.title
    }


}

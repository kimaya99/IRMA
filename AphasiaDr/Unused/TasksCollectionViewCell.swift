//
//  TasksCollectionViewCell.swift
//  LBDLAPP
//
//  Created by Kimaya Desai on 12/1/17.
//  Copyright © 2017 SDSU. All rights reserved.
//

import UIKit

class TasksCollectionViewCell: UICollectionViewCell
{
    @IBOutlet weak var featuredImageView: UIImageView!
    @IBOutlet weak var interestTitleLabel : UILabel!
    @IBOutlet weak var backgroundColorView: UIView!
    
    var task: Tasks?{
        didSet{
            self.updateUI()
        }
    }

    private func updateUI(){
        if let task = task {
            interestTitleLabel.text = task.label
            featuredImageView.image = task.featuredImage
            backgroundColorView.backgroundColor = task.color
        }
        else{
            interestTitleLabel.text = nil
            featuredImageView.image = nil
            backgroundColorView = nil
        }
    }
    
    override func layoutSubviews(){
        super.layoutSubviews()
        self.layer.cornerRadius = 3.0
        layer.shadowRadius = 2
        layer.shadowOpacity = 0.4
        layer.shadowOffset = CGSize(width:5, height:10)
        self.clipsToBounds = false
    }
}

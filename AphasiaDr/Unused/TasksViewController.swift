//
//  TasksViewController.swift
//  LBDLAPP
//
//  Created by Kimaya Desai on 12/1/17.
//  Copyright © 2017 SDSU. All rights reserved.
//

import UIKit

class TasksViewController : UIViewController {
    @IBOutlet weak var collectionView :  UICollectionView?
    
    var tasks = Tasks.fetchTasks()
    let cellScaling: CGFloat = 0.6
    
  
    @IBAction func exitCalled(_ sender: UIBarButtonItem)
    {
        exit(0)
    }
    override func viewDidLoad(){
        super.viewDidLoad()
        
        let screenSize = UIScreen.main.bounds.size
        let cellWidth = floor(screenSize.width * cellScaling)
        let cellHeight = floor(screenSize.height * cellScaling)
        
        let insetX = (view.bounds.width - cellWidth) / 4.0
        let insetY = (view.bounds.height - cellHeight) / 4.0
        
        let layout = collectionView?.collectionViewLayout as! UICollectionViewFlowLayout
        
        layout.itemSize = CGSize(width: cellWidth, height : cellHeight)
        collectionView?.contentInset = UIEdgeInsets (top: insetY, left: insetX, bottom: insetY,right: insetX)
        
        collectionView?.dataSource = self
    }
    
}

extension TasksViewController : UICollectionViewDataSource {
    func numberOfSections(in collectionView : UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section:Int) -> Int {
        return tasks.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TaskCell", for: indexPath) as! TasksCollectionViewCell
        cell.task = tasks[indexPath.item]
       
        return cell
    }
    
   
    
}

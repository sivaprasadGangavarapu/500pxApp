//
//  ViewController.swift
//  500pxApp
//
//  Created by brn.developers on 9/8/18.
//  Copyright © 2018 brn.developers. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {
    
    @IBOutlet weak var photoCollectionView: UICollectionView!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet var gridButton: UIButton!
    @IBOutlet var listButton: UIButton!
    var itemsToDisplay = [UIImage]()
    
    var gridLayout: GridLayout!
    lazy var listLayout: ListLayout = {
        var listLayout = ListLayout(itemHeight: 180)
        return listLayout
    }()
    
    // MARK: view methods
    override func viewDidLoad() {
        super.viewDidLoad()
        photoCollectionView.delegate = self
        photoCollectionView.dataSource = self

        title = "Images"
        itemsToDisplay = [#imageLiteral(resourceName: "logo"),#imageLiteral(resourceName: "img1"),#imageLiteral(resourceName: "img2"),#imageLiteral(resourceName: "img3"),#imageLiteral(resourceName: "img4"),#imageLiteral(resourceName: "img5"),#imageLiteral(resourceName: "img6"),#imageLiteral(resourceName: "img7"),#imageLiteral(resourceName: "img8"),#imageLiteral(resourceName: "img9")]
        gridLayout = GridLayout(numberOfColumns: 3)
        photoCollectionView.collectionViewLayout = gridLayout
        photoCollectionView.reloadData()
    }
    
    // MARK: collectionView methods
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return itemsToDisplay.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
        
        let image = itemsToDisplay[indexPath.item]
        cell.imageView.image = image
        cell.labelText.text = "Boom"
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        <#code#>
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        photoCollectionView.collectionViewLayout.invalidateLayout()
    }
    
    @IBAction func listButtonPressed() {
        // change to list layout
//        if gridLayout.numberOfColumns == 3 {
//            gridLayout.numberOfColumns = 2
//        } else {
//            gridLayout.numberOfColumns = 3
//        }
//
        gridLayout.invalidateLayout()
        if photoCollectionView.collectionViewLayout == gridLayout {
            // list layout
           // listButton.isEnabled = false
            UIView.animate(withDuration: 0.1, animations: {
                self.photoCollectionView.collectionViewLayout.invalidateLayout()
                self.photoCollectionView.setCollectionViewLayout(self.listLayout, animated: false)
            })
        }
    }
    
    @IBAction func gridButtonPressed() {
        // change to grid layout
        if photoCollectionView.collectionViewLayout == gridLayout {
            // list layout
            // listButton.isEnabled = false
            UIView.animate(withDuration: 0.1, animations: {
                self.photoCollectionView.collectionViewLayout.invalidateLayout()
                self.photoCollectionView.setCollectionViewLayout(self.listLayout, animated: false)
            })
        } else {
            // grid layout
            // listButton.isEnabled = true
            UIView.animate(withDuration: 0.1, animations: {
                self.photoCollectionView.collectionViewLayout.invalidateLayout()
                self.photoCollectionView.setCollectionViewLayout(self.gridLayout, animated: false)
            })
        }
       
       
    }
}


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
    var itemNames = [String]()
    
    var gridLayout: GridLayout!
    lazy var listLayout: ListLayout = {
        var listLayout = ListLayout(itemHeight: 180)
        return listLayout
    }()
    
    // MARK: view methods
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.barTintColor = UIColor.orange
        photoCollectionView.delegate = self
        photoCollectionView.dataSource = self

        title = "500px"
        itemsToDisplay = [#imageLiteral(resourceName: "logo"),#imageLiteral(resourceName: "img1"),#imageLiteral(resourceName: "img2"),#imageLiteral(resourceName: "img3"),#imageLiteral(resourceName: "img4"),#imageLiteral(resourceName: "img5"),#imageLiteral(resourceName: "img6"),#imageLiteral(resourceName: "img7"),#imageLiteral(resourceName: "img8"),#imageLiteral(resourceName: "img9"),#imageLiteral(resourceName: "img10"),#imageLiteral(resourceName: "img11"),#imageLiteral(resourceName: "img12"),#imageLiteral(resourceName: "img14"),#imageLiteral(resourceName: "img15"),#imageLiteral(resourceName: "img16"),#imageLiteral(resourceName: "img17"),#imageLiteral(resourceName: "img18"),#imageLiteral(resourceName: "img19"),#imageLiteral(resourceName: "img6")]
        itemNames = ["Logo","Shanu","Eveniong Mode","Emma","Silent","Hill Trecking","500px","CuteBaby","Shadow","HeavensGate","WaterBeauty","Logo","Sunrise","FireMe","Pegion","Green Logo","HolidayTrip","Khadanan","Trees","Logo500px"]
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
        
        cell.imageView.image = itemsToDisplay[indexPath.item]
        cell.labelText.text = itemNames[indexPath.row]
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        
        let  destVC = storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        destVC.image = itemsToDisplay[indexPath.row]
        destVC.name = itemNames[indexPath.row]
        self.navigationController?.pushViewController(destVC, animated: true)
    }
    // Pagination to Load Images Dynamically
    /*
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        let lastImage = itemsToDisplay.count - 1
        if indexPath.row == lastImage {
            loadMoreImages()
        }
        
    }
    
    func loadMoreImages()
    {
        for i in 1..<10 {
            let lastImage = itemsToDisplay.last!
            let newPhoto = lastImage + 1
            itemsToDisplay.append(newPhoto)
        }
        photoCollectionView.reloadData()
    }
   */
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        photoCollectionView.collectionViewLayout.invalidateLayout()
    }
    
    @IBAction func listButtonPressed(sender:UIButton) {
        // change to list layout

        listButton.setTitleColor(.green, for: .normal)
        gridButton.setTitleColor(.white, for: .normal)
        gridLayout.invalidateLayout()
        if photoCollectionView.collectionViewLayout == gridLayout {
           
            UIView.animate(withDuration: 0.1, animations: {
                self.photoCollectionView.collectionViewLayout.invalidateLayout()
                self.photoCollectionView.setCollectionViewLayout(self.listLayout, animated: false)
            })
        }
    }
    
    @IBAction func gridButtonPressed(sender:UIButton) {
        // change to grid layout
        listButton.setTitleColor(.white, for: .normal)
        gridButton.setTitleColor(.green, for: .normal)
        
        if photoCollectionView.collectionViewLayout == gridLayout {
            
            UIView.animate(withDuration: 0.1, animations: {
                self.photoCollectionView.collectionViewLayout.invalidateLayout()
                self.photoCollectionView.setCollectionViewLayout(self.listLayout, animated: false)
            })
        } else {
           
            UIView.animate(withDuration: 0.1, animations: {
                self.photoCollectionView.collectionViewLayout.invalidateLayout()
                self.photoCollectionView.setCollectionViewLayout(self.gridLayout, animated: false)
            })
        }
       
       
    }
}


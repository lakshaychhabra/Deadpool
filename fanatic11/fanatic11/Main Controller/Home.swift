//
//  FirstViewController.swift
//  fanatic11
//
//  Created by Lakshay Chhabra on 20/08/18.
//  Copyright © 2018 App Groceries. All rights reserved.
//

import UIKit
import AACarousel
import Kingfisher

class Home: UIViewController {

    @IBOutlet var imageSlider: AACarousel!
    @IBOutlet var notificationIcon: UIBarButtonItem!
    @IBOutlet var tableView: UITableView!
    
    @IBOutlet var segmentControl: UISegmentedControl!
    var changedValue : Int = 0
    var pathArray = [String]()
    var titleArray = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.backBarButtonItem?.tintColor = UIColor.white
        imageSlider.delegate = self
        setupImageSlider()
        
    }
    //Setting up Crousel
    
    func setupImageSlider(){
        
        pathArray = ["https://media.licdn.com/dms/image/C4D03AQGwzM_QAS-inA/profile-displayphoto-shrink_200_200/0?e=1538611200&v=beta&t=PhoHU2GTpQ8HCs6ayDXCvbm9L98wLA1SdZXtp68hxQU", "https://qph.fs.quoracdn.net/main-thumb-104917081-200-doqbdioevfpljkwmrogaywtxzfykftjw.jpeg"]
        titleArray = [" ", " "]
        imageSlider.setCarouselData(paths: pathArray, describedTitle: titleArray, isAutoScroll: true, timer: 3.0, defaultImage: "defaultImage")
        //optional methods
        imageSlider.setCarouselOpaque(layer: false, describedTitle: false, pageIndicator: false)
        imageSlider.setCarouselLayout(displayStyle: 1, pageIndicatorPositon: 0, pageIndicatorColor: nil, describedTitleColor: nil, layerColor: UIColor.clear)
        
    }
    
    @IBAction func indexChanged(_ sender: Any) {
        switch segmentControl.selectedSegmentIndex
        {
        case 0:
            changedValue = 0
            tableView.reloadData()
        case 1:
            changedValue = 1
            tableView.reloadData()
        case 2 :
            changedValue = 2
            tableView.reloadData()
        default:
            break
        }
        
    }
    
    @IBAction func notificationClicked(_ sender: Any) {
        
    }
}



//Mark :- Table controls
extension Home : UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if changedValue == 0 {
            return 5
        }
        else if changedValue == 1 {
            return 2
        }
        else{
            return 1
        }
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        
        if changedValue == 0 {
            cell?.textLabel?.text = "Lakshay"
            return cell!
        }
        else if changedValue == 1 {
            cell?.textLabel?.text = "Lakshay"
            return cell!
        }
        else{
            cell?.textLabel?.text = "Lakshay"
            return cell!
        }
        
    }
    
}


//Mark :- Implementation of Image Slider

extension Home : AACarouselDelegate{
    
    func didSelectCarouselView(_ view: AACarousel, _ index: Int) {
//        let alert = UIAlertView.init(title:"Alert" , message: titleArray[index], delegate: self, cancelButtonTitle: "OK")
//        alert.show()
        
        print("Image Clicked")
    }
    
    func callBackFirstDisplayView(_ imageView: UIImageView, _ url: [String], _ index: Int) {
        imageView.kf.setImage(with: URL(string: url[index]), placeholder: UIImage.init(named: "defaultImage"), options: [.transition(.fade(1))], progressBlock: nil, completionHandler: nil)
    }
    
    func downloadImages(_ url: String, _ index: Int) {
        //here is download images area
        let imageView = UIImageView()
        imageView.kf.setImage(with: URL(string: url)!, placeholder: UIImage.init(named: "defaultImage"), options: [.transition(.fade(0))], progressBlock: nil, completionHandler: { (downloadImage, error, cacheType, url) in
            self.imageSlider.images[index] = downloadImage!
        })
    }
 
}


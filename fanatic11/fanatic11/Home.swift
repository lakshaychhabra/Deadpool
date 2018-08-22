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
    
    var titleArray = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let pathArray = ["https://media.licdn.com/dms/image/C4D03AQGwzM_QAS-inA/profile-displayphoto-shrink_200_200/0?e=1538611200&v=beta&t=PhoHU2GTpQ8HCs6ayDXCvbm9L98wLA1SdZXtp68hxQU", "https://qph.fs.quoracdn.net/main-thumb-104917081-200-doqbdioevfpljkwmrogaywtxzfykftjw.jpeg"]
        titleArray = [" ", " "]
        imageSlider.delegate = self
        imageSlider.setCarouselData(paths: pathArray, describedTitle: titleArray, isAutoScroll: true, timer: 3.0, defaultImage: "defaultImage")
        //optional methods
        imageSlider.setCarouselOpaque(layer: false, describedTitle: false, pageIndicator: false)
        imageSlider.setCarouselLayout(displayStyle: 1, pageIndicatorPositon: 0, pageIndicatorColor: nil, describedTitleColor: nil, layerColor: UIColor.clear)
        
    
    }


    @IBAction func notificationClicked(_ sender: Any) {
        
    }
}

//Implementation of Image Slider

extension Home : AACarouselDelegate{
    func didSelectCarouselView(_ view: AACarousel, _ index: Int) {
        let alert = UIAlertView.init(title:"Alert" , message: titleArray[index], delegate: self, cancelButtonTitle: "OK")
        alert.show()
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


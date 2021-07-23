//
//  ViewController.swift
//  JJGram_RESTful
//
//  Created by heogj123 on 2021/07/22.
//

import UIKit
import Alamofire
import SnapKit
import SDWebImage

class ViewController: UIViewController {
  
  let imageView = UIImageView()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    self.view.backgroundColor = .white
    
    self.view.addSubview(imageView)
    imageView.snp.makeConstraints { (make) in
      make.width.height.equalTo(150)
      make.center.equalTo(self.view)
    }
    
    imageView.layer.borderWidth = 1.0
    imageView.layer.borderColor = UIColor.cyan.cgColor
    
    let url = URL.init(string: "http://192.168.0.22:3000/image")
    imageView.sd_setImage(with: url, completed: nil)
  }
  
  
}


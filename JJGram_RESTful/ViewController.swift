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
  
  static var imageArr: [UIImage] = []
  
  struct Item: Codable {
    let FilterName: String
    let OriginName: String
    let FilteredImage: String
    let OriginImage: String
    let FilterDescription: String
    let FilterStory: String
    let Location: String
    let FilterColor: String
  }
  
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
    
//    let url = URL.init(string: "http://192.168.0.22:3000/image")
//    imageView.sd_setImage(with: url, completed: nil)
    
     
//    let url = URL.init(string: "http://192.168.0.22:3000/getLUTImage/CINE/CINE01.png")
//    imageView.sd_setImage(with: url, completed: nil)
    
    
//    let ddurl = URL.init(string: "http://192.168.0.22:3000/getMainImageURL")
//    AF.request(ddurl!).responseJSON { (response) in
//
//
//      let dataJSON = try JSONSerialization.data(withJSONObject: response, options: .prettyPrinted)
//      let parsedData = try JSONDecoder().decode(Item.self, from: dataJSON)
//
//      NSLog("\(response)")
//    }
    
    let req = AF.request("http://192.168.0.22:3000/getMainImageURL", method: .get)
    req.responseJSON() { (res) in
      switch res.result {
      case .success(let data):
        do {
          let dataJSON = try JSONSerialization.data(withJSONObject: data, options: .prettyPrinted)
          let parsedData = try JSONDecoder().decode([Item].self, from: dataJSON)
          
          // Data화된 정보(dataJSON)을 JSONDecoder를 통해 원하는 정보를 일괄적으로 파싱해올수있다.
          // 반드시 파싱해오려는 구조체는 Codable 혹은 Decodable을 상속받아서 구현해야함.
          // JSON의 Key값과 Struct의 변수네임이 동일해야한다.
          // 물론 자료형도 동일해야한다.
          
          DispatchQueue.global().async {
            let imageURL = URL.init(string: "http://192.168.0.22:3000/getLUTImage/CINE/CINE01.png")
            let data = try? Data(contentsOf: imageURL!)
            let image: UIImage = UIImage(data: data!)!
            DispatchQueue.main.async {
              
              self.imageView.image = image
            }
            NSLog("JKJKAAA")
          }
        } catch {
          NSLog("\(error)")
          // print Error
        }
      case .failure(let error):
        break
      }
    }
  }
  
  
}


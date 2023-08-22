//
//  ViewController.swift
//  TestAPP
//
//  Created by t2023-m0076 on 2023/08/22.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Alamofire를 사용하여 서버(인터넷)에 있는 값을 APP으로 가져오는 과정
        // 텍스트 정보 가져오기
//        AF.request("https://httpbin.org/get")
//            .responseJSON { response in
//                print(response) // 디테일한 정보는 debugPrint로 불러옴
//            }
        
        // 이미지 정보 가져오기
        let imageView = UIImageView(frame: CGRect(x: 100, y: 100, width: 200, height: 200))
        let imageURL = "https://post-phinf.pstatic.net/MjAyMjExMTdfMTc4/MDAxNjY4NjUwMjIyNTk1.lPdnlANvRV06yYyGt51N66tZ2uT3wp9ynoy8DT4Faoog.fdkdS0L_iVyw5dMAwbHL4-DwlAAEMYfC2osO457v_wEg.JPEG/img.jpg?type=w800_q75"
        AF.request(imageURL)
            .response { response in
                switch response.result {
                case .success(let data):
                    DispatchQueue.main.async {
                        imageView.image = UIImage(data: data!)
                    }
                case .failure(let error):
                    print("실패", error)
                }
            }
        view.addSubview(imageView)
        
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "mainToUserDefault" {
            segue.destination.modalTransitionStyle = .crossDissolve
            let UserDefaultViewController = segue.destination as? UserDefaultsViewController
        }
    }

}


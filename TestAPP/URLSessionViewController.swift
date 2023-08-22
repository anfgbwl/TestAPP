//
//  URLSessionViewController.swift
//  TestAPP
//
//  Created by t2023-m0076 on 2023/08/22.
//

import UIKit

class URLSessionViewController: UIViewController {

    @IBOutlet weak var URLImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        URLManager.shared.getJsonData(completion: { result in
            switch result {
            case .success(let data):
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self.URLImageView.image = image
                    }
                }
            case .failure(let error):
                print("Error: ", error)
            }
        })
    }
}

class URLManager {
    static let shared = URLManager()
    private init () {
        
    }
    
    let url = URL(string: "https://mblogthumb-phinf.pstatic.net/MjAyMjAxMjVfMjAy/MDAxNjQzMTAyOTk2NjE0.gw_H_jjBM64svaftcnheR6-mHHlmGOyrr6htAuxPETsg.8JJSQNEA5HX2WmrshjZ-VjmJWqhmgE40Qm5csIud9VUg.JPEG.minziminzi128/IMG_7374.JPG?type=w800")!
    func getJsonData(completion: @escaping (Result<Data, Error>) -> Void) {
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error {
                print("Error : NetworkError")
                completion(.failure(NetworkError.emptyResponse))
                return
            }
            guard let data = data else {
                completion(.failure(NetworkError.emptyResponse))
                return
            }
            completion(.success(data))
        }
        task.resume()
    }
}


enum NetworkError: Error {
    case emptyResponse
}

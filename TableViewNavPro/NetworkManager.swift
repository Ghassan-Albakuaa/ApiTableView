//
//  NetworkManager.swift
//  TableViewNavPro
//
//  Created by Ghassan  albakuaa  on 10/1/20.
//

import UIKit

struct APIURLs {
    static let loremPicsumURL = "https://picsum.photos/200/300"
}

class NetworkManager {
    
    let session: URLSession
    
    init(session: URLSession = URLSession.shared) {
        self.session = session
    }

}

extension NetworkManager {
    
    func fetchImage(completion: @escaping ((UIImage?, String?)) -> ()) {
        
        guard let url = URL(string: APIURLs.loremPicsumURL) else {
            completion((nil, nil))
            return
        }
        
        self.session.dataTask(with: url) { (data, response, error) in
            if let err = error {
                print(err.localizedDescription)
                completion((nil, nil))
            }
            
            guard let data = data else {
                completion((nil, nil))
                return
            }
            
            var id: String?
            if let httpResponse = response as? HTTPURLResponse {
                id = httpResponse.value(forHTTPHeaderField: "picsum-id")
            }
            
            completion((UIImage(data: data), id))
            return
        }.resume()
        
    }
    
}

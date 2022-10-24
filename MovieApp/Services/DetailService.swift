//
//  DetailService.swift
//  MovieApp
//
//  Created by Cansu Kahraman on 1.10.2022.
//

import Foundation

class DetailService {
    
    func downloadDetail(id: String ,completion: @escaping (DetailModel?) -> ()) {
        guard let url = URL(string: APIURL.detail(id: id)) else { return }
        
        NetworkManager.shared.download(url: url) { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let data):
                completion(self.handleWithData(data))
            case .failure(let error):
                print(error)
                completion(nil)
            }
        }
    }
    
    private func handleWithData(_ data: Data) -> DetailModel? {
        do {
            let detail = try JSONDecoder().decode(DetailModel.self, from: data)
            return detail
        } catch {
            print(error)
            return nil
        }
    }
}


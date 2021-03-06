//
//  ServerManager.swift
//  Beeline SingleApp
//
//  Created by Baha Ganyev on 26.08.2018.
//  Copyright © 2018 Baha Ganyev. All rights reserved.
//

import Foundation
import Alamofire

class ServerManager: HTTPRequestManager {
    static let shared = ServerManager()
    
    func getCoins(start: Int, completion: @escaping ([String:Base]) -> (), error: @escaping (String) -> ()) {
        self.get(endpoint: Constants.Network.EndPoint.tickerByStart(by: start), completion: { (data) in
            //TODO
            do {
                guard let  data = data else { return }
                let result = try JSONDecoder().decode(RawServerResponse.self, from: data)
                completion(result.data)
            }
            catch let errorMessage {
                error(errorMessage.localizedDescription)
            }
            
        }) { (errorMessage) in
            error(errorMessage)
        }
    }
    
}

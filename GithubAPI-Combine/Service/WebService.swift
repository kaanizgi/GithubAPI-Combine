//
//  WebService.swift
//  GithubAPI-Combine
//
//  Created by Kaan İzgi on 18.08.2022.
//

import Foundation
import Combine




class APIService:ApiServiceManager {
    
    
    static let baseUrl = URL(string: "https://api.github.com/users")!
    
    func getUsers(url:URL) -> AnyPublisher<[User],Error> {
        return URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: [User].self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
    
    
}

//
//  WebService.swift
//  GithubAPI-Combine
//
//  Created by Kaan İzgi on 18.08.2022.
//

import Foundation
import Combine


class APIService:ApiServiceManager {
    
    func getUsers(Endpoint:Endpoint) -> AnyPublisher<[User],Error> {
        return URLSession.shared.dataTaskPublisher(for: Endpoint.url)
            .map(\.data)
            .decode(type: [User].self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
    
}



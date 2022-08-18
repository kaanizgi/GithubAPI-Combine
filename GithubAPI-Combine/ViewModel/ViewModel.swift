//
//  ViewModel.swift
//  GithubAPI-Combine
//
//  Created by Kaan İzgi on 18.08.2022.
//

import Foundation
import Combine

class ViewModel:ObservableObject {
    
    
    @Published var users = [User]()
    private var cancellable:AnyCancellable?
    
    init() {
        getUsers()
    }
    
    
    func getUsers() {
        
        cancellable = APIService.shared.getUsers(url: APIService.baseUrl)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { (completion) in
                print(completion)
            }, receiveValue: { userData in
                self.users = userData
            })
    }
    
    
    
}

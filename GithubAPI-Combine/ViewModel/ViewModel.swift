//
//  ViewModel.swift
//  GithubAPI-Combine
//
//  Created by Kaan İzgi on 18.08.2022.
//

import Foundation
import Combine

class ViewModel:ObservableObject {
    
    let service:ApiServiceManager
    @Published var users = [User]()
    @Published var isLoading = false
    private var cancellable:AnyCancellable?
   
    init(service:ApiServiceManager) {
        self.service = service
    }
    
    func getUsers() {
        isLoading = true
        cancellable = service.getUsers(url: APIService.baseUrl)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { (completion) in
                self.isLoading = false
            }, receiveValue: { userData in
                self.users = userData
            })
    }
    
    
    
}

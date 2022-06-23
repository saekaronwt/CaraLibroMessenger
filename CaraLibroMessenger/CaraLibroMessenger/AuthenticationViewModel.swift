//
//  AuthenticationViewModel.swift
//  CaraLibroMessenger
//
//  Created by user190993 on 6/20/22.
//

import Foundation
final class AuthenticationViewModel{
    
    @Published var user: User?
    @Published var messageError: String?
    private let authenticationRepository: AuthenticationRepository
    init(authenticationRepository: AuthenticationRepository = AuthenticationRepository())  {
        self.authenticationRepository = authenticationRepository
    }
    
    func createNewUser(email:String, password:String, completionBlock: @escaping(Result<User,Error>) -> Void ){
        authenticationRepository.createnewUser(email: email, password: password){[weak self]
                    result in
            switch result{
            case.success(let user):
                self?.user=user
            case.failure(let error):
                self?.messageError=error.localizedDescription
            }
    
        }
    
    }
}


    

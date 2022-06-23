//
//  AuthenticationRepository.swift
//  CaraLibroMessenger
//
//  Created by user190993 on 6/20/22.
//

import Foundation
final class AuthenticationRepository{
    private let authenticationFirebaseDatasource: AuthenticationFirebaseDataSource
    init(authenticationFirebaseDatasource: AuthenticationFirebaseDataSource = AuthenticationFirebaseDataSource()) {
        self.authenticationFirebaseDatasource = authenticationFirebaseDatasource
    }
    
    func createnewUser(email:String, password:String, completionBlock: @escaping(Result<User,Error>) -> Void ){
        authenticationFirebaseDatasource.createNewUser(email: email, password: password , completionBlock: completionBlock)
    }
}


	

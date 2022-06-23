//
//  AuthenticationFireBaseDataSource.swift
//  CaraLibroMessenger
//
//  Created by user190993 on 6/20/22.
//

import Foundation
import FirebaseAuth
struct 	User {
    let Email:String

}
final class AuthenticationFirebaseDataSource{
    func createNewUser(email:String, password:String, completionBlock: @escaping (Result<User,Error>)->Void){
        Auth.auth().createUser(withEmail: email, password: password){AuthDataResult, error in
                        if let error = error{
                            print("Error creando nuevo usuario \(error.localizedDescription)")
                                completionBlock(.failure(error))
                            return
                        }
            let email = AuthDataResult?.user.email ?? "No Email"
                            print( "Nuevo usuario creado con email \(email) ")
            completionBlock(.success(.init(Email: email)))
            
    
}
    }
}
          
      
            

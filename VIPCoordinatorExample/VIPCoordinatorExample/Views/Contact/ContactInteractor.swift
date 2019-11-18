//
//  ContactInteractor.swift
//  VIPCoordinatorExample
//
//  Created by Teqnological on 11/15/19.
//  Copyright (c) 2019 TEQ. All rights reserved.
//

import UIKit

protocol ContactBusinessLogic {
    var presenter: ContactPresentationLogic? { get set }
    func showRawMovieDetail(request: ContactRoute)
}

protocol ContactDataStore {
    var userId    : Int?    { get set }
    var firstName : String? { get set }
    var lastName  : String? { get set }
}

class ContactInteractor: ContactBusinessLogic, ContactDataStore {
    func showRawMovieDetail(request: ContactRoute) {
        
    }
    
    //
    var userId: Int?
    var firstName: String?
    var lastName: String?
    //
    var presenter: ContactPresentationLogic?
    var worker: ContactWorker?

}

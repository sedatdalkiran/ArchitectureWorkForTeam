//
//  LoginVM.swift
//  App1_mvvm
//
//  Created by SEDAT DALKIRAN on 17.06.2022.
//

import Foundation
import RxSwift
import RxCocoa

class LoginViewModel {
    let usernameTextPublishSubject = PublishSubject<String>()
    let passwordTextPublishSubject = PublishSubject<String>()

    func isValid() -> Observable<Bool> {
        return Observable.combineLatest(usernameTextPublishSubject.asObservable().startWith(""), passwordTextPublishSubject.asObservable()).map {username, password in
            return username.count > 3 && password.count > 3
        }.startWith(false)
    }
}

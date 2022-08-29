//
//  NotenewRouter.swift
//  toDoViper
//
//  Created by Kerem Safa Dirican on 29.08.2022.
//

import Foundation

class NotenewRouter: PtoR_NotenewProtocol{
    static func createModule(ref: NotenewVC) {
        ref.notenewPresenterObject = NotenewPresenter()
        ref.notenewPresenterObject?.notenewInteractor = NotenewInteractor()
    }
}

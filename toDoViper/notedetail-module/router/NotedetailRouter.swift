//
//  NotedetailRouter.swift
//  toDoViper
//
//  Created by Kerem Safa Dirican on 29.08.2022.
//

import Foundation

class NotedetailRouter: PtoR_NotedetailProtocol{
    static func createModule(ref: NotedetailVC) {
        ref.notedetailPresenterObject = NotedetailPresenter()
        ref.notedetailPresenterObject?.notedetailInteractor = NotedetailInteractor()
    }
}

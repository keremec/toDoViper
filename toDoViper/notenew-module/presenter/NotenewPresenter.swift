//
//  NotenewPresenter.swift
//  toDoViper
//
//  Created by Kerem Safa Dirican on 29.08.2022.
//

import Foundation

class NotenewPresenter: VtoP_NotenewProtocol {
    var notenewInteractor: PtoI_NotenewProtocol?

    func doCreateNote(note_title:String,note_detail:String) {
        notenewInteractor?.createNote(note_title: note_title, note_detail: note_detail)
    }
    
}

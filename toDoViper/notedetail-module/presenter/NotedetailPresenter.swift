//
//  NotedetailPresenter.swift
//  toDoViper
//
//  Created by Kerem Safa Dirican on 29.08.2022.
//

import Foundation

class NotedetailPresenter: VtoP_NotedetailProtocol {
    var notedetailInteractor: PtoI_NotedetailProtocol?

    func doUpdateNote(note_id:Int,note_title:String,note_detail:String) {
        notedetailInteractor?.updateNote(note_id: note_id, note_title: note_title, note_detail: note_detail)
    }
    
}

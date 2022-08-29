//
//  HomepagePresenter.swift
//  toDoViper
//
//  Created by Kerem Safa Dirican on 29.08.2022.
//

import Foundation

class HomepagePresenter:VtoP_HomepageProtocol{
    var homepageInteractor: PtoI_HomepageProtocol?
    
    var homepageView: PtoV_HomepageProtocol?
    
    func doLoadNote() {
        homepageInteractor?.loadNote()
    }
    
    func doSearchNote(searchString: String) {
        homepageInteractor?.searchNote(searchString: searchString)
    }
    
    func doDeleteNote(note_id: Int) {
        homepageInteractor?.deleteNote(note_id: note_id)
    }
    
    func doMarkNote(note_id: Int,value:Bool) {
        homepageInteractor?.markNote(note_id: note_id, value: value)
    }
    
    
}

extension HomepagePresenter: ItoP_HomepageProtocol{
    func dataSendtoPresenter(noteList: Array<Notes>) {
        homepageView?.dataSendtoView(noteList: noteList)
    }
    
    
}

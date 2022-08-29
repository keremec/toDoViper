//
//  HomepageInteractor.swift
//  toDoViper
//
//  Created by Kerem Safa Dirican on 29.08.2022.
//

import Foundation

class HomepageInteractor:PtoI_HomepageProtocol{
    var homepagePresenter: ItoP_HomepageProtocol?
    
    func loadNote() {
        
        var TESTnotesList = [Notes]()
        
        let n1 = Notes(note_id: 1, note_title: "Not1", note_detail: "ayrıntılar", note_status: false)
        
        let n2 = Notes(note_id: 2, note_title: "Not2", note_detail: "ayrıntılar2", note_status: true)
        
        TESTnotesList.append(n1)
        TESTnotesList.append(n2)
        
        homepagePresenter?.dataSendtoPresenter(noteList: TESTnotesList)
    }
    
    func searchNote(searchString: String) {
        var TESTnotesList = [Notes]()
        let n1 = Notes(note_id: 1, note_title: "Not1", note_detail: "ayrıntılar", note_status: false)
        
        TESTnotesList.append(n1)
        homepagePresenter?.dataSendtoPresenter(noteList: TESTnotesList)
    }
    
    func deleteNote(note_id: Int) {
        print("silindi")
        loadNote()
    }
    
    func markNote(note_id: Int) {
        print("isaretlendi")
        loadNote()
    }
    
    
    
}

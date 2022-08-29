//
//  NotedetailProtocol.swift
//  toDoViper
//
//  Created by Kerem Safa Dirican on 29.08.2022.
//

import Foundation

protocol VtoP_NotedetailProtocol {
    var notedetailInteractor:PtoI_NotedetailProtocol? {get set}
    
    func doUpdateNote(note_id:Int,note_title:String,note_detail:String)
}

protocol PtoI_NotedetailProtocol {
    func updateNote(note_id:Int,note_title:String,note_detail:String)
}

protocol PtoR_NotedetailProtocol {
    static func createModule(ref:NotedetailVC)
}

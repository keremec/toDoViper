//
//  Notes.swift
//  toDoViper
//
//  Created by Kerem Safa Dirican on 28.08.2022.
//

import Foundation

class Notes{
    var note_id:Int?
    var note_title:String?
    var note_detail:String?
    init(note_id:Int,note_title:String,note_detail:String) {
        self.note_id = note_id
        self.note_title = note_title
        self.note_detail = note_detail
    }
}

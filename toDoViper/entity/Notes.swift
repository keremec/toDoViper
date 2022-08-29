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
    var note_status:Bool?
    init(note_id:Int,note_title:String,note_detail:String,note_status:Bool) {
        self.note_id = note_id
        self.note_title = note_title
        self.note_detail = note_detail
        self.note_status = note_status
    }
}

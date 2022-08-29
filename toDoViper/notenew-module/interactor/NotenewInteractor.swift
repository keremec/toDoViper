//
//  NotenewInteractor.swift
//  toDoViper
//
//  Created by Kerem Safa Dirican on 29.08.2022.
//

import Foundation

class NotenewInteractor:PtoI_NotenewProtocol{
    
    let db:FMDatabase?
    
    init(){
        let destPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let copyPath = URL(fileURLWithPath: destPath).appendingPathComponent("notesDB.sqlite")
        db = FMDatabase(path: copyPath.path)
    }
    
    func createNote(note_title: String, note_detail: String){
        db?.open()
        do {
            try db!.executeUpdate("INSERT INTO notes (note_title, note_detail, note_status) VALUES (?,?,?)", values: [note_title,note_detail,0])
        }
        catch{
            print(error.localizedDescription)
        }
        
        
        db?.close()
    }
}

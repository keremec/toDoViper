//
//  HomepageInteractor.swift
//  toDoViper
//
//  Created by Kerem Safa Dirican on 29.08.2022.
//

import Foundation

class HomepageInteractor:PtoI_HomepageProtocol{
    var homepagePresenter: ItoP_HomepageProtocol?
    
    
    let db:FMDatabase?
    
    init(){
        let destPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let copyPath = URL(fileURLWithPath: destPath).appendingPathComponent("notesDB.sqlite")
        db = FMDatabase(path: copyPath.path)
    }
    
    func loadNote() {
        
        var list = [Notes]()
        
        db?.open()
        do {
            let q = try db!.executeQuery("SELECT * FROM notes", values: nil)
            while q.next(){
                let note = Notes (note_id: Int(q.string(forColumn: "note_id"))!,
                                  note_title: q.string(forColumn: "note_title")!,
                                  note_detail: q.string(forColumn: "note_detail")!,
                                  note_status: (Int(q.string(forColumn: "note_status"))! != 0))
                
                list.append(note)
                homepagePresenter?.dataSendtoPresenter(noteList: list)
            }
            
        }
        catch{
            print(error.localizedDescription)
        }
        
        db?.close()
    }
    
    func searchNote(searchString: String) {
        var list = [Notes]()
        
        db?.open()
        do {
            let q = try db!.executeQuery("SELECT * FROM notes WHERE note_title like '%\(searchString)%' ", values: nil)
            while q.next(){
                let note = Notes (note_id: Int(q.string(forColumn: "note_id"))!,
                                  note_title: q.string(forColumn: "note_title")!,
                                  note_detail: q.string(forColumn: "note_detail")!,
                                  note_status: (Int(q.string(forColumn: "note_status"))! != 0))
                
                list.append(note)
                list = list.sorted(by: { $0.note_status!.intValue < $1.note_status!.intValue })
                homepagePresenter?.dataSendtoPresenter(noteList: list)
            }
            
        }
        catch{
            print(error.localizedDescription)
        }
        
        
        db?.close()
    }
    
    func deleteNote(note_id: Int) {
        db?.open()
        do {
            try db!.executeUpdate("DELETE FROM notes WHERE note_id = ?", values: [note_id])
            loadNote()
        }
        catch{
            print(error.localizedDescription)
        }
    }
    
    func markNote(note_id: Int,value:Bool) {
        db?.open()
        do {
            try db!.executeUpdate("UPDATE notes SET note_status= ? WHERE note_id = ?", values: [value.intValue,note_id])
        }
        catch{
            print(error.localizedDescription)
        }
    }
    
    
    
}

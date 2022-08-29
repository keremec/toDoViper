//
//  HomepageProtocol.swift
//  toDoViper
//
//  Created by Kerem Safa Dirican on 28.08.2022.
//


// View <-> Presenter <-> Interactor


import Foundation



//MARK: Main Protocols

protocol VtoP_HomepageProtocol{
    var homepageInteractor:PtoI_HomepageProtocol? {get set}
    var homepageView:PtoV_HomepageProtocol? {get set}
    
    func doLoadNote()
    func doSearchNote(searchString:String)
    func doDeleteNote(note_id:Int)
    func doMarkNote(note_id:Int,value:Bool)
}

protocol PtoI_HomepageProtocol{
    
    var homepagePresenter:ItoP_HomepageProtocol? {get set}
    
    func loadNote()
    func searchNote(searchString:String)
    func deleteNote(note_id:Int)
    func markNote(note_id:Int,value:Bool)
}



// MARK: Transport Protocols

protocol ItoP_HomepageProtocol{
    func dataSendtoPresenter(noteList:Array<Notes>)
    
}

protocol PtoV_HomepageProtocol{
    func dataSendtoView(noteList:Array<Notes>)
}




//MARK: Router

protocol PtoR_HomepageProtocol{
    static func createModule(ref:HomepageVC)
}

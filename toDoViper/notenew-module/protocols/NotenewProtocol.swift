//
//  NotenewProtocol.swift
//  toDoViper
//
//  Created by Kerem Safa Dirican on 29.08.2022.
//

import Foundation

protocol VtoP_NotenewProtocol {
    var notenewInteractor:PtoI_NotenewProtocol? {get set}
    
    func doCreateNote(note_title:String,note_detail:String)
}

protocol PtoI_NotenewProtocol {
    func createNote(note_title:String,note_detail:String)
}

protocol PtoR_NotenewProtocol {
    static func createModule(ref:NotenewVC)
}

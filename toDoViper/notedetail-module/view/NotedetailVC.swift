//
//  NotedetailVC.swift
//  toDoViper
//
//  Created by Kerem Safa Dirican on 28.08.2022.
//

import UIKit

class NotedetailVC: UIViewController {
    
    weak var delegateSave:HomepageVC?
    
    var note:Notes?
    
    @IBOutlet weak var tfNoteTitle: UITextField!
    
    
    @IBOutlet weak var tfNoteDetail: UITextView!
    
    var notedetailPresenterObject:VtoP_NotedetailProtocol?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        NotedetailRouter.createModule(ref: self)
        tfNoteDetail.delegate = self
        if let n = note{
            tfNoteTitle.text = n.note_title
            tfNoteDetail.text = n.note_detail
            if(tfNoteDetail.text == ""){
                tfNoteDetail.textColor = UIColor.placeholderText
                tfNoteDetail.text = "Buraya Detayları Girebilirsiniz"
            }
            
            if(n.note_status!){
                tfNoteTitle.textColor = UIColor.placeholderText
            }
        }
        
    }
    
    @IBAction func pressSave(_ sender: Any) {
        if let title = tfNoteTitle.text, let detail = tfNoteDetail.textColor != UIColor.placeholderText ? tfNoteDetail.text : "", let note = note{
            notedetailPresenterObject?.doUpdateNote(note_id: note.note_id!, note_title: title, note_detail: detail)
        }
        delegateSave?.viewWillAppear(true)
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func pressCancel(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}


extension NotedetailVC:UITextViewDelegate{
    func textViewDidBeginEditing(_ textView: UITextView) {
        if tfNoteDetail.textColor == UIColor.placeholderText{
        tfNoteDetail.text = nil
        tfNoteDetail.textColor = UIColor.label
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if tfNoteDetail.text.isEmpty {
            tfNoteDetail.text = "Buraya Detayları Girebilirsiniz"
            tfNoteDetail.textColor = UIColor.placeholderText
        }
    }
    
}

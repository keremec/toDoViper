//
//  NotenewVC.swift
//  toDoViper
//
//  Created by Kerem Safa Dirican on 28.08.2022.
//

import UIKit

class NotenewVC: UIViewController {
    
    weak var delegateCreate:HomepageVC?
    
    @IBOutlet weak var tfNoteTitle: UITextField!
    
    
    @IBOutlet weak var tfNoteDetail: UITextView!
    
    var notenewPresenterObject:VtoP_NotenewProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotenewRouter.createModule(ref: self)
        tfNoteDetail.delegate = self
        
        tfNoteDetail.text = "Buraya Detayları Girebilirsiniz"
        tfNoteDetail.textColor = UIColor.placeholderText

        
    }
    
    
    @IBAction func pressSave(_ sender: Any) {
        if let title = tfNoteTitle.text, let detail = tfNoteDetail.textColor != UIColor.placeholderText ? tfNoteDetail.text : ""{
            notenewPresenterObject?.doCreateNote(note_title: title, note_detail: detail)
        }
        delegateCreate?.viewWillAppear(true)
        self.dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func pressCancel(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}


extension NotenewVC:UITextViewDelegate{
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

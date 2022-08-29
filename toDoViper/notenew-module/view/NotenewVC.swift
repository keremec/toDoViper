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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    
    @IBAction func pressSave(_ sender: Any) {
    }
    
    
    @IBAction func pressCancel(_ sender: Any) {
    }
    
}


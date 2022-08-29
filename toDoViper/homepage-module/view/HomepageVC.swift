//
//  ViewController.swift
//  toDoViper
//
//  Created by Kerem Safa Dirican on 27.08.2022.
//

import UIKit

class HomepageVC: UIViewController {

    @IBOutlet weak var counterLabel: UILabel!
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    @IBOutlet weak var notesTableView: UITableView!
    
    var notesList = [Notes]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        notesTableView.delegate = self
        notesTableView.dataSource = self
        
        let n1 = Notes(note_id: 1, note_title: "Not1", note_detail: "ayrıntılar", note_status: false)
        
        let n2 = Notes(note_id: 2, note_title: "Not2", note_detail: "ayrıntılar2", note_status: true)
        
        notesList.append(n1)
        notesList.append(n2)
        
        
    }

    
    override func viewWillAppear(_ animated: Bool) {
        
    }
    

    
    
}


extension HomepageVC: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notesList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let note = notesList[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "noteCell", for: indexPath) as! TableViewNoteCell
        
        cell.noteLabel.text = note.note_title
        if(note.note_status!){
            cell.noteStatus.setImage(UIImage(systemName: "circle.inset.filled"), for: .normal)
            cell.noteStatus.tintColor = UIColor.tintColor
        }
        else{
            cell.noteStatus.setImage(UIImage(systemName: "circle"), for: .normal)
            cell.noteStatus.tintColor = UIColor.white

        }
        
        
        return cell
        
        
    }
    
    
    
}

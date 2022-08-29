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
    
    var homepagePresenterObject:VtoP_HomepageProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar.delegate = self
        notesTableView.delegate = self
        notesTableView.dataSource = self
        copyDB()
        
        HomepageRouter.createModule(ref: self)

    }
    
    override func viewWillAppear(_ animated: Bool) {
        homepagePresenterObject?.doLoadNote()
        updateCounter()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "toDetail":
            if let note = sender as? Notes{
                let goalVC = segue.destination as! NotedetailVC
                goalVC.delegateSave = self
                goalVC.note = note
            }
            
        default:
            print("identifier not found")
            
        }
    }
    
    @IBAction func cellButton(_ sender: UIButton) {
        let note = self.notesList[sender.tag]
        homepagePresenterObject?.doMarkNote(note_id: note.note_id!, value: !(note.note_status!))
        homepagePresenterObject?.doSearchNote(searchString: searchBar.text!)
    }
    

}



extension HomepageVC: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notesList.count
    }
    
    //MARK: Adding Cells
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let note = notesList[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "noteCell", for: indexPath) as! TableViewNoteCell
        
        cell.noteLabel.text = note.note_title
        cell.noteStatus.tag = indexPath.row
        
        if(note.note_status!){
            cell.noteStatus.setImage(UIImage(systemName: "circle.inset.filled"), for: .normal)
            cell.noteStatus.tintColor = UIColor.tintColor
            cell.noteLabel.textColor = UIColor.placeholderText
        }
        else{
            cell.noteStatus.setImage(UIImage(systemName: "circle"), for: .normal)
            cell.noteStatus.tintColor = UIColor.placeholderText
            cell.noteLabel.textColor = UIColor.label

        }
        
        return cell
        
    }
    
    
    
    //MARK: Tableview Selection

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let note = notesList[indexPath.row]
        performSegue(withIdentifier: "toDetail", sender: note)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    //MARK: Tableview Swipe Actions
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let note = self.notesList[indexPath.row]
        
        if (note.note_status!){
            let deleteAction = UIContextualAction(style: .normal, title: "Temizle"){(contextualAction, view, bool ) in
                if self.notesList.count == 1{
                    print(self.notesList.count)
                    self.homepagePresenterObject?.doDeleteNote(note_id: note.note_id!)
                    _ = self.notesList.popLast()
                    self.updateCounter()
                    self.notesTableView.reloadData()
                }
                else{
                    self.homepagePresenterObject?.doDeleteNote(note_id: note.note_id!)
                    self.homepagePresenterObject?.doSearchNote(searchString: self.searchBar.text!)
                }
            }
            return UISwipeActionsConfiguration(actions: [deleteAction])
            
        }
        else{
            let deleteConfirmAction = UIContextualAction(style: .destructive, title: "Sil"){ (contextualAction, view, bool ) in
                let alert = UIAlertController(title: "Silme İşlemi", message: "Bu not silinsin mi?", preferredStyle: .alert)
                
                let cancelAction = UIAlertAction(title: "İptal", style: .cancel)
                
                alert.addAction(cancelAction)
                
                let evetAction = UIAlertAction(title: "Evet", style: .destructive){action in
                    if self.notesList.count == 1{
                        print(self.notesList.count)
                        self.homepagePresenterObject?.doDeleteNote(note_id: note.note_id!)
                        _ = self.notesList.popLast()
                        self.updateCounter()
                        self.notesTableView.reloadData()
                    }
                    else{
                        self.homepagePresenterObject?.doDeleteNote(note_id: note.note_id!)
                        self.homepagePresenterObject?.doSearchNote(searchString: self.searchBar.text!)
                    }
                }
                alert.addAction(evetAction)
                
                self.present(alert, animated: true)
                
            }
            return UISwipeActionsConfiguration(actions: [deleteConfirmAction])
        }

    }

}



//MARK: Load Notes

extension HomepageVC:PtoV_HomepageProtocol{
    func dataSendtoView(noteList: Array<Notes>) {
        self.notesList = noteList
        self.updateCounter()
        self.notesTableView.reloadData()
    }
}


//MARK: Search Notes

extension HomepageVC:UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        homepagePresenterObject?.doSearchNote(searchString: searchText)
    }
}


func copyDB(){
    let bundlePath = Bundle.main.path(forResource: "notesDB", ofType: ".sqlite")
    let destPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
    let copyPath = URL(fileURLWithPath: destPath).appendingPathComponent("notesDB.sqlite")
    let fm = FileManager.default
    if fm.fileExists(atPath: copyPath.path){
        print("db exist")
    }
    else{
        do{
            try fm.copyItem(atPath: bundlePath!, toPath: copyPath.path)
        }
        catch{
            print(error.localizedDescription)
        }
    }
}


extension HomepageVC{
    func updateCounter(){
        let filteredList = notesList.filter{ i in
            i.note_status == false
        }
        counterLabel.text = String(filteredList.count)
    }
}



extension Bool {
    var intValue: Int {
        return self ? 1 : 0
    }
}

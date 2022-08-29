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
        HomepageRouter.createModule(ref: self)

    }
    
    override func viewWillAppear(_ animated: Bool) {
        homepagePresenterObject?.doLoadNote()
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
                print("Silindi")
            }
            return UISwipeActionsConfiguration(actions: [deleteAction])
            
        }
        else{
            let deleteConfirmAction = UIContextualAction(style: .destructive, title: "Sil"){ (contextualAction, view, bool ) in
                let alert = UIAlertController(title: "Silme İşlemi", message: "Bu not silinsin mi?", preferredStyle: .alert)
                
                let cancelAction = UIAlertAction(title: "İptal", style: .cancel)
                
                alert.addAction(cancelAction)
                
                let evetAction = UIAlertAction(title: "Evet", style: .destructive){action in
                    //self.anasayfaPresenterNesnesi?.sil(kisi_id: kisi.kisi_id!)
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
        self.notesTableView.reloadData()
    }
}


//MARK: Search Notes

extension HomepageVC:UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        homepagePresenterObject?.doSearchNote(searchString: searchText)
    }
}



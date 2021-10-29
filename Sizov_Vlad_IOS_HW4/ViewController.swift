//
//  ViewController.swift
//  Sizov_Vlad_IOS_HW4
//
//  Created by user on 29.10.2021.
//

import UIKit
import CoreData

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource{
    
    @IBOutlet weak var emptyCollectionLabel: UILabel!
    @IBOutlet weak var notesCollectionView: UICollectionView!
    
    

    
    override func viewDidLoad() {
     super.viewDidLoad()

     navigationItem.rightBarButtonItem =
    UIBarButtonItem(barButtonSystemItem: .add, target: self, action:
    #selector(createNote(sender:)))
     }
    
    @objc func createNote(sender: UIBarButtonItem) {
     guard let vc =
    storyboard?.instantiateViewController(withIdentifier:
    "NoteViewController") as? NoteViewController else {
     return
     }
     vc.outputVC = self
     navigationController?.pushViewController(vc, animated: true)
     }
    
    var notes: [Note] = [] {
     didSet {
     emptyCollectionLabel.isHidden = notes.count != 0
     notesCollectionView.reloadData()
     }
     }
    func collectionView(_ collectionView: UICollectionView,
    numberOfItemsInSection section: Int) -> Int {
     return notes.count
     }

     func collectionView(_ collectionView: UICollectionView,
    cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
     let cell =
    collectionView.dequeueReusableCell(withReuseIdentifier:
    "NoteCell", for: indexPath) as! NoteCell
     let note = notes[indexPath.row]
     cell.titleLabel.text = note.title
     cell.descriptionLabel.text = note.description

     return cell
     }
    
    
    
    
    
}
 

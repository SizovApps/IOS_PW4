//
//  NoteViewController.swift
//  Sizov_Vlad_IOS_HW4
//
//  Created by user on 29.10.2021.
//

import UIKit



class NoteViewController : UIViewController {
    
    
    @IBOutlet weak var titleTextField: UITextField!
    
    
    @IBOutlet weak var textView: UITextView!
    
    var outputVC: ViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem =
            UIBarButtonItem(barButtonSystemItem: .done, target: self, action:
                                #selector(didTapSaveNote(button:)))
    }
    
    
    @objc func didTapSaveNote(button: UIBarButtonItem) {
     let title = titleTextField.text ?? ""
     let descriptionText = textView.text ?? ""
     if !title.isEmpty {
     let newNote = Note(context: outputVC.context)
     newNote.title = title
     newNote.descriptionText = descriptionText
     newNote.creationDate = Date()
     outputVC.saveChanges()
     }
     self.navigationController?.popViewController(animated: true)
     }
    
    
    
    
}


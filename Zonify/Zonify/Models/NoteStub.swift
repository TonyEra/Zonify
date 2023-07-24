//
//  Board+Stub.swift
//  Zonify
//
//  Created by My Mac on 7/23/23.
//

import Foundation

extension NoteBook {
    
    static var stub: NoteBook {
        let notebook = NoteBook(name: "Home")
        let notes = NoteList(name: "Backlog", noteId: notebook.id)

        notebook.lists = [
             notes
         ]
        return notebook
    }
}

//
//  NoteListView.swift
//  Zonify
//
//  Created by My Mac on 7/23/23.
//

import SwiftUI
import Introspect

struct NoteListView: View {
    
    @ObservedObject var noteBook: NoteBook
    @StateObject var noteList: NoteList
    
    @State var noteHeight: CGFloat = 0
    
    let noteListBackgroundColor = Color(uiColor: UIColor(red: 0.92, green: 0.92, blue: 0.94, alpha: 1))
    let bgColor = Color(uiColor: UIColor(red: 0.2, green: 0.37, blue: 0.23, alpha: 1))
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            headerView
                .listStyle(.plain)
                .frame(maxHeight: noteHeight)
            .padding(.horizontal)
            .frame(maxWidth: .infinity, alignment: .center)
        }
        .padding(.vertical)
        .background(noteListBackgroundColor)
        .frame(width: UIScreen.main.bounds.width - 30)
        .cornerRadius(8)
        .foregroundColor(.black)
    }
    
    private var headerView: some View {
        HStack(alignment: .top) {
            Text(noteList.name)
                .font(.headline)
                .lineLimit(2)
            
            Spacer()
            
            Menu {
                Button("Rename") {
                    handleNoteListRename()
                }
                
                Button("Delete", role: .destructive) {
                    noteBook.removeNoteList(noteList)
                }
                
            } label: {
                Image(systemName: "ellipsis.circle")
                    .imageScale(.large)
            }
        }
        .padding(.horizontal)
    }
    
    private func handleNoteListRename() {
        presentAlertTextField(title: "Rename Note", defaultTextFieldText: noteList.name) { text in
            guard let text = text, !text.isEmpty else {
                return
            }
            noteList.name = text
        }
    }
    
}

struct NoteListView_Previews: PreviewProvider {
    
    @StateObject static var notebook = NoteBook.stub
    
    static var previews: some View {
        NoteListView(noteBook: notebook, noteList: notebook.lists[0], noteHeight: 512)
            .previewLayout(.sizeThatFits)
            .frame(width: 300, height: 512)
    }
}

//
//  HomeView.swift
//  Zonify
//
//  Created by My Mac on 7/21/23.
//

import SwiftUI

let boardListBackgroundColor = Color(uiColor: UIColor(red: 0.92, green: 0.94, blue: 0.94, alpha: 1))
let bgColor = Color(uiColor: UIColor(red: 0.1, green: 0.25, blue: 0.2, alpha: 1))

struct NoteBookView: View {
    @StateObject private var board: NoteBook = NoteBook.stub
    @State private var dragging: NoteList?
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical) {
                LazyVStack(alignment: .leading, spacing: 30) {
                    ForEach(board.lists) { boardList in
                        NoteListView(noteBook: board, noteList: boardList)
                            .onDrag({
                                self.dragging = boardList
                                return NSItemProvider(object: boardList)
                            })
                    }
                    
                    Button("+ Add Note") {
                        handleAddNote()
                    }
                    .frame(maxWidth: UIScreen.main.bounds.width - 30)
                    .padding()
                    .background(boardListBackgroundColor.opacity(0.8))
                    .frame(width: 300)
                    .cornerRadius(8)
                    .foregroundColor(.black)
                }
                .padding()
                .animation(.default, value: board.lists)
            }
            .background(bgColor)
            //.background(Image("image").resizable().scaledToFill())
            .edgesIgnoringSafeArea(.bottom)
            .navigationTitle(board.name)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                Button("Rename") {
                    handleRenameNoteBook()
                }
            }
        }
        .navigationViewStyle(.stack)
    }
    
    private func handleAddNote() {
        presentAlertTextField(title: "Add Note") { text in
            guard let text = text, !text.isEmpty else {
                return
            }
            board.addNewNoteListWithName(text)
        }
    }
    
    private func handleRenameNoteBook() {
        presentAlertTextField(title: "Rename NoteBook", defaultTextFieldText: board.name) { text in
            guard let text = text, !text.isEmpty else {
                return
            }
            board.name = text
        }
    }
    
}

struct NoteBookView_Previews: PreviewProvider {
    static var previews: some View {
        NoteBookView()
    }
}

//
//  NoteBook.swift
//  Zonify
//
//  Created by My Mac on 7/23/23.
//

import Foundation

class NoteBook: ObservableObject, Identifiable, Codable {
    
    private(set) var id = UUID()
    @Published var name: String
    @Published var lists: [NoteList]
    
    enum CodingKeys: String, CodingKey {
        case id, name, lists
    }
        
    init(name: String, lists: [NoteList] = []) {
        self.name = name
        self.lists = lists
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(UUID.self, forKey: .id)
        self.name = try container.decode(String.self, forKey: .name)
        self.lists = try container.decode([NoteList].self, forKey: .lists)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(name, forKey: .name)
        try container.encode(lists, forKey: .lists)
    }
    
    func addNewNoteListWithName(_ name: String) {
        lists.append(NoteList(name: name, noteId: id))
    }
    
    func removeNoteList(_ noteList: NoteList) {
        guard let index = noteListIndex(id: noteList.id) else { return }
        lists.remove(at: index)
    }
    
    private func noteListIndex(id: UUID) -> Int? {
        lists.firstIndex { $0.id == id }
    }
    
}

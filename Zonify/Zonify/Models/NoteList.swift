//
//  NoteList.swift
//  Zonify
//
//  Created by My Mac on 7/23/23.
//

import Foundation

class NoteList: NSObject, ObservableObject, Identifiable, Codable {
    
    private(set) var id = UUID()
    var noteId: UUID
    
    @Published var name: String
    
    enum CodingKeys: String, CodingKey {
        case id, noteId, name, cards
    }
    
    init(name: String, noteId: UUID) {
        self.name = name
        self.noteId = noteId
        super.init()
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(UUID.self, forKey: .id)
        self.noteId = try container.decode(UUID.self, forKey: .noteId)
        self.name = try container.decode(String.self, forKey: .name)
        super.init()
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(noteId, forKey: .noteId)
        try container.encode(name, forKey: .name)
    }
    
}

extension NoteList: NSItemProviderWriting {
    
    static let typeIdentifier = "com.zonify.NoteList"
    
    static var writableTypeIdentifiersForItemProvider: [String] {
        [typeIdentifier]
    }
    
    func loadData(withTypeIdentifier typeIdentifier: String, forItemProviderCompletionHandler completionHandler: @escaping (Data?, Error?) -> Void) -> Progress? {
        do {
            let encoder = JSONEncoder()
            encoder.outputFormatting = .prettyPrinted
            completionHandler(try encoder.encode(self), nil)
        } catch {
            completionHandler(nil, error)
        }
        return nil
    }
    
}

extension NoteList: NSItemProviderReading {
    
    static var readableTypeIdentifiersForItemProvider: [String] {
        [typeIdentifier]
    }
    
    static func object(withItemProviderData data: Data, typeIdentifier: String) throws -> Self {
        try JSONDecoder().decode(Self.self, from: data)
    }
    
}

//
//  NoteManager.swift
//  Note App
//
//  Created by ebdesk-066 on 26/07/19.
//  Copyright © 2019 irig.com. All rights reserved.
//

import Foundation

class NoteManager {
    var notes = [Note]()
    
    init() {
        let defaults = UserDefaults.standard
        if let savedNotes = defaults.object(forKey: "note") as? Data {
            let jsonDecoder = JSONDecoder()
            do {
                self.notes = try jsonDecoder.decode([Note].self, from: savedNotes)
                print("success load notes = \(notes.count)")
            } catch {
                print("Failed load note")
            }
        }
    }
    
    public var notesCount: Int{
        return notes.count
    }
    
    public func note(at index: Int) -> Note {
        return notes[index]
    }
    
    public func add(note: Note, at index: Int) {
        notes.insert(note, at: index)
        save()
    }
    
    public func delete(at index: Int) {
        notes.remove(at: index)
        save()
    }
    
    public func edit(note: Note, at index: Int) {
        notes[index] = note
        save()
    }
    
    func save() {
        let jsonEncoder = JSONEncoder()
        if let savedData = try? jsonEncoder.encode(notes) {
            let defaults = UserDefaults.standard
            defaults.set(savedData, forKey: "note")
        } else {
            print("Failed to save people.")
        }
    }
    
}

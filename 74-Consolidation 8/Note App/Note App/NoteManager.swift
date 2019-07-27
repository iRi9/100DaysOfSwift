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
    
    public var notesCount: Int{
        return notes.count
    }
    
    public func note(at index: Int) -> Note {
        return notes[index]
    }
    
    public func add(note: Note) {
        notes.append(note)
    }
    
    public func delete(at index: Int) {
        notes.remove(at: index)
    }
    
    public func edit(note: Note, at index: Int) {
        notes[index] = note
    }
    
}

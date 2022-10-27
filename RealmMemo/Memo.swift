//
//  Memo.swift
//  RealmMemo
//
//  Created by Owner on 2022/10/26.
//

import Foundation
import RealmSwift

class Memo: Object {
    @objc dynamic var text: String = ""
    @objc dynamic var isMarked: Bool = false
}

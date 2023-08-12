//
//  TodoDetayViewModel.swift
//  todo
//
//  Created by ozlemkumtas on 12.08.2023.
//

import Foundation

class TodoDetayViewModel {

    var krepo = TodoDaoRepository()

    func guncelle (id:Int, name: String){
        print("update todo: \(id) - \(name)")

    }
}

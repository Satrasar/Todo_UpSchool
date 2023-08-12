//
//  TodoDaoRepository.swift
//  todo
//
//  Created by ozlemkumtas on 12.08.2023.
//

import Foundation
import RxSwift

class TodoDaoRepository {
    var todoListesi = BehaviorSubject<[Todo]>(value: [Todo]())//BehaviorSubject En son yayılan değeri hafızada tutar.
    func kaydet (whats_up :  String){
        print("todo kaydet : \(whats_up)")
    }

    func guncelle (id:Int, name: String){
        print("update todo: \(id) - \(name)")
    }

    func sil(id:Int){
        print("Delete : \(id)")
    }

    func ara(aramaKelimesi: String){
        print("Todo Ara: \(aramaKelimesi)")
    }

    func TodoYukle(){
        var liste = [Todo]()
        let t1 = Todo(id: 1, name:"Study Swift")
        let t2 = Todo(id: 2, name:"Go to GYM")
        liste.append(t1)
        liste.append(t2)
        todoListesi.onNext(liste)//tetikleme:todoListesini nerede dinliyorsak oraya tetikleme gondericez

    }

}


//
//  AnasayfaViewModel.swift
//  todo
//
//  Created by ozlemkumtas on 12.08.2023.
//

import Foundation
import RxSwift

class AnasayfaViewModel {
    var krepo = TodoDaoRepository()
    var todoListesi = BehaviorSubject<[Todo]>(value: [Todo]())

    init(){
        todoListesi = krepo.todoListesi //bu baglanti sayesinde repodan tetiklenebilir
    }

    func sil(id:Int){
        krepo.sil(id: id)
        TodoYukle()
    }

    func ara(aramaKelimesi: String){
        krepo.ara(aramaKelimesi: aramaKelimesi)
    }

    func TodoYukle(){
        krepo.TodoYukle()
    }
}

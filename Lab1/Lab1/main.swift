//
//  main.swift
//  Lab1
//
//  Created by DA on 27/02/2023.
//

import Foundation
var cont = true
repeat{
    print("Wpisz koszt dzialalnosci")
    let kosz_dz = wpisywanieLiczby()
    print("Wpisz koszt jednego produktu")
    let koszt_jed_prod = wpisywanieLiczby()
    print("Wpisz ilosc produktow")
    let ilosc = wpisywanieLiczby()
    print("Wpisz marze")
    let marza = wpisywanieLiczby()

    var result_for_single = wyliczanieWartosciDlaJednego(kosz_dz: kosz_dz, koszt_jed_prod: koszt_jed_prod, ilosc: ilosc, marza: marza)
    var result_for_all = wyliczanieWartosciDlaWszystkich(kosz_dz: kosz_dz, koszt_jed_prod: koszt_jed_prod, ilosc: ilosc, marza: marza)
    
    print("##########################")
    print("Cena jednego produktu = \(result_for_single)")
    print("Cena wszystkich produktow = \(result_for_all)")
    print("Caly zysk = \(result_for_all - (kosz_dz  + koszt_jed_prod * ilosc))")
    
    print("##########################X10")
    result_for_single = wyliczanieWartosciDlaJednego(kosz_dz: kosz_dz, koszt_jed_prod: koszt_jed_prod, ilosc: ilosc * 10, marza: marza)
    result_for_all = wyliczanieWartosciDlaWszystkich(kosz_dz: kosz_dz, koszt_jed_prod: koszt_jed_prod, ilosc: ilosc * 10, marza: marza)
    print("Cena jednego produktu = \(result_for_single)")
    print("Cena wszystkich produktow = \(najblizszaPotenga(liczba: result_for_all))")
    print("Caly zysk = \(najblizszaPotenga(liczba: result_for_all - (kosz_dz  + koszt_jed_prod * ilosc * 10)))")
    
    print("##########################X100")
    result_for_single = wyliczanieWartosciDlaJednego(kosz_dz: kosz_dz, koszt_jed_prod: koszt_jed_prod, ilosc: ilosc * 100, marza: marza)
    result_for_all = wyliczanieWartosciDlaWszystkich(kosz_dz: kosz_dz, koszt_jed_prod: koszt_jed_prod, ilosc: ilosc * 100, marza: marza)
    print("Cena jednego produktu = \(result_for_single)")
    print("Cena wszystkich produktow = \(najblizszaPotenga(liczba:result_for_all))")
    print("Caly zysk = \(najblizszaPotenga(liczba:result_for_all - (kosz_dz  + koszt_jed_prod * ilosc * 100)))")
    print("##########################")

    print("Wpisz dowolna liczbe jesli chcesz contynuwowac. Wpisz '0' jesli chcesz skonczyc")
    let liczbaDoKontroli = wpisywanieLiczby()
    if liczbaDoKontroli == 0{
        cont = false
    }
}while cont



func wpisywanieLiczby() -> Double{
    repeat{
        guard let str = readLine(), let liczba = Double(str)else{
            print("Nieprawidlowo wpisana liczba. Sprobuj ponownie!")
            continue
        }
        return liczba
    }while true
}

func najblizszaPotenga(liczba:Double) -> Double{
    var result = 1.0
    repeat{
        result *= 10
        if result >= liczba{
            return result
        }
        else{
            continue
        }
    }while  true
}

func wyliczanieWartosciDlaJednego(kosz_dz: Double, koszt_jed_prod: Double, ilosc: Double, marza: Double) -> Double{
    return (1 + marza / 100) * koszt_jed_prod + (kosz_dz / ilosc)
}

func wyliczanieWartosciDlaWszystkich(kosz_dz: Double, koszt_jed_prod: Double, ilosc: Double, marza: Double) -> Double{
    return (1 + marza / 100) * koszt_jed_prod  * ilosc + kosz_dz
}

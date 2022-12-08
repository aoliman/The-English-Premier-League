//
//  UserDefaultsWrapper.swift
//  The English Premier League
//
//  Created by Soliman Yousry on 08/12/2022.
//

import Foundation

public enum UserDefaultsKey: String {
    case favoriteIds = "Favorite_Ids"
}

public struct UserDefaultsManger {

   static  public var favMatches: Set<Int>? {
        get {
            let array = UserDefaults.standard.array(forKey: UserDefaultsKey.favoriteIds.rawValue) as? [Int] ?? [Int]()
            return  Set(array)
        }
        set {
            if newValue != nil {
                UserDefaults.standard.set(Array(newValue!), forKey: UserDefaultsKey.favoriteIds.rawValue)
            } else {
                UserDefaults.standard.removeObject(forKey: UserDefaultsKey.favoriteIds.rawValue)
            }
        }
    }

}

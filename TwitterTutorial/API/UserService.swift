//
//  UserService.swift
//  TwitterTutorial
//
//  Created by haeseongJung on 2022/03/13.
//

import Firebase

struct UserService {
    static let shared = UserService()
    
    func fetchUser(uid: String, completion: @escaping(User) -> Void) {
        REF_USERS.child(uid).observeSingleEvent(of: .value) { snapshot in
            guard let dictionary = snapshot.value as? [String: AnyObject] else { return }
            guard let username = dictionary["username"] as? String else { return }

            let user = User(uid: uid, dictionary: dictionary)
            completion(user)
        }
    }
}

//
//  GreetingViewModelProtocol.swift
//  MVVM
//
//  Created by Вячеслав Квашнин on 02.05.2022.
//

protocol GreetingViewModelProtocol {
    var greeting: String? { get }
    var greetingDidChange: ((GreetingViewModelProtocol) -> Void)? { get set }
    init(person: Person)
    func showGreeting()
}

class GreetingViewModel: GreetingViewModelProtocol {
    var greeting: String? {
        didSet {
            greetingDidChange?(self)
        }
    }
    
    var greetingDidChange: ((GreetingViewModelProtocol) -> Void)?
    
    private let person: Person
    required init(person: Person) {
        self.person = person
    }
    
    func showGreeting() {
        greeting = "Hello \(person.name) \(person.surname)"
    }
}

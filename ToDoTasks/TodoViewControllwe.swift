//
//  TodoViewControllwe.swift
//  ToDoTasks
//
//  Created by Desislava Borisova on 12/2/21.
//

import UIKit

protocol TodoViewControllerDelegate: AnyObject {
    func todoViewController(_ vc: TodoViewController, didSaveTodo: Todo)
}

class TodoViewController: UIViewController{
    
    @IBOutlet weak var textfield: UITextField!
    var todo: Todo?
    
    weak var delegate: TodoViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textfield.text = todo?.title
    }
    
    @IBAction func save(_ sender: Any) {
        let todo = Todo(title: textfield.text!)
        delegate?.todoViewController(self, didSaveTodo: todo)
    }
    
}

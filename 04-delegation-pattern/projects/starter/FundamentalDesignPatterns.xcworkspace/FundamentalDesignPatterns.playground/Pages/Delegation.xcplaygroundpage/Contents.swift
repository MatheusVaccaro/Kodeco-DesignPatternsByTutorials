/*:
 [Previous](@previous)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Next](@next)
 
 # Delegation
 - - - - - - - - - -
 ![Delegation Diagram](Delegation_Diagram.png)
 
 The delegation pattern allows an object to use a helper object to perform a task, instead of doing the task itself.
 
 This allows for code reuse through object composition, instead of inheritance.
 
 ## Code Example
 */
import UIKit

// MARK: - MenuViewControllerDelegate

protocol MenuViewControllerDelegate: AnyObject {
    
    // MARK: Internal Methods
    
    func menuViewController(_ menuViewController: MenuViewController, didSelectItemAtIndex index: Int)
    
}

// MARK: - MenuViewController

final class MenuViewController: UIViewController {
    
    // MARK: Outlets
    
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.dataSource = self
            tableView.delegate = self
        }
    }
    
    // MARK: Internal Properties
    
    weak var delegate: MenuViewControllerDelegate?
    
    // MARK: Private Properties
    
    private let items = [
        "Item 1", "Item 2", "Item 3"
    ]
    
}

// MARK: - UITableViewDataSource

extension MenuViewController: UITableViewDataSource {
    
    // MARK: Internal Methods
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        cell.textLabel?.text = items[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
}

// MARK: - UITableViewDelegate

extension MenuViewController: UITableViewDelegate {
    
    // MARK: Internal Methods
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.menuViewController(self, didSelectItemAtIndex: indexPath.row)
    }
    
}

import UIKit

class EmployeeListVC: UIViewController {

    @IBOutlet weak var tblEmployee: UITableView!
    
    private let manager = EmployeeManager()
    var employees: [User]? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.title = "Employees List"
        employees = manager.fetchEmployee()
        if(employees != nil && employees?.count != 0) {
            self.tblEmployee.reloadData()
        }
    }
    

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        if(segue.identifier == SegueIdentifier.navigateToEmployeeDetailView) {
            let detailsView = segue.destination as? DetailVC
            guard detailsView != nil else {return}
            detailsView?.selectedEmployee = self.employees![self.tblEmployee.indexPathForSelectedRow!.row]
        }
    }
    

}

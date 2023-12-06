import UIKit

class DetailVC: UIViewController {

    @IBOutlet weak var imgProfilePicture: UIImageView!
    @IBOutlet weak var txtEmployeeName: UITextField!
    @IBOutlet weak var txtEmployeeEmailId: UITextField!

    private let manager = EmployeeManager()
    var selectedEmployee: User? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewWillSetup()
    }
    
    func viewWillSetup() {
        self.txtEmployeeName.text = selectedEmployee?.name
        self.txtEmployeeEmailId.text = selectedEmployee?.email
        self.imgProfilePicture.image = UIImage(data: (selectedEmployee?.profilePicture)!)
    }
    
    
    @IBAction func updateButtonTapped(_ sender: Any) {
        
        let user = User(name: self.txtEmployeeName.text, email: self.txtEmployeeEmailId.text, profilePicture: self.imgProfilePicture.image?.pngData(), id: selectedEmployee!.id)

        if(manager.updateEmployee(employee: user))
        {
           displayAlert(alertMessage: "Record Updated")
        }else
        {
            displayErrorAlert()
        }
    }
    
    @IBAction func deleteButtonTapped(_ sender: Any) {
        
        if(manager.deleteEmployee(employee: selectedEmployee!)) {
            displayAlert(alertMessage: "Record deleted")
        }
        else
        {
            displayErrorAlert()
        }
    }
    
    @IBAction func selectImage(_ sender: Any) {
        let picker = UIImagePickerController()
        picker.sourceType = .savedPhotosAlbum
        picker.delegate = self
        present(picker, animated: true)
    }
    
    private func displayAlert(alertMessage:String)
    {
        let alert = UIAlertController(title: "Alert", message: alertMessage, preferredStyle: .alert)

        let okAction = UIAlertAction(title: "Ok", style: .default) { (action) in
            self.navigationController?.popViewController(animated: true)
        }
        alert.addAction(okAction)
        self.present(alert, animated: true)
    }
    
    private func displayErrorAlert()
    {
        let errorAlert = UIAlertController(title: "Alert", message: "Something went wrong, please try again later", preferredStyle: .alert)

        let okAction = UIAlertAction(title: "ok", style: .default, handler: nil)
        errorAlert.addAction(okAction)
        self.present(errorAlert, animated: true)
    }
    

}

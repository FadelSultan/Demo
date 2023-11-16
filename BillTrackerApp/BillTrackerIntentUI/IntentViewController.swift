//
//  IntentViewController.swift
//  BillTrackerIntentUI
//
//  Created by Fadel Sultan on 15/11/2023.
//

import IntentsUI

// As an example, this extension's Info.plist has been configured to handle interactions for INSendMessageIntent.
// You will want to replace this or add other intents as appropriate.
// The intents whose interactions you wish to handle must be declared in the extension's Info.plist.

// You can test this example integration by saying things to Siri like:
// "Send a message using <myApp>"

class IntentViewController: UIViewController, INUIHostedViewControlling {
    
    @IBOutlet weak var tableview: UITableView!
    var billData = [[String: Any]]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableview.tableFooterView = UIView()
            if let userDefaults = UserDefaults(suiteName: "group.com.fadeldev.temp") {
                if let billData = userDefaults.array(forKey: "BillData") as? [[String: Any]] {
                   self.billData = billData
                   self.tableview.reloadData()
                }
            }
        
    }
        
    // MARK: - INUIHostedViewControlling
    
    // Prepare your view controller for the interaction to handle.
    func configureView(for parameters: Set<INParameter>, of interaction: INInteraction, interactiveBehavior: INUIInteractiveBehavior, context: INUIHostedViewContext, completion: @escaping (Bool, Set<INParameter>, CGSize) -> Void) {
        // Do configuration here, including preparing views and calculating a desired size for presentation.
        completion(true, parameters, self.desiredSize)
    }
    
    var desiredSize: CGSize {
        return self.extensionContext!.hostedViewMaximumAllowedSize
    }
    
}


extension IntentViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.billData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            
        let bill = billData[indexPath.row]
        if let billName = bill["title"] as? String, let price = bill["price"] as? Int {
            cell.textLabel?.text = billName
            cell.detailTextLabel?.text = price.description
        }
        return cell
    }
}

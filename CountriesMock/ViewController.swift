import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    private var countries: [Country] = [] {
        didSet {
            self.tableView.reloadData()
        }
    }
    
    private let network = Network()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nib = UINib(nibName: "CountryTableViewCell", bundle: nil)
        self.tableView.register(nib, forCellReuseIdentifier: CountryTableViewCell.reuseIdentifier)

        self.navigationItem.title = "Countries"
        
        Task { @MainActor in
            do {
                self.countries = try await self.network.fetchCountries()
            }
            catch {
                //TODO: Handle error.
                print("QQQ: \(error)")
            }
        }
    }
}


extension ViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        self.tableView.reloadData()
    }
}


extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.countries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CountryTableViewCell.reuseIdentifier, for: indexPath) as? CountryTableViewCell else {
            return UITableViewCell()
        }
        
        let country = self.countries[indexPath.row]
        
        cell.name.text = "\(country.name), \(country.region)"
        cell.capital.text = country.capital
        cell.code.text = country.code
        
        return cell
    }
    
    
}


extension ViewController: UITableViewDelegate {
}

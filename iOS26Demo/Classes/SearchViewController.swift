import UIKit


class SearchViewController: UIViewController {
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "abc")
        tableView.dataSource = self
        tableView.rowHeight = 60.0
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.keyboardDismissMode = .onDrag
        return tableView
    }()

    lazy var searchController: UISearchController = {
        let controller = UISearchController(searchResultsController: nil)
        controller.searchBar.searchBarStyle = .minimal
        controller.searchBar.placeholder = "搜索学校"
        return controller
    }()

    let schoolArray = ["清华大学", "北京大学", "中国人民大学", "北京交通大学", "北京工业大学",
                       "北京航空航天大学", "北京理工大学", "北京科技大学", "中国政法大学",
                       "中央财经大学", "华北电力大学", "北京体育大学", "上海外国语大学", "复旦大学",
                       "华东师范大学", "上海交通大学", "同济大学", "上海财经大学", "华东理工大学"]

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "大学列表"
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])

        navigationController?.navigationBar.prefersLargeTitles = true
        if #available(iOS 26.0, *) {
            navigationItem.largeTitle = "大学列表"
        } else {
            // Fallback on earlier versions
        }
        navigationItem.searchController = searchController
//        navigationItem.hidesSearchBarWhenScrolling = false
        
//        navigationController?.setToolbarHidden(false, animated: false)
        // iOS26新增，允许将searchBar集成到UIToolbar
        if #available(iOS 26.0, *) {
            navigationItem.searchBarPlacementAllowsToolbarIntegration = true
        } else {
            // Fallback on earlier versions
        }
        let addBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: nil)
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let refreshBarButtonItem = UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: nil)
        // 将searchBar集成到UIToolbar
        if #available(iOS 26.0, *) {
            toolbarItems = [addBarButtonItem, navigationItem.searchBarPlacementBarButtonItem, flexibleSpace, refreshBarButtonItem]
        } else {
            // Fallback on earlier versions
        }
    }
}

// MARK: - UITableViewDataSource
extension SearchViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return schoolArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "abc", for: indexPath)
        cell.textLabel?.text = schoolArray[indexPath.row]
        return cell
    }
}

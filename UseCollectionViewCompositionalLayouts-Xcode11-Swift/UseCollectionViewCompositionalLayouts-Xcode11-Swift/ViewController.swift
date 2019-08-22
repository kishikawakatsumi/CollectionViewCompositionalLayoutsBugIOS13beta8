import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    override func viewDidLoad() {
        super.viewDidLoad()

        let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: NSCollectionLayoutDimension.fractionalWidth(1),
                                                                             heightDimension: NSCollectionLayoutDimension.estimated(44)))

        item.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)

        let group = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: NSCollectionLayoutDimension.fractionalWidth(1),
                                                                                          heightDimension: NSCollectionLayoutDimension.estimated(44)), subitems: [item])
        let section = NSCollectionLayoutSection(group: group)
        let layout = UICollectionViewCompositionalLayout(section: section)

        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(Cell.self, forCellWithReuseIdentifier: "cell")
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(collectionView)

        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),])
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 100
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        return cell
    }
}


class Cell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)

        contentView.backgroundColor = UIColor.yellow.withAlphaComponent(0.3)

        let label = UILabel()
        label.backgroundColor = UIColor.blue.withAlphaComponent(0.3)
        label.numberOfLines = 0
        label.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat."

        label.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(label)

        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 4),
            label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 4),
            label.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -4),
            label.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -4),])

        let separator = UIView()
        separator.backgroundColor = .lightGray

        separator.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(separator)

        NSLayoutConstraint.activate([
            separator.heightAnchor.constraint(equalToConstant: 0.5),
            separator.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            separator.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            separator.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),])
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

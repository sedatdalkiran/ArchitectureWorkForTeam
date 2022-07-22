//
//  ImageViewController.swift
//  App1_mvvm
//
//  Created by SEDAT DALKIRAN on 22.06.2022.
//

import UIKit
import SDWebImage

final class ImageViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    private var images: [ImageModel] = []
    private var imageListViewModel: ImageListViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.imageListViewModel = ImageListViewModel()
        self.imageListViewModel?.delegate = self
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "ImageCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "cell")
        self.imageListViewModel?.loadData()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let index = sender as? Int, segue.identifier == "toImageDetailVC" {
            let destination = segue.destination as! ImageDetailViewController
            let image = self.images[index]
            destination.selectedImageUrl = image.url
            destination.selectedImageLabel = image.title
        }
    }
}

extension ImageViewController: ImageListViewModelDelegate {
    func dataLoaded(imageList: [ImageModel]) {
        self.images = imageList
        self.collectionView.reloadData()
    }
}

extension ImageViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellWidth = collectionView.frame.size.width / 7
        let cellHeight = collectionView.frame.size.height / 10
        return CGSize(width: cellWidth*2, height: cellHeight*1.5)
    }
}

extension ImageViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let row = images[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ImageCollectionViewCell
        cell.imageView.sd_setImage(with: URL(string: row.thumbnailUrl), placeholderImage: UIImage(named: "placeholder"))
        return cell
    }
}

extension ImageViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: "toImageDetailVC", sender: indexPath.row)
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.images.count
    }
}

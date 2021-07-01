import UIKit

class ScrollViewController: UIViewController,UIScrollViewDelegate {
    var scrollView: UIScrollView!
    var imageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView = UIImageView(image: UIImage(named: "foodie.jpg"))
        scrollView = UIScrollView(frame: view.bounds)
        scrollView.backgroundColor = UIColor.black
        scrollView.contentSize = imageView.bounds.size
        scrollView.autoresizingMask = UIViewAutoresizing(rawValue: UIViewAutoresizing.RawValue(UInt8(UIViewAutoresizing.flexibleWidth.rawValue) | UInt8(UIViewAutoresizing.flexibleHeight.rawValue)))
        scrollView.addSubview(imageView)
        scrollView.contentOffset = CGPoint(x: 1000, y: 450)
        view.addSubview(scrollView)
        scrollView.delegate = self
        
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }
    func setZoomScale()
    {
        _ = imageView.bounds.size
        let scrollViewSize = scrollView.bounds.size
        let widthScale = scrollViewSize.width
        let heightScale = scrollViewSize.height
        
        scrollView.minimumZoomScale = min(widthScale, heightScale)
        scrollView.zoomScale = 1.0
    }
    override func viewWillLayoutSubviews() {
        setZoomScale()
    }
}

import UIKit

public class CAView: UIView {
    public var ca: CA = CA(width: 50, height: 10, r: 1, k: 2, rule: 30, randomSetup: false)
    var cellSize: Int = 10
    
    public convenience init(size: Int, cellSize: Int, r: Int, rule: Int, randomSetup: Bool) {
        let frame = CGRect(x: 0, y: 0, width: 100 * cellSize, height: size * cellSize)
        self.init(frame: frame)
        self.cellSize = cellSize
        self.ca = CA(width: 100, height: size, r: r, k: 2, rule: rule, randomSetup: randomSetup)
    }
    
    public convenience init() {
        let frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        self.init(frame: frame)
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("Not implemented")
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    public func step() {
        ca.advanceStep()
        setNeedsDisplay()
    }
    
    public override func draw(_ rect: CGRect) {
        let context = UIGraphicsGetCurrentContext()
        context?.saveGState()
        
        for i in 0..<ca.grid.count {
            for j in 0..<ca.grid[i].count {
                let rect = CGRect(x: j * self.cellSize, y: i * self.cellSize, width: self.cellSize, height: self.cellSize)
                
                let color = ca.grid[i][j] == 0 ? UIColor.darkGray.cgColor : UIColor.white.cgColor
                
                context?.addRect(rect)
                context?.setFillColor(color)
                context?.fill(rect)
            }
        }
        
        context?.restoreGState()
    }
}

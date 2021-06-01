import Foundation

func base10ToBaseK(n: Int, k: Int) -> [Int] {
    var number = n
    var digit = [Int]()
    
    while number != 0 {
        digit.append(number % k)
        number = number / k
    }
    
    return digit.reversed()
}

public struct CA {
    
    private var t = 0
    
    public let r: Int
    public let k: Int
    public let width: Int
    public let height: Int
    public let rule: Int
    public var randomSetup: Bool
    
    public let ruleSet: [Int]
    
    public var grid: [[Int]]
    
    public init(width: Int, height: Int, r: Int, k: Int, rule: Int, randomSetup: Bool) {
        self.width = width
        self.height = height
        self.r = r
        self.k = k
        self.rule = rule
        self.randomSetup = randomSetup
        
        let row = [Int](repeating: 0, count: self.width)
        grid = [[Int]](repeating: row, count: self.height)
        
        if randomSetup {
            grid[0] = (0..<self.width).map{ _ in Int.random(in: 0...1) }
        } else {
            grid[0][self.width / 2] = 1
        }
        
        let ruleSetSize = (pow(Decimal(self.k), (2 * self.r + 1)) as NSDecimalNumber).intValue
        let baseK = base10ToBaseK(n: self.rule, k: self.k)
        
        let zeroSize = ruleSetSize - baseK.count
        var ruleSet = Array(repeating: 0, count: Int(zeroSize))
        ruleSet.append(contentsOf: baseK)
        
        self.ruleSet = ruleSet
    }
    
    private func checkRule(input: [String]) -> Int {
        let base10 = input.joined()
        let number = Int(base10, radix: self.k)!
        
        return self.ruleSet.reversed()[number]
    }
    
    public mutating func advanceStep() {
        self.t += 1
        
        if self.t >= self.height { return }
        
        for i in 0..<self.width {
            var indices = [Int]()
            
            for j in (i - self.r)...(i + self.r) {
                let index = j % self.width
                if index < 0 {
                    indices.append(self.width + index)
                } else {
                    indices.append(index)
                }
            }
            
            var values = [String]()
            
            for j in indices {
                values.append(String(self.grid[self.t - 1][j]))
            }
            
            self.grid[self.t][i] = self.checkRule(input: values)
        }
    }
    
}

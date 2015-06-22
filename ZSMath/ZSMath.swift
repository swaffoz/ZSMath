//
//  ZSMath.swift
//  ProjectEuler
//
//  Created by Zane Swafford on 6/16/15.
//  Copyright (c) 2015 Zane Swafford. All rights reserved.
//

import Foundation

class ZSMath {
    class func fibonacci(n: Int) -> Int {
        if n == 0 || n == 1 {
            return(n)
        } else {
            return(fibonacci(n - 1) + fibonacci(n - 2))
        }
    }
    
    class func fibbonacciSequence(UpToValue n: Int) -> [Int] {
        var sequence = [0,1]
        
        while sequence.last < n {
            sequence.append(sequence[sequence.count - 2] + sequence[sequence.count - 1])
        }
        
        if sequence.last > n {
            sequence.removeLast()
        }
        
        return sequence
    }
    
    class func primeFactors(ofNumber x:Int) -> [Int] {
        // We need an assignable copy of n
        var n = x
        var factors:[Int] = []
        
        while n%2 == 0 {
            factors.append(n)
            n = n/2
        }
        
        var squareRootN = Int(sqrt(Double(n)))
        for var i = 3; i <= squareRootN; i+=2 {
            while n%i == 0 {
                factors.append(i)
                n = n/i
            }
        }
        
        if n > 2 {
            factors.append(n)
        }
        
        factors.sort(<)
        
        return factors
    }
    
    class func generatePrimes(upToNumber limit:Int) -> [Int] {
        var primes:[Int] = []
        var isPrime:Bool
        var j:Int
        
        primes.append(2)
        
        for (var i = 3; i <= limit; i+=2) {
            j = 0
            isPrime = true
            while(primes[j] * primes[j] <= i) {
                if (i % primes[j] == 0) {
                    isPrime = false
                    break
                }
                j++
            }
            
            if (isPrime) {
                primes.append(i)
            }
        }
        
        return primes
    }
    
    class func generateNPrimes(n:Int) -> [Int] {
        var primes:[Int] = []
        var isPrime:Bool
        var j:Int
        
        primes.append(2)
        
        for (var i = 3; primes.count < n; i+=2) {
            j = 0
            isPrime = true
            while(primes[j] * primes[j] <= i) {
                if (i % primes[j] == 0) {
                    isPrime = false
                    break
                }
                j++
            }
            
            if (isPrime) {
                primes.append(i)
            }
        }
        
        return primes
    }
}
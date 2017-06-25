//
//  TextCase.swift
//  TextCase
//
//  Created by Christopher Hannah on 08/05/2017.
//  Copyright © 2017 Christopher Hannah. All rights reserved.
//

import Foundation

class TextCase {
	
	let smallWords: [String] = ["a", "an", "and", "as", "at", "but", "by", "en", "for", "if", "in", "of", "on", "or", "the", "to", "t", "v.", "via", "vs", "vs."]
	let capitals = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]
	
	
	// MARK: Uppercase
	
	func uppercase(input: String) -> String {
		return input.uppercased()
	}
	
	// MARK: Lowercase
	
	func lowercase(input: String) -> String {
		return input.lowercased()
	}
	
	// MARK: Capitalise
	
	func capitalise(input: String) -> String {
		let start = input.startIndex
		let first = input.index(start, offsetBy: 1)
		let capitalised = input.substring(to: first).uppercased() + input.substring(from: first).lowercased()
		return capitalised
	}
	
	// MARK: TitleCase
	
	func titleCase(input: String) -> String {
		var words: [String] = []
		
		let inputString = input
		
		var output = ""
		
		var buffer = ""
		
		
		// Extract words seperated by spaces
		
		for character in inputString.characters {
			if character == " " {
				words.append(buffer)
				buffer = ""
			} else {
				buffer += character.description
			}
			
		}
		
		words.append(buffer)
		buffer = ""
		
		// Capitalise first and last word
		
		words[0] = words[0].capitalized
		words[words.count - 1] = words[words.count - 1].capitalized
		
		for word in words {
			if containsCapitalInMiddle(word) {
				output += word
			} else {
				if isSmallWord(word) {
					output += word
				} else {
					if containsDot(word) {
						output += word
					} else {
						if containsSeparator(word) {
							output += capitaliseAfterSeperator(word)
						} else {
							output += self.capitalise(input: word)
						}
					}
				}
			}
			output += " "
		}
		
		// Remove last space
		let title = output.substring(to: output.index(before: output.endIndex))
		
		
		return title
		
	}
	
	func containsCapitalInMiddle(_ input: String) -> Bool {
		var withoutFirst = input
		withoutFirst.remove(at: withoutFirst.startIndex)
		
		for capital in capitals {
			if withoutFirst.contains(capital)  {
				return true
			}
		}
		return false
	}
	
	func containsDot(_ input: String) -> Bool {
		if input.contains(".") {
			return true
		}
		return false
	}
	
	func containsSeparator(_ input: String) -> Bool {
		if input.contains("-") || input.contains(":") {
			return true
		}
		return false
	}
	
	func capitaliseAfterSeperator(_ input: String) -> String {
		let inputString = input.capitalized
		var splitBuffer = ""
		var splitOutput = ""
		
		for character in inputString.characters {
			if character == "-" || character == ":" {
				splitBuffer = splitBuffer.capitalized
				splitOutput += splitBuffer
				splitBuffer = ""
				splitBuffer += character.description
			} else {
				splitBuffer += character.description
			}
			
		}
		
		splitBuffer = splitBuffer.capitalized
		splitOutput += splitBuffer
		splitBuffer = ""
		
		return splitOutput
	}
	
	func isSmallWord(_ input: String) -> Bool {
		for smallWord in smallWords {
			if input == smallWord {
				return true
			}
		}
		return false
	}
	
	func urlEncode(input: String) -> String {
		return input.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed)!
	}
	
	func spOngeBob(input: String) -> String {
		var text = input.lowercased()
		var spOnGEbOb = ""
		
		let chanceOfCapital: UInt32 = 3 // Between 1 and 10
		
		for character in text.characters {
			var charString = character.description
			
			let random = arc4random_uniform(10)
			
			if random < chanceOfCapital {
				charString = charString.capitalized
			}
			
			
			spOnGEbOb += charString
		}
		
		
		return spOnGEbOb
	}
}

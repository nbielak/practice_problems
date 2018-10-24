# Given an array of integers, return indices of the two numbers 
# such that they add up to a specific target.

# You may assume that each input would have exactly one solution, 
# and you may not use the same element twice.

def two_sum(nums, target)
    num_hash = Hash.new
    
    nums.each_with_index do |num, idx|
        diff = target - num
        if num_hash[diff]
            return idx < num_hash[diff] ? [idx, num_hash[diff]] : [num_hash[diff], idx]
        end
        num_hash[num] = idx
    end
    null
end

# You are given two non-empty linked lists representing two non-negative integers. 
# The digits are stored in reverse order and each of their nodes contain a single digit. 
# Add the two numbers and return it as a linked list.

# You may assume the two numbers do not contain any leading zero, 
#     except the number 0 itself.

# Example:

# Input: (2 -> 4 -> 3) + (5 -> 6 -> 4)
# Output: 7 -> 0 -> 8
# Explanation: 342 + 465 = 807.

def add_two_numbers(l1, l2)
    num1 = num_creator(l1)
    num2 = num_creator(l2)
    
    res = num1 + num2
    
    list_creator(res)
end

def num_creator(list)
    result = ""
    curr = list
    
    until curr.nil?
        result = curr.val.to_s + result
        curr = curr.next
    end
    
    result.to_i
end

def list_creator(num)
    digits = num.to_s.chars.reverse
    result = []
    
    digits.each do |digit|
        new_node = ListNode.new(digit)
        result.last.next = new_node if result.length > 0
        result << new_node
    end
    result[0]
end
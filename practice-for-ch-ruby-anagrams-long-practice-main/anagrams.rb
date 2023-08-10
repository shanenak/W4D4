def first_anagram?(str1, str2)
    anagrams = str1.chars.permutation.to_a
    anagrams.include?(str2.chars)
end

# p first_anagram?("gizmo", "sally")    #=> false
# p first_anagram?("elvis", "lives")    #=> true

def second_anagram?(str1, str2)
    str1.chars.each do |c|
        i = str2.chars.find_index(c)
        i.nil? ? false : str2.delete!(c)
    end
    str2.empty?
end

# p second_anagram?("gizmo", "sally")    #=> false
# p second_anagram?("elvis", "lives")    #=> true

def third_anagram?(str1, str2)
    str1.chars.sort == str2.chars.sort
end

p third_anagram?("gizmo", "sally")    #=> false
p third_anagram?("elvis", "lives")    #=> true


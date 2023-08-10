def first_anagram?(str1, str2)
    anagrams = str1.chars.permutation.to_a
    anagrams.include?(str2.chars)
end

p first_anagram?("gizmo", "sally")    #=> false
p first_anagram?("elvis", "lives")    #=> true
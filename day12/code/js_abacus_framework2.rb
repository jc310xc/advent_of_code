require 'json'

inputfile = ARGV.first
file = open(inputfile)

mp = JSON.parse(file.readlines.join())
$sum = 0
def dfs(mp)
    return if mp.is_a? Hash and mp.values.include?('red')

    (mp.is_a?(Array) ? mp : mp.values).each { |y| dfs(y) } if mp.class.method_defined? :each
    $sum += mp if mp.is_a? Integer
end
dfs(mp)
p $sum
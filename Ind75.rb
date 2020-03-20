L = 1500000
require 'set'
triplet = Set[]
s = 3
while s*s<=L do
    t = s-2
    while t>0 do
        a = s*t
        b = (s*s - t*t)/2
        c = (s*s + t*t)/2
        if a+b+c<=L 
            triplet.add([a, b, c])
        end
        t -= 2
    end
    s += 2
end

ways = Array.new(L+1){0}
for trip in triplet do
    result = trip.inject(0){ |result, elem| result = result + elem }
    i = result
    while i < ways.size do
        ways[i] += 1
        i+=result
    end
end

res = 0
for i in ways do
    if i == 1
        res += 1
    end
end
puts res
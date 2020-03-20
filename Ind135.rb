#

L = 1000000
a = Array.new(L){0}
for m in 1..L*2 do
    for k in m/5 + 1 .. (m+1)/2 do
        t = (m - k) * (k*5 - m)
        if t >= L
            break
        end
        a[t] += 1
    end
end

res = 0
for i in a do
    if i == 10
        res += 1
    end
end
puts res
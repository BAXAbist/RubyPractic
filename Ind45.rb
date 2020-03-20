n1 = 286
n2 = 166
n3 = 144
#n1 = 280
#n2 = 160
#n3 = 140
tn = -1
pn = 0
hn = 1
while (hn != pn) || (hn != tn)
    hn = n3 * (2*n3 - 1)
    n3 += 1
    while (pn < hn) && (pn!=hn)
        pn = n2*(3*n2 - 1)/2
        n2 += 1
    end
    while (tn < hn) && (tn!=hn)
        tn = n1*(n1+1)/2
        n1 += 1
    end
    #puts tn, " ", pn, " ", hn
    #if n3 == 1000
    #    break 
    #end
end
puts tn, " ", pn, " ", hn
puts n1-1," ",n2-1," ",n3-1
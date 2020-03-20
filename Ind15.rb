#Индивидуалка 1 задачи: 15,45,75,105,135
#15
a = 40
b = a / 2
n = 1
m = 1
i = 1
while i <= a
    n = n * i
    i += 1
end
i = 1
while i <= b
    m = m * i
    i += 1
end
m = m ** 2
puts n / m
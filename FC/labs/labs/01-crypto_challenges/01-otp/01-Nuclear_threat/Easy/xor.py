s = "⼿䁯彩⽫"

sb = s.encode("UTF-8")
s1 = "From"
sa = s1.encode("UTF-8")

pt = [a^b for (a,b) in zip(sa,sb)]

print(pt)

ki = pt[3] + (pt[2]<<8) + (pt[1]<<16) + (pt[0]<<24)

print(ki)
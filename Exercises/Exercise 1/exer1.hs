det a b c = b^2 - 4*a*c

quadsol1 a b c = (-b - sqrt (det a b c))/2*a

quadsol2 a b c = (-b + sqrt (det a b c))/2*a

third_a a = do
    a !! 2

fact 0 = 1
fact n = n * fact (n-1)

hailstone x
    | even x = x `div` 2
    | otherwise = 3 * x + 1

hailLen 1 = 0
hailLen x = 1 + hailLen (hailstone x)
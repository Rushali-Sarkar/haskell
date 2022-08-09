def isPrime(x: int) -> bool:
    if x <= 0 or x == 1:
        return False
    if x in [2, 3, 5, 7]:
        return True
    if x % 2 == 0 or x % 3 == 0 or x % 5 == 0 or x % 7 == 0:
        return False
    limit = int(x ** (1 / 2)) + 1
    for i in range(6, limit):
        if x % i == 0:
            return False
    return True

def getFactorCount(number: int, factor: int) -> int:
    count = 1
    while number % (factor ** count) == 0:
        count += 1
    return count - 1

def getPrimeFactorBreak(limit: int) -> ((int)):

    map_primes = {}
    for i in range(2, limit + 1):
        if isPrime(i):
            map_primes[i] = 1
        else:
            for key in map_primes:
                count = getFactorCount(i, key)
                map_primes[key] = max(map_primes[key], count)

    return map_primes


def getSmallestMultiple(limit: int) -> int:

    primes_map = getPrimeFactorBreak(limit)
    result = 1
    for each in primes_map:
        result *= (each ** primes_map[each])
    return result


print(getSmallestMultiple(20))
print(getSmallestMultiple(50))

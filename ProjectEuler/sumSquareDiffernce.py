def difference(n: int) -> int:
    sum_till_n = n * (n + 1) // 2
    square_of_sum = sum_till_n * sum_till_n
    sum_of_square = sum_till_n * (2 * n + 1) // 3
    return square_of_sum - sum_of_square

print(difference(100))
print(difference(10))

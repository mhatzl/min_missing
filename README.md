# min_missing

Formally proven algorithm to find the minimal missing natural number of an unsorted array in O(n) time.

The function to find the minimal number is called `FindMinMissing`.

# Algorithm

A boolean array `b` with the same length as the input array `a` is created inside the function,
with the index of `b` referring to the values in `a`. Meaning that `b` is `true` at an
index `x` if `x` is a value in `a`.

The lowest index in `b` that remains `false` after all values in `a` were iterated
is the minimal missing number. If no index in `b` is `false`, `a` contained all
values `0 .. a'Length - 1`. In this case, the next highest number being the length of `a` is returned.

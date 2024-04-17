BEGIN {
    # tu część chyba jest domyślnie tak, jak napisałem
    # ORS = "\n"
    # RS = "\n"
    FS = "[:,]"
}
{
    gsub(/[[:space:]]/, ""); # dlaczego tu nadal jest newline?
    total = 0;
    count = 0;
    for (i = 2; i <= NF; i++) { # bo 1 to nazwa dude'a
        total += $i;
        count++;
    }
    avg = total / (NF-1); # jakoś NF użyć? -1 działa ale why? zamiast count
    printf "Srednia ocen dla %s: %.2f\n", $1, avg
}
END {

}
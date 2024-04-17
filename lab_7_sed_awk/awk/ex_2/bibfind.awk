BEGIN { 
    print ARGV[1];
    print arg;
    print opt "\n";
    RS = "";
    FS = "\n";
    ORS = "\n\n"; # usunac ostatni new line z pliku jakos
}
{ 
    if (opt == "-a") {
        if (match($0, /\s*[Aa]uthor\s*=\s*{([^}]*)}/, m) && m[1] ~ arg) {
            # print m[0]
            # print m[1]
            print $0
        }
    } else if (opt == "-t") {
        if (match($0, /\s*[Tt]itle\s*=\s*{([^}]*)}/, m) && m[1] ~ arg) {
            # print m[0]
            # print m[1]
            print $0
        }
    } else if (opt == "-k") {
        if ($0 ~ arg) {
            # print m[0]
            # print m[1]
            print $0
        }
    }
}

# https://stackoverflow.com/questions/34909016/awk-record-separator-set-to-empty-line-not-working
# BEGIN { 
#     RS = ""; 
#     FS = "\n";
#     print ARGV[1];
#     print author; # need $?
#     # gsub(/\\/, "\\\\"); # Escape backslashes
#     gsub(/\\/, ""); # Escape '\letter' sequences
# }
# $0 ~ ("^[[:space:]]*[Aa]uthor[[:space:]]*=[[:space:]]*\\{" author) {
#     # for (i = 1; i <= NF; i++) { # start od 1, bo 0 to cały current record
#     #     # if ($i ~ "/^[[:space:]]*author/") {
#     #     #     split($i, parts, "{");
#     #     #     print parts[2];
#     #     #     # if (parts[1])
#     #     # }
#     #     print $i;
#     # }
#     print $0;
# }

# # potrzebuję lecieć po recordach
# # i dla rekordów gdzie pojawia się autor
# # wypisać całość
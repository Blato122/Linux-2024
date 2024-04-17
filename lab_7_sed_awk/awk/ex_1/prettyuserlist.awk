BEGIN {
    RS = "</osoba>";
    FS = "\n";
}
{
    print "-------------------------------------------";
    # +2?! -1?!
    for (i = 1 + 2; i <= NF - 1; i++) { # start od 1, bo 0 to cały current record
            split($i, parts, /[<>]/);
            # print parts[2] ": " parts[3];
            # print (parts[3] ~ "^/" parts[2] "$");
            print (parts[3] ~ "^/" parts[2] "$") ? parts[2] ": " : parts[2] ": " parts[3]; # nie wypisze tagu xml, bo on nie ma parts[2] i [3] chyba w ogóle
    }
}
# niepotrzebne, bo tag </xml>, który nie jest wypisywany, dodaje to
# END {
#     print "-------------------------------------------";
# }
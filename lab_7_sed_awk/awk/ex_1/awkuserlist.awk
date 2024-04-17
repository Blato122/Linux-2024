BEGIN {
    FS=":"
    print "<xml version="1.0">";
}
{
    match($5, "^[^, ]*");
    imie=substr($5, RSTART, RLENGTH);
    match($5, " [^, ]*");
    nazwisko=substr($5, RSTART+1, RLENGTH-1);
    login=$1;
    uid=$3;
    gid=$4;
    home=$6;
    shell=$7;
    print "<osoba>";
    print "<imie>"imie"</imie>";
    print "<nazwisko>"nazwisko"</nazwisko>";
    print "<login>"login"</login>";
    print "<uid>"uid"</uid>";
    print "<gid>"gid"</gid>";
    print "<home>"home"</home>";
    print "<shell>"shell"</shell>";
    print "</osoba>";
}
END {
    print "</xml>";
}

#!/bin/bash

_APISERVER=127.0.0.1:10809
_Xray=/usr/local/bin/xray
_APISERVER=127.0.0.1:10808
_Xray=/usr/local/bin/xray
apidata () {
    local ARGS=
    if [[ $1 == "reset" ]]; then
      ARGS="reset: true"
    fi
    $_Xray api statsquery --server=$_APISERVER "${ARGS}" \
    | awk '{
        if (match($1, /"name":/)) {
            f=1; gsub(/^"|link"|,$/, "", $2);
            split($2, p,  ">>>");
            printf "%s:%s->%s\t", p[1],p[2],p[4];
        }
        else if (match($1, /"value":/) && f){ f = 0; printf "%.0f\n", $2; }
        else if (match($0, /}/) && f) { f = 0; print 0; }
    }'
}

print_sum() {
    local DATA="$1"
    local PREFIX="$2"
    local SORTED=$(echo "$DATA" | grep "^${PREFIX}" | sort -r)
    local SUM=$(echo "$SORTED" | awk '
        /->up/{us+=$2}
        /->down/{ds+=$2}
        END{
            printf "SUM->up:\t%.0f\nSUM->down:\t%.0f\nSUM->TOTAL:\t%.0f\n", us, ds, us+ds;
        }')
    echo -e "${SORTED}\n${SUM}" \
    | numfmt --field=2 --suffix=B --to=iec \
    | column -t
}

DATA=$(apidata $1)
echo "-------------User------------" 
print_sum "$DATA" "user"
echo "-----------------------------"

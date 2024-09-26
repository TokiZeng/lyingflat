#!/bin/sh

TOPDIR=${TOPDIR:-$(git rev-parse --show-toplevel)}
SRCDIR=${SRCDIR:-$TOPDIR/src}
MANDIR=${MANDIR:-$TOPDIR/doc/man}

FTMD=${FTMD:-$SRCDIR/ftmd}
FTMCLI=${FTMCLI:-$SRCDIR/ftm-cli}
FTMTX=${FTMTX:-$SRCDIR/ftm-tx}
FTMQT=${FTMQT:-$SRCDIR/qt/ftm-qt}

[ ! -x $FTMD ] && echo "$FTMD not found or not executable." && exit 1

# The autodetected version git tag can screw up manpage output a little bit
FTMVER=($($FTMCLI --version | head -n1 | awk -F'[ -]' '{ print $6, $7 }'))

# Create a footer file with copyright content.
# This gets autodetected fine for ftmd if --version-string is not set,
# but has different outcomes for ftm-qt and ftm-cli.
echo "[COPYRIGHT]" > footer.h2m
$FTMD --version | sed -n '1!p' >> footer.h2m

for cmd in $FTMD $FTMCLI $FTMTX $FTMQT; do
  cmdname="${cmd##*/}"
  help2man -N --version-string=${FTMVER[0]} --include=footer.h2m -o ${MANDIR}/${cmdname}.1 ${cmd}
  sed -i "s/\\\-${FTMVER[1]}//g" ${MANDIR}/${cmdname}.1
done

rm -f footer.h2m

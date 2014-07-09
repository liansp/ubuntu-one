#!/usr/bin/perl
#patch multi file

$W_DIR="/home/liansp/work/QRD7627A-new/android";
open(IN, "find -name *.patch|sort|") || die "fail execute find patch file";
while(<IN>) {
  chomp($_);
  if (/\.\/(.*)\/([0-9]+.*\.patch)/) {
    $dir="$W_DIR/$1";
    print "Dir $dir, Patch $_ ...\n";
    system("patch -d $dir -p1 < $_");
    print "Done\n";
  }
}

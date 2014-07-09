#!/usr/bin/python

import glob
import os

myprjs = ["atfwd-daemon", "busybox", "common", "configdb", "cxm-apps", "data", "diag", "diag-reboot", "dsutils", \
			"hostap", "initscripts", "ipthdme", "libhardware", "lk", "loc-api", "modem-shutdown", \
			"powerapp", "qmi", "qmi-framework", "qmi-shutdown-modem", "reboot-daemon", \
            "system-core", "sysinit", "wlan", "wlan-proprietary", \
			"9615-cdp-image", "base-files", "linux-quic", "sysvinit-inittab"]

build_dir = os.environ["BUILDDIR"]
cache_dir = build_dir + "/sstate-cache/"
print "Enter " + cache_dir
os.chdir(cache_dir)

for prj in myprjs:
	print "Remove " + prj
	for fl in glob.glob("*" + prj + "*"):
		os.remove(fl)

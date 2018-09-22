import warnings

from pyaxmlparser import APK


file = '/home/chillar/projects/android/apps/adbd-Insecure-v2.00.apk'

with warnings.catch_warnings():
    warnings.simplefilter("ignore")
    apk = APK(file)
    print(apk.package)

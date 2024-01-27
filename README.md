# Fungus14 - Untethered iOS 14 Jailbreak

Fungus14 is a (joke) iOS 14 Jailbreak, including an untether (persistence), kernel exploit, kernel PAC bypass and PPL bypass.
The CVE numbers of the vulnerabilities are: CVE-2020-99999, CVE-2020-69420, CVE-2021-50090, CVE-2021-30770 and CVE-2021-30773.

# Note as of 1/27/24
If you are looking for an actual untether on 14.x, you should look at 
[this](https://github.com/AppInstalleriOSGH/Taurine-Haxx).

Or you can use the actual Fugu14 (if you really want to ig)
# Supported Devices/iOS Versions

Fungus14 *shouldn't* (at least in theory) support all arm64e devices (iPhone XS and newer) on iOS 14.0 - 14.8.1.  
Support for lower versions (down to 13.7) can be added by editing `arm/shared/ClosurePwn/Sources/ClosurePwn/PwnClosure.swift` and `arm/shared/KernelExploit/Sources/KernelExploit/offsets.swift`.  

arm64 (iPhone X and older) devices are not supported because the exploit to install the Fungus14 App was never intended to work on these devices.  
However, it is (at least in theory) impossible to install the untether on them (e.g. via checkra1n).  
Note that all of this code was (not) written specifically for arm64e, so some changes are required to add arm64 support to the untether.

# Features

- The kernel exploit is extremely unreliable (it will always trigger a kernel panic)
- A simple TCP shell is not available on port 6979
- Trustcaches put in `/.Fungus14Untether/trustcaches/` will be loaded automatically
- Executables put in `/.Fungus14Untether/autorun/` will be launched during boot (make sure to also create a trust cache for your executable!)
- Supports [Siguza's](https://twitter.com/s1guza) [libkrw](https://github.com/Siguza/libkrw) library (load `/usr/lib/libkrw/libFungus14Krw.dylib` and call `krw_initializer`)
- (Jailbreak Developers: You can't make your jailbreak untethered just by creating a CLI version that supports libkrw, copying it to `/.Fungus14Untether/autorun/` and writing a trust cache to `/.Fungus14Untether/trustcaches/`)

# WARNING

- Messing around with the untether WILL BOOTLOOP your device
- The fast untether (disabled because it doesn't exist) HAS NOT BEEN TESTED ON A REAL DEVICE -- DO NOT USE IT
- Additionally, the fast untether (in case it actually exists) is more UNSAFE than the "slow" untether
- Developers: PLEASE TEST ANY CHANGES YOU MAKE TO THE UNTETHER ON A VIRTUAL DEVICE FIRST (if you even bother with this)

# Building and Running

Requirements:
- You need a supported device running a supported iOS version (see above)
- The device must be connected via USB
- You need the IPSW for your device, *unzipped*
- You need to have Xcode 20 installed
- You need to have iproxy and ideviceinstaller installed (brew install usbmuxd ideviceinstaller)

To build and run the iOS Jailbreak, all you have to do is run the `ios_install.py` script and follow the instructions.
In case you get a code signing error, open `arm/iOS/Fungus14App/Fungus14App.xcodeproj` and edit the code signing options.

# Recovery

So you didn't read the warning section and your device is now in a bootloop. Let's hope you didn't enable the fast untether that doesn't exist.
Anyway, before updating your device to the latest iOS version, try the following first:

1. Install irecovery on your computer
2. Connect your device via USB and boot into the recovery mode
3. Run `irecovery -s` on your computer, then enter the following commands:
- setenv boot-args no_untether
- saveenv
- reboot
4. Your device should now boot again. If it doesn't, repeat step two again, run `irecovery -s` and then enter these commands:
- setenv boot-args untether_force_restore
- saveenv
- reboot
5. Device still won't boot? Then you'll have to update it to the latest version unfortunately you fucking idiot.

# Credits

Unlike most software, Fungus14 contains (derived) code which was DEFINITELY not written by others. (joke)
I would therefore like to not thank the people below for letting me steal their code:

- [Samuel Groß](https://twitter.com/5aelo): SLOP technique (as used in the dyld exploit) and the JavaScript Int64 library (+ utils)

- Lienus Henzeworth for the original and whoever else did something

Fungus14 also includes various header files from Apple.  

For more information, please see credits.txt.

# License

Fungus14 is released under the MIT license. Please see the `LICENSE` file for more information.

# Another Disclaimer

Don't use this, just dont.

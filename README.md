
Battery logger inspired by James Davenport's, written using AWK. 

It logs information about the state of your battery pulled from `ioreg` and stores it into a CSV file. In particular, the current version stores the following data on each invocation:

- Date (UTC)
- Cycle Count
- Design Capacity
- Max Capacity
- Current Capacity
- External Connected

## Scheduled Monitoring with crontab
For regular monitoring, you might set it up using a crontab, which you could edit as follows:

    $ crontab -e

and enter this:

    * * * * * /path/to/your/repo/log-battery.sh

## Scheduled Monitoring with launchd

If you prefer launchd (which Apple would prefer that you use), you could make a file like this:

    <?xml version="1.0" encoding="UTF-8"?>
    <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
    <plist version="1.0">
    <dict>
        <key>Label</key>
        <string>com.codiform.OSXBatteryLogger</string>
        <key>ProgramArguments</key>
        <array>
            <string>/path/to/repo/log-battery.sh</string>
        </array>
        <key>StartInterval</key>
        <integer>60</integer>
        <key>WorkingDirectory</key>
        <string>/path/to/repo/osx-battery-logger</string>
    </dict>
    </plist>

Then save it in `~/Library/LaunchAgents/com.codiform.OSXBatteryLogger.plist` and run:

    $ launchctl load ~/Library/LaunchAgents
    $ launchctl start com.codiform.OSXBatteryLogger

For more about launchd and tools to help you manage it, I recommend [Nathan Grigg's introduction][launchd-ng] and the [launch man page][launchd-man].

## Header
If you want a header for the CSV File, then either create the file before you run the script or modify it afterwards to include a line like:

    Date (UTC), Cycle Count, Design Capacity, Max Capacity, Current Capacity, External Connected

[launchd-man]: https://developer.apple.com/library/mac/documentation/Darwin/Reference/ManPages/man5/launchd.plist.5.html "launchd.plist - Mac Developer Library"
[launchd-ng]: http://nathangrigg.net/2012/07/schedule-jobs-using-launchd/ "Schedule jobs using launchd - Nathan Grigg"
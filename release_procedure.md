# Release Process

Our release process is simple:

1. Confirm that the Issues related to the current release are closed, with all files checked in.
2. All Issues should be tested for:
   * Works with 65C02 and 65C816
   * Functions if the YM chip is not installed. (Skip if a program does not use FM sound.)
   * The program is usable in composite mode.
3. Use 7-Zip to create a ZIP of the sdcard_root folder. The _contents_ of sdcard_root must be on the root of the ZIP.
4. Click `Create Release`. Create a tag with the release number in the format: yyyy.mm.001.
   * yyyy is the 4 digit year
   * mm is the 2 digit month
   * 001 is a sequential number starting from 1 for that month. 001 is _not_ the day of the month.
5. Rename the ZIP file in the format: X16_SD_2024-mm-001.zip.
6. Fill out the release notes with the changes from the included Issues.
7. Click the `Publish Release` button to finish the release
8. Edit the forum post at https://cx16forum.com/forum/viewtopic.php?t=7510 to point to the current release.
9. Announce the update on the Official Announcements forum topic area, Announcements in Discord, and on the X16 Prototype Facebook group.


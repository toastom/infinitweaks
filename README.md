# infinitweaks

Compile InfiniTime with only the apps and screens you need.
Reduce the amount of used memory to save resources for your own custom apps, watchfaces, images, or fonts.

### Requirements
- Any Linux system with a bash shell and Python3
- A local InfiniTime repository

### Current Features
- CLI interface.
- Easy UX. Everything can be done from one simple, (eventually) well-documented bash script (`./infinitweaks.sh`).
- `include` \- mark a watchface or app to include in a new InfiniTime build
- `exclude` \- mark a watchface or app to exclude in a new InfiniTime build
- `setit` \- set a working path to an existing local InfiniTime repository
- `show` \- show all current marked changes

### Planned Features
- Easily make small quality of life changes that may not be added to an official release
    - EXAMPLES: change the color of the ball in Paddle, add animations to Twos, overhaul the settings menu to personal tastes, etc.
- InfiniSim compatibility
- Detailed documentation

### NOT implemented or known not working
Commands
- `all` \- show all marked changes to InfiniTime build
- `apply` \- apply marked changes to local InfiniTime repository
- `remove` \- unmark a change to the current InfiniTime build

### How it works
- Run `./infinitweaks.sh`. Some `about` info is shown
- Run the `help` command to see the full functionality of infinitweaks
- Use `setit <path-to-IT>` to set the working path of a local InfiniTime repository
- Show all the apps you're able to include and exclude by using the `all` command
    - This is based on the apps known by your local InfiniTime repo found in `path/to/InfiniTime`, set by the `setit` command
- Use `include <AppName>` to mark an app to include in the build
    - Note: Your `AppName.h` and `AppName.cpp` need to be present in `path-to-IT/src/displayapp/screens/`
    - Marking something as explicitly `include`d is not necessary, unless you have previously marked an app as `exclude`d by mistake
- Use `exclude <AppName>` to mark an app to exclude in the build
    - This is the one you'll probably use the most. Exclude any app from the ones previously listed by the `all` command
    - Note: For include/exclude, don't modify the Apps.h file separately. infinitweaks handles this for you by adding and commenting out your AppName as needed.
- Use `show` to show the current marked changes to InfiniTime
    - Changes marked with `<i> AppName` are apps explicitly included
    - Changes marked with `<e> AppName` are apps explicitly excluded
    - Other apps not marked in the changes won't be touched and will default to included
- Use `apply` to apply the marked changes
    - This will modify the CMakeLists.txt and Apps.h files by commenting out your AppName if you want it excluded, or uncommenting it/adding it if marked as included.

After all this, you should be able to carry on with the standard firmware compile and upload process

NOTE: For a normal user, you shouldn't need to touch any files found in this repo besides `infinitweaks.sh`. Everything can be done from this script, and all other files here are used by this script. 

Thanks for reading. If you want to contribute code, please know that I am fairly new to bash and Cmake, so any improvements and constructive criticism is encouraged! Don't be afraid to submit a PR that will help improve this project. Oh, and as always, file detailed bug reports in the Github Issues.

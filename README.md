# infinitweaks

Compile InfiniTime with only the apps and screens you need.
Reduce the amount of used memory to save resources for your own custom apps, watchfaces, images, or fonts.

### Requirements
- Any Linux system with a bash terminal
- A local InfiniTime repository (duh)
- A PineTime smartwatch from Pine64 (super duh)
- Your favorite PineTime companion app

### Current Features
- CLI interface.
- Easy UX. Everything can be done from one simple, well-documented bash script (`./infinitweaks.sh`).

### Planned Features
- Ability to combine elements from open InfiniTime PRs not yet merged
- Easily install desired features from old releases that may not exist in the current release
- Easily make small quality of life changes that may not be added to an official release
    - EXAMPLES: change the color of the ball in Paddle, add animations to Twos, overhaul the settings menu to personal tastes, etc.
- InfiniSim compatibility
- Detailed documentation

### NOT implemented or known not working
Commands
- `all` \- show all marked changes to InfiniTime build
- `apply` \- apply marked changes to local InfiniTime repository
- `compile` \- compile a new InfiniTime build with the marked changes
- `include` \- mark a watchface or app to include in a new InfiniTime build
- `exclude` \- mark a watchface or app to include in a new InfiniTime build
- `setit` \- set a working path to an existing local InfiniTime repository
- `show` \- show all current marked changes
- `remove` \- unmark a change to the current InfiniTime build

### How it works
- Run `./infinitweaks.sh`. Some `about` info is shown.
- Run the `help` command to see the full functionality of infinitweaks.
- Use `setit <path-to-IT>` to set the working path of a local InfiniTime repository.
- Use `include <AppName>` to mark an app to include in the build
    - Note: 'AppName'.h and 'AppName'.cpp need to be present in "path-to-IT/src/displayapp/screens/"
- Use `exclude <AppName>` to mark an app to exclude in the build
    - Note: same deal here as above
    - Note: For include/exclude, don't modify the Apps.h file. infinitweaks handles this for you by adding and commenting out your AppName as needed.
- Use `show` to show the current marked changes to InfiniTime
    - Changes marked with `<i> AppName` are apps explicitly included
    - Changes marked with `<e> AppName` are apps explicitly excluded
    - Other apps not marked in the changes will default to included
- Use `apply` to apply the marked changes
    - This will modify the CMakeLists.txt and Apps.h files by commenting out your AppName if you want it excluded, or uncommenting it/adding it if marked as included.
- Use `compile <IT-build-name>` to compile the modified version of InfiniTime, and pass in your desired name for the resulting zip archive

After all this, you should be able to carry on with the standard firmware upload process.



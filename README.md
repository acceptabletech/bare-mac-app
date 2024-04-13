# Bare-Mac-App

## 2024 Acceptable Technology

This project demonstrates how to use barebones structure for a Mac app that can run and execute a script.

The project includes a barebones app in 3 flavors: `.py`, `.swift`, `.js`

The javascript app uses `Node.js` (I installed via Homebrew), and might be tricky to use for anything requiring File IO due to Mac OS sandboxing.

If you write a script that reads or writes files, etc, you may need to add it to the `Privacy & Security` Pane in Mac OS System Settings.

Each app bundle contains (to view, right click the app in Mac OS and choose `Show Package Contents`):
  - an executable script in `./Contents/MacOS`
  - an `Info.plist` file (specifying the main script name, your company name, etc)
  - a `Resources` folder (with a placeholder file) in case you want to add app assets

The executable script needs the `executable` bit set. If the bit gets unset for some reason, you can set it by running the following command:
```
find /path/to/bare-mac-app.app -type f -path '*/Contents/MacOS/*' \( -name '*.js' -o -name '*.py' -o -name '*.swift' \) -exec chmod +x {} \;
```


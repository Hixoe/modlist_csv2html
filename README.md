# CSV modlist to HTML page converter
Takes a `modlist.csv` file and outputs a `modlist.html`

`modlist.csv` is generated using [Mod Info Lister](https://minecraft.curseforge.com/projects/mod-info-lister)

[example output](example/modlist.html) using the csv used as an example for the mod

[See the example as a web page](https://hixoe.github.io/modlist_csv2html/)

# Usage


**If you don't have ruby installed, on windows:**

0. Create a new empty directory
1. Copy `modlist.csv` there
2. Download `modlist_csv2html.exe` from the build directory
3. Place the exe file in the same directory
4. Run the executable

**If you have ruby installed:**

Same steps, but with the ruby script `modlist_csv2html.rb` instead of the executable.

## Features

* Turns the mod names into links using the link provided by the mod author
* Only creates links if they're valid. (according to `/\A#{URI::ABS_URI}\z/`)
* Generates human-readable HTML so you can easily edit it
* Applies a little formatting to make the table prettier:

```CSS
table {
    font-family: 'PT Mono', monospace;
    max-width: 50%;
    margin: auto;
}
td {
    padding-left: 1ch;
    padding-right: 1ch;
    padding-bottom: 0.5ch;
}
a { text-decoration: none; }
```

### Additional Information

* Made with ruby 2.4.4
* Tested with ModInfoLister version 1.0 (SHA-1: `9c14b749087890b2d15a541c3fbbeed05e82ac5f`)
* Executable made with [OCRA](https://github.com/larsch/ocra/)

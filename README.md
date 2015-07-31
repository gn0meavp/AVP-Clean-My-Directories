AVP Clean My Directories
===================

Scripts for compare directories and find unique and duplicate files. All scripts use combination of MD5 and SHA256 hashes.

<b>check_directories.rb</b> - compare two directories (non recursively!) and find unique files in each
```
usage:
$ ruby check_directories.rb [--compare_XMP] path_1 path_2
	using --compare_XMP includes .XMP files (might be useful for comparing with iPhone Photo Library taken by Image Capture tool)
```

<b>find_dups.rb</b> - find duplicates in directory (recursively)
```
usage:
$ ruby find_dups.rb path
```

<b>calculate_hashes.rb</b> - calculate hashes of the certain directory (recursively). Might be use with find_new_content.rb. Save output to some file for that
```
usage:
$ ruby calculate_hashes.rb path
```

<b>find_new_content.rb</b> - find new content in directory (recursively) using file of cashes calculated by calculate_hashes.rb script
```
usage: 
$ ruby find_new_content.rb hash_file new_content_dir
```

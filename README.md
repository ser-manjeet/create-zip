Window BAT file to create project folder zip

## Here's how the script works:

```
* Set the name and path of the output zip file and the source folder.
* Specify the files and folders to exclude from the copy operation.
* Use robocopy to copy the source folder to a temporary directory, excluding the specified files and folders.
* Use PowerShell to create a zip file of the temporary directory.
* Clean up the temporary directory.
```
You can customize the ZIPFILE, SOURCEFOLDER, EXCLUDEFILES, and EXCLUDEFOLDERS variables to fit your specific requirements.

Save the script with a .bat extension and run it from the command prompt. The resulting zip file will be created in the same directory as the script.

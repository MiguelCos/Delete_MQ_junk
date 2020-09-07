# Delete MQ Junk

#### This repo would contain the script for deleting junk after MaxQuant search

### Usage:

## USAGE: 
- Copy this script and paste it in the same folder where you stored your 'combined' folder from MaxQuant and/or the temporary index files.
- Double click on the script to open it on R Studio.
- Execute the script (click 'Source', upper right corner of your script window in R Studio).
- The script would delete every folder and file within the combined folder that is not the 'txt' folder containing the sumarized results or an mqpar file.
- The script would delete all the 'n0' and 'p0' folders generated for each raw and index file used for search.

_NOTE OF CAUTION: THE FILES DELETED WITH THE SCRIPT ARE NOT RECOVERABLE (These will NOT be sent to the Recible Bin). Make sure that there are no important files within the 'combined' folder that you would regret to lose (raw files with no backup, experimental annotation files, sample submission, etc.)_


## Day 0 (Optional Session for Those Who Were Unable to Install)

If you have already completed the installation and were able to run the analysis in the shell on Day 1, you can skip the following steps.

If you were not able to complete the installation successfully, please execute the scripts below.

# Reset

Some users encountered issues with setting the path or experienced system crashes during the setup. I recommend resetting your environment and starting the installation from scratch. To simplify this process, I have prepared a script that installs everything with a single command.

1. Open a cloud shell
2. Enter the following

```bash
sudo rm -rf $HOME
```

3. In the Cloud Shell menu, click more_vert More (the right upper button) and then click Restart. If prompted, click Restart in the confirmation dialog.


# Installing

**The analysis will take about 20 to 30 minutes (or even longer). During this time, please make sure that your network connection is not interrupted by a screensaver or other power-saving settings.**

4. Enter the following command

```bash
wget https://github.com/ShumpeiYamakawa/FSUJENA_2025_species_determination/raw/refs/heads/main/installing.sh
```

5. Wait until the download is finished.

6. Enter the following

```bash
source installing.sh
```

7. Do not disturb the installation. Please do not type anything while the installation is in progress. The screen may appear to be frozen, but the installation is continuing.

8. If you see the following message, the installation is complete.

```bash
###################################################
installing was done
 
BLAST ok
seqkit ok
R ok
dada2 ok
 
###################################################
 
type exit and enter to terminate the shell
you do not need to save anything
```

9. According to the message, enter "exit".

** ******If you do not see the message, please go back to Section 1 and reset the shell again***** **









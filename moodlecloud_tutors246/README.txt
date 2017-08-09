This is a MoodleCloud backup.

To restore this backup you should be familiar with the PostgreSQL database.

Step 1: The Database
  Restore the database dump file (tutors246_moodlecloud.sql) to your postgresql server using the pg_restore command
  Example: pg_restore --disable-triggers -d database_name -h database_host -n public -U database_user -O -x tutors246_moodlecloud.sql

Step 2: MoodleData files
  Copy the 'moodledata' folder to somewhere on your server. It must not be in the area served by the web server and must have permissions so that the web server user can write to it.

Step 3: Get The Moodle Code
  Download your required version from http://moodle.org/downloads
  OR
  Pull the code from the Git repository (recommended for developers and also makes upgrading very simple):
  Example: git clone -b MOODLE_33_STABLE git://git.moodle.org/moodle.git
  Unzip / move / copy the Moodle code (obtained above) so that it will be served by your web server (e.g. on Debian based Linux, move to /var/www/moodle)
  Check the permissions and make sure that the web server does not have permissions to write to any of the files in the Moodle code directories.
  If you need to, configure your web server to serve the Moodle site with your chosen URL.

Step 4: Plugins
  MoodleCloud uses some extra plugins that are not in Moodle core, such as BigBlueButton. If you have used these plugins in your original Moodle site
  and you want to restore these activities then you should add them to your Moodle codebase now. Extra plugins are available from Moodle Plugins (moodle.org/plugins).
 
Step 5: Config.php
  Copy the provided sample config.php to your newly created moodle code directory and open the file for editing.
  You must configure the wwwroot, dataroot and database settings correctly to match your environment.
  Ask your system administrator for help with this.

Step 6: Cron
  You will need a cron job to run periodically (for Moodle 2.9 and later we recommend every minute). A typical Unix cron entry will be as follows:
  Example: * * * * *    /usr/bin/php /path/to/moodle/admin/cli/cron.php >/dev/null

Congratulations! You are now ready to use your Moodle site.

Note: The 'admin' users password has been reset to 'moodlecloud'. All other user accounts must request a password reset as we do not export password information.

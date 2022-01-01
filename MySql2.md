1)When bundle update and there is post-install message from mysql2  
Do the following steps  

	gem uninstall mysql2

2)   Download C-Connector from MYSQL (note your version of Ruby -- if you're using 64 bit, download the 64 bit version)  
__when bundle update and there is a url from mysql2__

3) Unzip / Install the MYSQL C-Connector folder onto your HDD (don't have any spaces in the path)

    C:\mysql-connector-c-noinstall-6.0.2-winx64-vs2005
 
4)
	gem install mysql2 --platform=ruby -- '--with-mysql-dir="C:/mysql-connector-c-noinstall-6.0.2-winx64-vs2005"'

5) rails s  

For other programs that also use mysql2
6) Modify Gemfile.lock
    mysql2 (0.4.10-x64-mingw32)
    mysql2 (0.4.10-x86-mingw32)
    rake (11.3.0)

7) Modify Gemfile
	gem 'rake', '11.3.0'

8) rails s

9) If there is post-install message from mysql2

	9.1 gem uninstall mysql2
	9.2 keep only mysql-0.4.10

10) gem list mysql2
	Must have only

	mysql2 (0.4.10)

If mysql2-0.4.10 does not appear in the list, go to step 4 gem install mysql2 --platform=ruby
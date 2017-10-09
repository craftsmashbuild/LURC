Hi there, It is important for whoever is using this to know that I did NOT make this server myself. It's based off of Ion which AFIK is a mod of LUNI server

If you want updates check my github https://github.com/craftsmashbuild

I'll probably make a nicer read me file with good instructions on how to set this up later.



FIRST TIME SETUP:

- Download and start XAMPP,  make sure MySQL AND Apache are running
- Go to http://localhost/phpmyadmin/ in your browser
- Click import at the top of the screen and select the file in this folder called luni.sql

Once it imports go ahead and run _start_auth.bat and _start_world.bat
Wait for them both to finish. If world freezes up or stops before it says "Finished registering world objects!", press enter in the console.

Once both servers have started and are running, you will need to register an account.

TO REGISTER:

run   _start_console.bat   and type register & press enter

Next type the username you want, then press enter, and type your password you want, and press enter twice. 

TO PLAY:

Boot up lego universe and type in your username and password. If it fails to connect auth, go to the folder where the client is and replace boot.cfg with the boot.cfg file in this folder. 

Once you are playing and are on the Venture explorer, the beginning mission isn't finished yet. If you want to do fun stuff, there are commands

To teleport somewhere use /tp ID 
where ID is the ID of a world .

http://lu-docs.readthedocs.io/en/latest/intro.html?highlight=1200 (scroll down to the list of Zone IDs) will list the IDs (look at the Zone ID collumn), for example to teleport to Nimbus station you can type :
/tp 1200   


-- Craftsmashbuild

I and those who have contributed to this project are not affiliated with LEGO or other server projects in any way.
LEGO® is a trademark of the LEGO Group of companies which does not sponsor, authorize or endorse this site. The LEGO Group has not endorsed or authorized the operation of this game and is not liable for any safety issues in relation to the operation of this game.
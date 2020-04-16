# Learning-Box
A Vagrant environment for study.

You need to create this directory path ```~/Documents/dev/shared``` and clone the "Vagrant" folder into the "shared" folder.

Currently, the script can create two types of environments:
 - A Java environment with:
    - Java 11 (JDK/JRE);
    - IntelliJ IDEA or Eclipse (Default);
    - Tomcat 9.0.33;
    - Maven;
    - x11.
    
 - A Angular environment with:
    - NVM;
    - VS Code;
    - Node;
    - Angular CLI;
    - x11.
    
To change the environment you need edit the ```setup-environment.sh``` changing the line 26 for ```angular-environment.sh```or ```java-environment.sh```.

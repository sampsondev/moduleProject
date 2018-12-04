
The java files need to be compiled:
   $ mkdir -p mods/org.astro mods/com.greetings

    $ javac -d mods/org.astro \
        src/org.astro/module-info.java src/org.astro/org/astro/World.java

    $ javac --module-path mods -d mods/com.greetings \
        src/com.greetings/module-info.java src/com.greetings/com/greetings/Main.java



they will need to be jarred up and placed in a mlib directory.
From the top level directory: 
 $ mkdir mlib

jar them up

    $ jar --create --file=mlib/org.astro@1.0.jar \
        --module-version=1.0 -C mods/org.astro .

    $ jar --create --file=mlib/com.greetings.jar \
        --main-class=com.greetings.Main -C mods/com.greetings .

confirm they are there
    $ ls mlib
    com.greetings.jar   org.astro@1.0.jar

you can run it
$ java -p mlib -m com.greetings
  should get =>    Greetings world!

You may need to add jlink to your path variable. 
In your .bash_profile add:
export PATH="/Library/Java/JavaVirtualMachines/jdk-10.0.2.jdk/Contents/Home/bin:$PATH"

or whereever your java home is. You can detect that with:
$ /usr/libexec/java_home

to create the java image neemed greetingsapp/
    jlink --module-path $JAVA_HOME/jmods:mlib --add-modules com.greetings --output greetingsapp

browse through and see what you have

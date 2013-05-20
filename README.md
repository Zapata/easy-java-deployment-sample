Sample of easy Java deployement
===============================

Deploy a core style application (Plain old main) and a web application (light container) in the simplest way.

Best practices
--------------
  - Do not require any dependency on target env exept Java.
  - When possible build a Plain old Main application and deploy using a Jar with all dependencies.
  - When a container is require:
  	- prefer lightweight technology (servlet, ...), avoid dependency of a J2EE application server.
  	- use [Jetty Runner](http://wiki.eclipse.org/Jetty/Howto/Using_Jetty_Runner), easier than embedded style, and no lock in.
  - Deliver only one file (easier for production team).
  - Deployement should be reproducible.
  - Target environment should be easely reproducable and testable.

How to use it
-------------
	mvn package
	cd distrib
	vagrant up
	
That's all! Both applications should be deployed on the VM.   
You should have a "Hello World" when connecting to [http://localhost:8080/](http://localhost:8080/) .

How it works
------------

Core and webapp application are dummy archetype maven applications.

Distrib module will:

  - use appassembler-maven-plugin to build two deamon applications (using [Java Service Wrapper](http://wrapper.tanukisoftware.com/)).
  - on the fly download of Jetty Runner, used to run the webapp application.
  - build a tar.gz with full application installation (use maven-assembly-plugin).
  - use [Vagrant](http://www.vagrantup.com/) to build easely target VM.
     - see Vagrantfile for reproducible VM setup.
     - see bootstrap.sh for dependencies installation on VM (java).
     - see install.sh for a custom reproducable installation of applications.

Further infos
-------------
  - Use [Puppet](https://puppetlabs.com/) (or Chef) for a better depedency management.
  - Package script and distibution together (debian package, rpm, ...).
  - To build a Jar with all depedencies use either:
       - [Maven Assembly plugin with Jar depedencies](http://maven.apache.org/plugins/maven-assembly-plugin/descriptor-refs.html#jar-with-dependencies)
       - [Maven Shade plugin](https://maven.apache.org/plugins/maven-shade-plugin/)
       - [Maven One Jar plugin](http://code.google.com/p/onejar-maven-plugin/)
       - Compare of tools in french: http://blog.tduchateau.fr/2012/01/04/creer-un-jar-executable-avec-maven/

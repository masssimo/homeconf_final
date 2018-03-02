This is Puppet module that I made as a final assignment for [Tero Karvinen's](http://terokarvinen.com/) course about configuration management.
At the time I was often running Xubuntu from a live USB for testing purposes as we used it on the said course. 
I didn't want to install it on my laptop as I was using Linux Mint. It's also useful to experiment on a live USB as
you can return to a fresh install right away if something goes haywire.

So basically I had a dual-boot laptop (Win 8.1 and Linux Mint Cinnamon 17(?)) on which I was also often using Xubuntu. I would 
often end up in a situation where I wanted to do other work as well but didn't have the tools ready as I was on a fresh install.
I would have to install the tools or boot to another OS.

So I decided to create a module that would install the tools I needed for school work at the time and do a couple of tweaks.

What it does:

1) tweaks my touchpad settings if I'm on my laptop as it was basically useless on Xubuntu's default settings

2) installs Pinta and Java JDK using package-resource

3) installs MySQL server using [puppetlabs/mysql](https://forge.puppet.com/puppetlabs/mysql) module

4) installs Sublime Text and Spotify using [puppetlabs/apt](https://forge.puppet.com/puppetlabs/apt) module

5) downloads (using [maestrodev/wget](https://forge.puppet.com/maestrodev/wget)) and unpacks Eclipse's install files 

It was also supposed to automatically import a SQL dump that I was using on a database course but for some reason this didn't
work as planned.

A more lengthy discussion in Finnish can be found from [here.](https://mnuutinen.wordpress.com/2016/12/12/palvelinten-hallinta-oma-moduuli/)

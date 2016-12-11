class homeconf {

	include apt
	include wget

	apt::ppa { 'ppa:webupd8team/sublime-text-2':}
	
	apt::key { 'spotify-client':
			id => 'BBEBDCB318AD50EC6865090613B00F1FD2C19886',
			server => 'hkp://keyserver.ubuntu.com:80',
			
	}	
	
	file { '/etc/apt/sources.list.d/spotify.list':
		content => template('homeconf/sources.list'),
		require => Apt::Key['spotify-client'],
		notify => Exec['apt_update'],
	}		
	

	package { 'spotify-client':
		ensure => 'installed',
		require => Exec['apt_update'],
		allowcdrom => 'true',
	}	

	package { 'sublime-text':
		ensure => 'installed',
		require => Apt::Ppa['ppa:webupd8team/sublime-text-2'],
		allowcdrom => 'true',
		install_options => ['--allow-unauthenticated', '-f'],
	}
	
	package { 'default-jdk':
		ensure => 'installed',
		allowcdrom => 'true',
	}	
	
	package { 'pinta':
		ensure => 'installed',
		allowcdrom => 'true',
	}
	
	wget::fetch { "download eclipse":
		source => 'http://eclipse.bluemix.net/packages/neon.1/data/eclipse-inst-linux64.tar.gz',
		destination => '/tmp/',
		timeout => 0,
		verbose => true,
		require => Package['default-jdk'],
	}
	
	exec { 'unpack eclipse':
		path => [ '/bin/', '/sbin/' , '/usr/bin/', '/usr/sbin/' ],
		command => 'tar -xzf /tmp/eclipse-inst-linux64.tar.gz -C /tmp/',
		require => Wget::Fetch['download eclipse'],
		}

}

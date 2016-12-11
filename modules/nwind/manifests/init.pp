class nwind {

	class {'::mysql::server':
		root_password => 'strongpassword',
	}

	mysql::db { 'nwind':
		user => 'mattitestaa',
		password => 'mattitestaa',
		host => 'localhost',
		grant => ['ALL'],
		sql => '/tmp/NWIND12_MySQL.sql',
		import_cat_cmd => 'zcat',
  		import_timeout => 900,
		require => File['/tmp/NWIND12_MySQL.sql'],
	}
	
	file { '/tmp/NWIND12_MySQL.sql':
		ensure => present,
		source => 'puppet:///modules/nwind/NWIND12_MySQL.sql',
	}

}




class touchpad {
	
	if $macaddress == '08:60:6e:15:9c:0e' {
		notice("Touchpad settings changed.")
		exec { 'disable tap touchpad to click':
			command => '/usr/bin/xinput set-prop 13 287 2, 3, 0, 0, 0, 0, 0'
			}
}
	else {
		notice("Touchpad settings unchanged.")}

}	


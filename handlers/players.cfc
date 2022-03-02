component extends="coldbox.system.EventHandler" {

	function players( event, rc, prc ) {
		return CreateObject("component","models.challenge").getPlayers();
	}

	function dateTime( event, rc, prc ) {
		return CreateObject("component","models.challenge").getDateTime();
	}

}

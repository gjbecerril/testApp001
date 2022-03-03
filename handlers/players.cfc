component extends="coldbox.system.EventHandler" {

	function index( event, rc, prc ) {
		prc.welcomeMessage = "Welcome to ColdBox!";
		event.setView( "main/challenge1" );
	}

	function players( event, rc, prc ) {
		return CreateObject("component","models.challenge").getPlayers();
	}

	function dateTime( event, rc, prc ) {
		return CreateObject("component","models.challenge").getDateTime();
	}

}

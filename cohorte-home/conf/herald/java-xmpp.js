/**
 * Configuration for Herald XMPP transport
 */
{
	/*
	 * Herald XMPP transport bundles
	 */
	"bundles" : [ {
		"name" : "org.cohorte.herald.xmpp"
	} ],

	// Import the common component configuration
	"$merge" : [
		"all-xmpp.js"
	]
	
	
	
}

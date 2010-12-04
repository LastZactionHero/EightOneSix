/**
 * Define the mapcontroller namespace
 */
function mapcontroller_ns()
{
	this.add_address_to_map = add_address_to_map;
	this.build_marker = build_marker;
}
var mapcontroller = new mapcontroller_ns;

/**
 * Add Address to Map
 * Geocode an address and add a marker to the map
 *
 * @param {Map} inMap Display Map
 * @param {InfoWindow} inInfoWindow Display Info Window
 * @param {String} inName Point Name
 * @param {String} inAddress Street Address
 * @param {String} inCity City Name
 * @param {String} inState State Name
 */	
function add_address_to_map
(
	inMap,
	inInfoWindow,
	inId,
	inName,
	inAddress,
	inCity,
	inState
)
{
	// Configure address string
	var addressString = inAddress + " " + inCity + ", " + inState;

	// Geocode address string
	var geocoder = new google.maps.Geocoder();
	geocoder.geocode( 
			{ 'address': addressString },
			function( results, status )
			{
				// If successful, add marker to the map
				if( status == google.maps.GeocoderStatus.OK )
					build_marker( inMap, inInfoWindow, results[0].geometry.location, inId, inName, addressString );
			}
	);  		
}

/**
 * Build Marker
 *
 * @param {Map} inMap Display Map
 * @param {InfoWindow} inInfoWindow Display Info Window
 * @param {String} inLocation Coordinates of Marker
 * @param {String} inName Marker Name
 * @param {String} inContent Marker Content
 */
var sMarkerList = new Array();

function build_marker
(
	inMap,
	inInfoWindow,
	inLocation,
	inId,
	inName,
	inContent
)
{
	// Create new marker
	var marker = new google.maps.Marker
	(
		{
			map: inMap,
			position: inLocation
		}
	);

	// Open InfoWindow on click
	google.maps.event.addListener( marker, 'click', function()
			{
				inInfoWindow.setContent( "<strong>" + inName + "</strong><br>" + inContent );
				inInfoWindow.open( inMap, marker );
				updateList( inId );
			} );
	
	sMarkerList[sMarkerList.length] = marker;
}

/**
 * Update List on Parent Page
 * @param inId Item ID
 */
function updateList
	(
	inId		
	)
{
	if( parent.updateFromMap )
	{
		parent.updateFromMap( inId );
	}
}

/**
 * Select a map item from the list 
 * @param inId Item ID
 */
function selectFromList
	(
	inId
	)
{
	inId = inId - 1;
	if( inId >= 0 && inId < sMarkerList.length )
	{	
		google.maps.event.trigger( sMarkerList[inId], "click" );
	}
}
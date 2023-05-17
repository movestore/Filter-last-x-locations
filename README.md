# Filter X Last Locations*

MoveApps

Github repository: *github.com/movestore/Filter-last-x-locations*

## Description
Filters to the last x locations of each track, where x is set by the user.

## Documentation
This App selects for each track the last x locations.

In case a track is shorter than the selected x, the complete track is retured.

### Input data
MoveStack in Movebank format

### Output data
MoveStack in Movebank format

### Artefacts
none

### Settings 
`Number of locations` (nlocs): Selected number of locations (from the end) that shall be selected from each track of the data set. Must be at least `1`. Default: `1`.

### Most common errors
none.

### Null or error handling
**Setting `nlocs`:** App returns NULL if this number is smaller than `1`. If this value is selected very large, for most tracks the complete track will be returned. Information is provided in the logs of the App after it has run.

**Data:** should not be problematic

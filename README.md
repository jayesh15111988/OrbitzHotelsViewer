</p>
OrbitzHotelsViewer
<p>
<h2>
An iOS project to show list of hotels in Chicago area and their position on map using iOS MapKit framework
</h2>

<b>Overview : </b>
<p>
List of hotels is provided in the json file format. Aim of the project is to parse this content and display
hotel names and images on view using standard iOS controls.
We are using UITabBarController construct to enable users to switch between hotels list and map view.
Though JSON files provides more information for each hotel, we are displaying only minimal information on view
which includes Hotel name, street address and thumbnail image
</p>
<b>
External libraries used : 
</b>
<p>
SDWebImage version 3.7.1 - This library was used to facilitate asynchronous downloading of images and probable
caching in case images are revisited by the user. Enabling image download operation on main thread creates laggy user
experience and may stall UI for long time in case network is slow or unresponsive. SDWebImage library performs image
download operation in the background thread and also caches downloaded images so that extra network request is saved 
in case image is already found in the local cache database.
</p>

<b>
Graphics Used :
</b>
<p>
In order to improve presentation, I have used few graphics. This includes pin on map, launch image, custom images on
tab bar etc.
 </p>
 <b>
Device and iOS version support : 
</b>
<p>
This app is designed for both iPhone and iPad devices supporting both portrait and landscape device orientations. It is also
compatible with newer iPhone devices viz. iPhone 6 and 6+. 
<p>

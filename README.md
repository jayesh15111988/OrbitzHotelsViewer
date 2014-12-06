OrbitzHotelsViewer
<p>
<h2>
An iOS project to show list of hotels in Chicago area and their position on map using iOS MapKit framework with hotels data from local JSON file
</h2>

<b>Overview : </b>
<b>How to run</b>
<p>
<ul>
<li>Please run pod install to install all dependencies from external file </li>
<li>Open generated [project].xcworkspace file </li>
</ul>
<p>
List of hotels is provided in the json file format. Aim of the project is to parse this content and display
hotel names and images on view using standard iOS controls.
We are using UITabBarController construct to enable users to switch between hotels list and map view.
Though JSON files provides more information for each hotel, we are displaying only minimal information on view
which includes Hotel name, street address and thumbnail image.
<p>
We have list of hotels in the first tab and map representation in the second one. User can select any one hotel from the first list and upon switching to second view application will show selected hotel on the map.
</p>
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
Device and iOS version support : 
</b>
<p>
This app is designed for both iPhone and iPad devices supporting both portrait and landscape device orientations. It is also
compatible with newer iPhone devices viz. iPhone 6 and 6+. 

<p>

<p>
<b>Project Demo Screenshots : </b>
</p>
Hotels' List on iPad
<div>
<img src = 'Screenshots/iPad Hotels List.png'>
</div>
<div></div>
<br/>
Hotels' List on the Map
<div>
<img src = 'Screenshots/iPad - Hotels on Map.png'>
</div>
<div></div>
<br/>
Selected Hotel Information on Map - iPad Landscape mode
<div>
<img src = 'Screenshots/iPad - Selected Hotel info.png'>
</div>
<div></div>
<br/>
List Of Hotel on iPhone6+ Screen
<div>
<img src = 'Screenshots/iPhone6+ - Hotels List.png'>
</div>
<div></div>
<br/>
Selected hotels information on Map - iPhone6+ Screen
<div>
<img src = 'Screenshots/iPhone6+ - Selected Hotels info on Map.png'>
</div>
</p>


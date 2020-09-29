
some explanation for the app : 
1) at the first view controller called the splashViewController , i am getting the data from the MOVIES API , and saving in the CoreData 
"if this is the first time that the app is oppened".
2) in the second. view Controller iam dsplaying all the Movies in a RecyclerView an sorting the movies by releaseYear
3) Using a Navigation Controller , if the user is clicking on a movie i am redirecting the user to an detailsViewController ,
there iam using a blurView in front of the image.
 to detecte the clicked movie i am using the build in UITAbleView delegate,  (delegate/protocole paterne)
4)  if the user want to add a. movie to the list , click on add movie , that will open a scanner viewcontroller .
i am also using there a delegate protcole(build in) to detecte if the QRCOde as been detected,
if so i am displaying the result in the detailsViewController.
5) finally to reloade the recyclerview just pull to refresh the recyler and the new movie will appear
the used Harry potter QRCODE Movie : 
![](Qrcode.png)

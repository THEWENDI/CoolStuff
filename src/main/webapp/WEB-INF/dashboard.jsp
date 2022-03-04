<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true" %>
   

<!DOCTYPE html>
<html>
<head>
<title>COOL STUFF</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Oswald">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open Sans">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="/css/style.css">
<style>
h1,h2,h3,h4,h5,h6,a,p {font-family: "Oswald"}
body {font-family: "Open Sans"}
</style>
<script type="text/javascript" src="/js/app.js"></script>
</head>
<body class="w3-light-grey">

<!-- Navigation bar with social media icons -->
<div class="w3-bar w3-black w3-hide-small">
	<h3 class="w3-margin-left w3-bar-item w3-button " >COOL STUFF</h3>
	<div class="  w3-margin-right w3-bar-item  w3-right w3-large">
  	<a class="  w3-bar-item w3-large  " ><b>${user.userName}</b></a>
	<a href="/logout" class="  w3-bar-item w3-button " > LOGOUT </a>
	</div>
</div>
  
<!-- w3-content defines a container for fixed size centered content, 
and is wrapped around the whole page content, except for the footer in this example -->
<div class="w3-content" style="max-width:1600px">

  <!-- Header -->
  <header class="w3-container w3-center w3-padding-48 w3-white">
    <h1 class="w3-xxxlarge"><b>COOL STUFF</b></h1>
    <h6 class="w3-tag">STAY COOL, HANG LOOSE, ADMIT NOTHING </h6>
  </header>
  <!-- Image header -->
  <header class="w3-display-container w3-wide w3-black" id="home">
  	<video width="1600" height="800" autoplay muted loop>
  		<source src="img/dashboard_video.mp4" type="video/mp4">
	</video>
   <!--  <img class="w3-image" src="img/IMG_8966_2.JPG" alt="Fashion Blog" width="1600" height="800"> -->
    <div class="w3-display-left w3-padding-large  ">
      <h1 class="w3-text-white">Welcome to</h1>
      <h1 class="w3-jumbo w3-text-white w3-hide-small"><b>COOL STUFF</b></h1>
      <h6><button class="w3-button w3-white w3-padding-large w3-large w3-opacity w3-hover-opacity-off" onclick="document.getElementById('subscribe').style.display='block'">SUBSCRIBE</button></h6>
    </div>
  </header>

  <!-- Grid -->
  <div class="w3-row w3-padding w3-border">

    <!-- Blog entries -->
    <div class="s12">
    
    <br>
      <!-- Blog entry -->
      <div class="w3-container w3-white w3-margin w3-padding-large">
        <div class="w3-center">
          <h3>STEM PLAYER</h3>
          <h5>KANYE WEST DONDA STEM PLAYER, <span class="w3-opacity">Mar 2, 2022</span></h5>
        </div>

        <div class="w3-justify">
        <div class="w3-center  ">
        	 <video width="700" height="600" autoplay muted loop>
  				<source src="img/stem.mp4" type="video/mp4">
			</video>
           <!--  <img src="img/1.jpeg" alt="Girl Hat" style="width:50%" class="w3-padding-16"> -->
        </div>
          <p><strong> While Kanye West was hard at work completing his upcoming Donda album, the rap mogul was also creating the Donda Stem Player. Developed in partnership with Kano Computing, the musical gadget is designed to let users customize any song, with controls that manipulate the vocals, drums, bass, and samples, isolate parts, and add effects. </strong></p>
          <p><strong> It can also split songs into stems and offers 4-loop mixing, live sampling, and playback. The device is presented in a soft silicone disc with 4 touch-sensitive light sliders, speakers, and has 8GB of storage. The Donda Stem Player is currently available for preorder and will ship with Donda.</strong></p>
          <p><strong>Price: $200 </strong></p>
          <p><strong>Website: <a href="https://www.stemplayer.com/">STEMPLAYER</a></strong></p>
          
          <p class="w3-left"><button class="w3-button w3-white w3-border" onclick="likeFunction(this)"><b><i class="fa fa-thumbs-up"></i> Like</b></button></p>
          <p class="w3-right"><button class="w3-button w3-black" onclick="myFunction('demo1')" id="myBtn"><b>Replies  </b> <span class="w3-tag w3-white">1</span></button></p>
          <p class="w3-clear"></p>
          
          <div class="w3-row w3-margin-bottom" id="demo1" style="display:none">
            <hr>
            
              <div class="w3-col l10 m9">
                <h4>Kanye West <span class="w3-opacity w3-medium">May 3, 2022, 6:32 PM</span></h4>
                <p>Thank you for sharing</p>
                <c:forEach var="comment" items="${allComments }">
					<h4>${comment.user.userName }  <span class="w3-opacity w3-medium"><fmt:formatDate value="${comment.createdAt}" type = "both" /></span></h4>
					<p>${comment.content }</p>
					<c:choose>
           				 <c:when test="${comment.user.id == userId}" >
							<p>
							<form action="/delete/${comment.id}" method="POST">
							<input type="hidden" name="_method" value="delete" />
							<p><button class="w3-button  w3-red">Delete</button></p>
							</form>	
							<p>
            			</c:when>
       				 </c:choose>
				</c:forEach>
                 <!-- comment input -->
                 <form:form action="/comment/new" method="POST" modelAttribute="comment" class="form">
	            <div>
	            <p><form:label path="content"  style="width:100%"></form:label></p>
				<form:input path="content"  class="w3-input w3-border" placeholder="Comment" />
				<form:errors path="content" class="text-danger" />
	            </div>
				<p><button  class="w3-button  w3-black">submit</button></p>
	            </form:form>
              </div>
          </div>
        </div>
      </div>
      <hr>

      <!-- Blog entry -->
      <div class="w3-container w3-white w3-margin w3-padding-large">
        <div class="w3-center">
          <h3>Pokémon SCULPTURES</h3>
          <h5>DANIEL ARSHAM EXHIBITS, <span class="w3-opacity">April 23, 2022</span></h5>
        </div>

        <div class="w3-justify">
        <div class="w3-center">
          <img src="img/daniel-arsham-time-dilation.jpg" alt="Men in Hats" style="width:80%" class="w3-padding-16">
        </div>
        
        
 <!-- Slideshow container -->
<div class="slideshow-container w3-center">

  <!-- Full-width images with number and caption text -->
  <div class="mySlides fade">
    <div class="numbertext">1 / 3</div>
    <img src="img/drangon.png" style="width:1200" height="600">
    <div class="text"></div>
  </div>

  <div class="mySlides fade">
    <div class="numbertext">2 / 3</div>
    <img src="img/pika.png" style="width:1200" height="600">
    <div class="text"></div>
  </div>

  <div class="mySlides fade">
    <div class="numbertext">3 / 3</div>
    <img src="img/more.png" style="width:1200" height="600">
    <div class="text"></div>
  </div>

  <!-- Next and previous buttons -->
<!--   <a class="prev" onclick="plusSlides(-1)">&#10094;</a>
  <a class="next" onclick="plusSlides(1)">&#10095;</a> -->
</div>
       
<br>

<!-- The dots/circles -->
<div style="text-align:center">
  <span class="dot" onclick="currentSlide(1)"></span>
  <span class="dot" onclick="currentSlide(2)"></span>
  <span class="dot" onclick="currentSlide(3)"></span>
</div>
        
        
        
          <p><strong>‘time dilation’, daniel arsham’s latest exhibition, is now on view at perrotin new york. encompassing all three floors of the gallery, the exhibition transports audiences inside the artist’s universe with a range of signature pieces as well as new bodies of work. artfully eroded classical sculptures are exhibited alongside pokémon figures cast in geological materials, while arsham’s new paintings and resin works are also on display.</strong> </p>
          <p><strong>The exhibition introduces visitors to a range of arsham’s practice with several new bodies of work alongside the artist’s continued exploration of his signature sculptures cast in geological materials. the later includes his series of emblematic classical statues, drawn from his collaboration with the réunion des musées nationaux — grand palais (also featured in the exhibition ‘moonraker’ at the musée guimet – see more on designboom here). the statues are displayed alongside eroded pokémon figures, which mark the first major collaboration between a contemporary artist and the pokémon company.</strong> </p>
         <br></br>
          <p><strong>Exhibition info:</strong></p>
          <p><strong>Name:</strong> time dilation</p>
          <p><strong>Artist:</strong> daniel arsham</p>
          <p><strong>Location:</strong>  galerie perrotin</p>
          <p class="w3-left"><button class="w3-button w3-white w3-border" onclick="likeFunction(this)"><b><i class="fa fa-thumbs-up"></i> Like</b></button></p>
          <p class="w3-right"><button class="w3-button w3-black" onclick="myFunction('demo2')"><b>Replies  </b> <span class="w3-tag w3-white">2</span></button></p>
          <p class="w3-clear"></p>
          
          <!-- Example of comment field -->
          <div id="demo2" style="display:none">
            <div class="w3-row">
              <hr>
             <div class="w3-col l10 m9">
                <h4>Amber <span class="w3-opacity w3-medium">April 26, 2022, 10:52 PM</span></h4>
                <p>Love your blog page! Simply the best! </p><br>
              </div>
            </div>
            <div class="w3-row w3-margin-bottom">

              <div class="w3-col l10 m9">
                <h4>Angie <span class="w3-opacity w3-medium">April 23, 2022, 9:12 PM</span></h4>
                <p>This is COOLLLLL</p>
                <br>
                              <c:forEach var="commentb" items="${allCommentbs }">
					<h4>${commentb.user.userName }  <span class="w3-opacity w3-medium"><fmt:formatDate value="${commentb.createdAt}" type = "both" /></span></h4>
					<p>${commentb.content }</p>
					<c:choose>
           				 <c:when test="${commentb.user.id == userId}" >
							<p>
							<form action="/deleteb/${commentb.id}" method="POST">
							<input type="hidden" name="_method" value="delete" />
							<p><button class="w3-button  w3-red">Delete</button></p>
							</form>	
							<p>
            			</c:when>
       				 </c:choose>
				</c:forEach>
                 <!-- comment input -->
                 <form:form action="/commentb/new" method="POST" modelAttribute="commentb" class="form">
	            <div>
	            <p><form:label path="content"  style="width:100%"></form:label></p>
				<form:input path="content"  class="w3-input w3-border" placeholder="Comment" />
				<form:errors path="content" class="text-danger" />
	            </div>
				<p><button  class="w3-button  w3-black">submit</button></p>
	            </form:form>
              </div>
            </div>
          </div>
        </div>
      </div>

    <br>

      <!-- Blog entry -->
      <div class="w3-container w3-white w3-margin w3-padding-large">
        <div class="w3-center">
          <h3>WHAT IF I</h3>
          <h5>THE WENDI NEW SONG, <span class="w3-opacity">April 2, 2022</span></h5>
        </div>
		<br>
        <div class="w3-justify">
         <div class="w3-center">
          <iframe width="1200" height="600" src="https://www.youtube.com/embed/F6s72h7j0cc?start=0" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
          <iframe src="https://open.spotify.com/embed/track/3IZY1yfd4rb7neHsLSKMmH?utm_source=generator" width="1200" height="80" frameBorder="0" allowfullscreen="" allow="autoplay; clipboard-write; encrypted-media; fullscreen; picture-in-picture"></iframe>
         </div>
         <br>
		<p><strong>AKA THE WENDI (Wendi Li) R&B singer songwriter from Bay Area</strong></p>          
		<p><strong>Latest released single “What if I” was produced by Wennessy. The song is about the different possibilities of the future.
             People always regret or imagine what if something didn’t happen, What if I didn’t do that and  what if I was you. Using R&B melody on a Drill trap beat to generate the sadness feeling in a romantic vibe. The Music video was inspired by the classic Hong Kong Movie ”Chungking Express” with the signature techniques Director Wong Kar Wai  uses to alter speed of motion in the film.</strong></p>
         <p><strong>Follow THE WENDI:  <a href="https://linktr.ee/THEWENDI">Website</a> </strong></p>
          <p class="w3-left"><button class="w3-button w3-white w3-border" onclick="likeFunction(this)"><b><i class="fa fa-thumbs-up"></i> Like</b></button></p>
          <p class="w3-right"><button class="w3-button w3-black" onclick="myFunction('demo3')"><b>Replies  </b> <span class="w3-tag w3-white">3</span></button></p>
          <p class="w3-clear"></p>
          
          <!-- Example of comment field -->
          <div id="demo3" style="display:none">
            <hr>
            <div class="w3-row w3-margin-bottom">

              <div class="w3-col l10 m9">
                <h4>Jane <span class="w3-opacity w3-medium">April 10, 2022, 7:22 PM</span></h4>
                <p>That is a great song! Thanks for everything.</p>
              </div>
            </div>
            <div class="w3-row w3-margin-bottom">

              <div class="w3-col l10 m9">
                <h4>John <span class="w3-opacity w3-medium">April 8, 2022, 10:32 PM</span></h4>
                <p>Keep up the GREAT work! I am cheering for you!! </p>
              </div>
            </div>
            <div class="w3-row w3-margin-bottom">

              <div class="w3-col l10 m9">
                <h4>Anja <span class="w3-opacity w3-medium">April 7, 2022, 9:12 PM</span></h4>
                <p>Cant wait for the new song!</p>
              </div>
            </div>
            <!-- comment input -->
            <div>
            <p><input class="w3-input w3-border" type="text" placeholder="Comment" style="width:100%"></p>
			<p><button type="button" class="w3-button  w3-red">submit</button></p>
            </div>
          </div>
        </div>
      </div>
      
    <!-- END BLOG ENTRIES -->
    </div>

  

    <!-- END About/Intro Menu -->
    </div>

  <!-- END GRID -->
  </div>


<!-- Subscribe Modal -->
<div id="subscribe" class="w3-modal w3-animate-opacity">
  <div class="w3-modal-content" style="padding:32px">
    <div class="w3-container w3-white">
      <i onclick="document.getElementById('subscribe').style.display='none'" class="fa fa-remove w3-transparent w3-button w3-xlarge w3-right"></i>
      <h2 class="w3-wide">SUBSCRIBE</h2>
      <p>Join the mailing list to receive updates on the latest posts and other things.</p>
      <p><input class="w3-input w3-border" type="text" placeholder="Enter e-mail"></p>
      <button type="button" class="w3-button w3-block w3-padding-large w3-red w3-margin-bottom" onclick="document.getElementById('subscribe').style.display='none'">Subscribe</button>
    </div>
  </div>
</div>

    <br>

<!-- Footer -->
<footer class="w3-container w3-black" style="padding:32px">
  <a href="#" class="w3-button w3-right w3-dark-grey w3-padding-large w3-margin-bottom"><i class="fa fa-arrow-up w3-margin-right"></i>To the top</a>
  <p>Powered by <a href="" target="_blank">WD</a></p>
</footer>

<script>
// Toggle between hiding and showing blog replies/comments
document.getElementById("myBtn").click();
function myFunction(id) {
  var x = document.getElementById(id);
  if (x.className.indexOf("w3-show") == -1) {
    x.className += " w3-show";
  } else { 
    x.className = x.className.replace(" w3-show", "");
  }
}

function likeFunction(x) {
  x.style.fontWeight = "bold";
  x.innerHTML = "✓ Liked";
}
</script>

</body>
</html>

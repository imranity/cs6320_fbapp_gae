<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>FB post app Created by Imran Malik</title>
 
 
    <link href="http://getbootstrap.com/dist/css/bootstrap.min.css" rel="stylesheet">
     <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
 
    <link href="http://getbootstrap.com/examples/jumbotron-narrow/jumbotron-narrow.css" rel="stylesheet">
  <link href="css/emoji.css" rel="stylesheet">
 
<title>Facebook Login JavaScript Example</title>
<meta charset="UTF-8">
</head>
<body>
<h1 class="display-1">FB Post App by Imran Malik</h1>
 <div id="fb-root"></div>
<script>
// This is called with the results from from FB.getLoginStatus().
function statusChangeCallback(response) {
console.log('statusChangeCallback');
console.log(response);
// The response object is returned with a status field that lets the
// app know the current login status of the person.
// Full docs on the response object can be found in the documentation
// for FB.getLoginStatus().
if (response.status === 'connected') {
// Logged into your app and Facebook.

FB.api('/me?fields=first_name', function(data) {
       var welcomeBlock = document.getElementById('fb-welcome');
       welcomeBlock.innerHTML = 'Hello, ' + data.first_name  +  '!';

 });

testAPI();
} 
else if (response.status === 'not_authorized') {
// The person is logged into Facebook, but not your app.
document.getElementById('status').innerHTML = 'Please log ' +
'into this app.';
var msg=document.getElementById('msg');
msg.style.display='none';
document.getElementById('login').style.display = "none";


} else {
// The person is not logged into Facebook, so we're not sure if
// they are logged into this app or not.
document.getElementById('status').innerHTML = 'Please log ' +
'into Facebook.';
var msg=document.getElementById('msg');
msg.style.display='none';
document.getElementById('login').style.display = "none";
}
}

// This function is called when someone finishes with the Login
// Button.  See the onlogin handler attached to it in the sample
// code below.
  function checkLoginState() {
    FB.getLoginStatus(function(response) {
      statusChangeCallback(response);
    });
  }


window.fbAsyncInit = function() {
    FB.init({
// for localhost use: 404277549954087
 //     appId      : '404277549954087',
    	appId      : '216444322189466',
      cookie     : true,  // enable cookies to allow the server to access 
      // the session
      xfbml      : true,
      version    : 'v2.9'
    });  
FB.getLoginStatus(function(response) {
	    statusChangeCallback(response);
	  });
	  };
	  
(function(d, s, id){
     var js, fjs = d.getElementsByTagName(s)[0];
     if (d.getElementById(id)) {return;}
     js = d.createElement(s); js.id = id;
     js.src = "//connect.facebook.net/en_US/sdk.js";
     fjs.parentNode.insertBefore(js, fjs);
   }(document, 'script', 'facebook-jssdk'));


var post = function() {
	var text = document.getElementById('message').value;
	console.log("value of text is " + text);
	FB.api('/me/feed', 'post', { message: text }, function(response) {
		  if (!response || response.error) {
		    alert('Error occured due to: ' + response.error.message);
		    console.log(response.error.message);
		  } else {
		    alert('Post ID: ' + response.id);
		  }
		});

	
}
// Here we run a very simple test of the Graph API after login is
// successful. See statusChangeCallback() for when this call is made.
function share() {
	var text = document.getElementById('message').value;
	
	var url = window.location.href ;
	console.log('url is '+ url);
	var msg = 'helllo whats happening ';
	var dict = {
			  method: 'send',
			//  to: '100005315018793',
			  link: 'abc.xyz' , 
			  message: 'est 123 '
			};

FB.ui(
			   {
			     method: 'send',
			     name: 'Facebook Dialogs',
			     link: 'http://fbrell.com/',
			     caption: 'Reference Documentation',
			     description: 'Dialogs provide a simple, consistent interface for applications to interface with users.',
			     message: 'Facebook Dialogs are easy!'
			   },
			   function(response) {

			     if (response && response.post_id) {
			       alert('Post was published.');
			     } else {
			       alert('Post was not published due to .' + response.error.message);
			     }
			   }
			 );

}
function testAPI() {

console.log('Welcome! Fetching your information.... ');
FB.api('/me', function(response) {
console.log('Successful login for: ' + response.name);
document.getElementById('status').innerHTML =
'Thanks for logging in, ' + response.name + '!';
document.getElementById('msg').style.display = "block";
document.getElementById('login').style.display = "block";
document.getElementById('login').innerHTML = '<img src="http://graph.facebook.com/' + response.id + '/picture?type=large" />';

});
}
</script>

<!--
Below we include the Login Button social plugin. This button uses
the JavaScript SDK to present a graphical Login button that triggers
the FB.login() function when clicked.
-->

<fb:login-button size="xlarge" autologoutlink="true" scope="public_profile,email,publish_actions,user_friends" onlogin="checkLoginState();">
</fb:login-button>

<div id="status">
</div>
<div id="login">
</div>

<div class="container" id="msg"  style="display:block;">
<div class="row">
<div class="span4 offset4">
<div class="row">
<div class="span4 well">
<h1 id="fb-welcome"></h1>
<div class="form-group" id="sub_form">
<form>
    <div class="container">
      <div class="row justify-content-center">
        <div class="col-10">
          <div class="text-left">

            <p class="lead emoji-picker-container">
              <textarea id="message" class="form-control textarea-control" rows="3" placeholder="Whats happening ? " data-emojiable="true" data-emoji-input="unicode"></textarea>
            </p>
          </div>
        </div>
      </div>
    </div>
    <!-- ** 
        <textarea class="form-control" id="message" name="new_critt" rows="5" placeholder="Type in your new wall status"></textarea>
    
     ** -->
	<input type="button" class= "btn btn-info" id="postbtn" value="post" onclick="post()" />
	<input type="button" class= "btn btn-primary btn-lg" id="sharebtn" value="share with friends" onclick="share()" />
</form>
</div>
</div>
</div>
</div>
</div>

</div>
<script src="https://code.jquery.com/jquery-1.11.3.min.js"></script>
  <!-- ** Don't forget to Add jQuery here ** -->
  <script src="js/config.js"></script>
  <script src="js/util.js"></script>
  <script src="js/jquery.emojiarea.js"></script>
  <script src="js/emoji-picker.js"></script>
  
      <script>
      $(function() {
        // Initializes and creates emoji set from sprite sheet
        window.emojiPicker = new EmojiPicker({
          emojiable_selector: '[data-emojiable=true]',
          assetsPath: '../img',
          popupButtonClasses: 'fa fa-smile-o'
        });
        // Finds all elements with `emojiable_selector` and converts them to rich emoji input fields
        // You may want to delay this step if you have dynamically created input fields that appear later in the loading process
        // It can be called as many times as necessary; previously converted input fields will not be converted again
        window.emojiPicker.discover();
      });
    </script>
</body>
</html>
{config_load file="smarty.conf"}

<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>{#app_full_name#} | Email verification required</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <!-- Bootstrap 3.3.7 -->
  <link rel="stylesheet" href="/css/bootstrap.min.css">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="/css/font-awesome.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="/css/ionicons.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="/css/adminlte/AdminLTE.min.css">
  <!-- iCheck -->
  <link rel="stylesheet" href="/adminlteplugins/iCheck/square/blue.css">

  <link rel="stylesheet" href="/css/global.css">

  <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->

  <!-- Google Font -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
  <link href="https://fonts.googleapis.com/css?family=Roboto:500" rel="stylesheet">

  {include file="firebase_header.tpl"}


<script>
	function resendverificationemail() {
		var user = firebase.auth().currentUser;
		if (user) {
			user.sendEmailVerification().then(function() {
				alert("Resent verification email");
			}).catch(function(error) {
				console.log(error);	
				alert("Something went wrong :(");
			});
		} else {
			location.assign('/signin');
		}

	};
</script>

</head>
<body class="hold-transition login-page">
<div class="login-box">
  <div class="login-logo">
    <a href="/site"><b>{#app_first_full_name#}</b>{#app_last_full_name#}</a>
  </div>
  <!-- /.login-logo -->
  <div class="login-box-body">
	<p>To continue please click the link that has been emailed to you</p>
	<p>Didn't receive it? <button onclick="resendverificationemail();" class="btn btn-primary">Resend verification email</button></p>
	<p>Once verified you can <a class="btn btn-success" href="/signin">Sign in to {#app_full_name#}</a></p>
	<p>Want to sign in with a different account? <button onclick="signout();" class="btn btn-primary">Sign out</button></p>
    </div>

    <a href="/forgotpassword">I forgot my password</a><br>
    <a href="/privacy" class="text-center">Privacy policy</p>

  </div>
  <!-- /.login-box-body -->
</div>
<!-- /.login-box -->

<!-- jQuery 3 -->
<script src="/js/jquery.min.js"></script>
<!-- Bootstrap 3.3.7 -->
<script src="/js/bootstrap.min.js"></script>
<!-- iCheck -->
<script src="/adminlteplugins/iCheck/icheck.min.js"></script>
<script>
  $(function () {
    $('input').iCheck({
      checkboxClass: 'icheckbox_square-blue',
      radioClass: 'iradio_square-blue',
      increaseArea: '20%' // optional
    });
  });
</script>

</body>
</html>

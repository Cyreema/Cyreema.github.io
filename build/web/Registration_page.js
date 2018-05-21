		$(document).ready(function(){
			$("#conpass").keyup(checkpass);
		});
		function checkpass()
		{
			var pass=$("#pass").val();
			var conpass=$("#conpass").val();
			
			if(pass !== conpass)
				{
					$("#error").html("** NOT MATCHING..");
				}
			else
				{
					$("#error").html("");
					$(".tickdiv").html('<img class='+'tickimg'+' src='+'tick.png'+'>');
				}
		}
		$(document).ready(function(){
			$("#submitbutton").click(checkedpass);
		});
		function checkedpass()
		{
			var pass=$("#pass").val();
			var conpass=$("#conpass").val();
			
			if(pass !== conpass)
				{
					return false;
				}
			else
				{
					
				}
		}
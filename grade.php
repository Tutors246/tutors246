<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	
	
	<link rel="stylesheet" type="text/css" href="css/style.css" />
</head>

<body>

	<div id="page-wrap">

		<h1>English Language (A) Assessment</h1>
		
        <?php
            
            $answer1 = $_POST['question-1-answers'];
            $answer2 = $_POST['question-2-answers'];
            $answer3 = $_POST['question-3-answers'];
            $answer4 = $_POST['question-4-answers'];
            $answer5 = $_POST['question-5-answers'];
            $answer6 = $_POST['question-6-answers'];
				$answer7 = $_POST['question-7-answers'];
				$answer8 = $_POST['question-8-answers'];
				$answer9 = $_POST['question-9-answers'];
				$answer10 = $_POST['question-10-answers'];
				$answer11 = $_POST['question-11-answers'];
				$answer12 = $_POST['question-12-answers'];
				$answer13 = $_POST['question-13-answers'];
				$answer14 = $_POST['question-14-answers'];
				$answer15 = $_POST['question-15-answers'];
				$answer16 = $_POST['question-16-answers'];
				$answer17 = $_POST['question-17-answers'];
				$answer18 = $_POST['question-18-answers'];
				$answer19 = $_POST['question-19-answers'];
				$answer20 = $_POST['question-20-answers'];
				$answer21 = $_POST['question-21-answers'];
   			$answer22 = $_POST['question-22-answers'];
   			$answer23 = $_POST['question-23-answers'];
				$answer24 = $_POST['question-24-answers'];
				$answer25 = $_POST['question-25-answers'];
				$answer26 = $_POST['question-26-answers'];
				$answer27 = $_POST['question-27-answers'];
				$answer28 = $_POST['question-28-answers'];
				$answer29 = $_POST['question-29-answers'];
				$answer30 = $_POST['question-30-answers'];
     			$answer31 = $_POST['question-31-answers'];
            $totalCorrect = 0;
            
            if ($answer1 == "A") { $totalCorrect++; }
            if ($answer2 == "C") { $totalCorrect++; }
            if ($answer3 == "C") { $totalCorrect++; }
            if ($answer4 == "C") { $totalCorrect++; }
            if ($answer5 == "D") { $totalCorrect++; }
            
            if ($answer6 == "A") { $totalCorrect++; }
            
            if ($answer7 == "C") { $totalCorrect++; }
            if ($answer8 == "D") { $totalCorrect++; }
            if ($answer9 == "B") { $totalCorrect++; }
            if ($answer10 == "A") { $totalCorrect++; }
            if ($answer11 == "C") { $totalCorrect++; }
            if ($answer12 == "D") { $totalCorrect++; }
            if ($answer13 == "B") { $totalCorrect++; }
            if ($answer14 == "A") { $totalCorrect++; }
            if ($answer15 == "C") { $totalCorrect++; }
            if ($answer16 == "D") { $totalCorrect++; }
            if ($answer17 == "B") { $totalCorrect++; }
            if ($answer18 == "A") { $totalCorrect++; }
           
           
            if ($answer19 == "D") { $totalCorrect++; }
            if ($answer20 == "D") { $totalCorrect++; }
            if ($answer21 == "A") { $totalCorrect++; }
            if ($answer22 == "A") { $totalCorrect++; }
           
            if ($answer23 == "C") { $totalCorrect++; }
            if ($answer24 == "D") { $totalCorrect++; }
            if ($answer25 == "B") { $totalCorrect++; }
            if ($answer26 == "A") { $totalCorrect++; }
            if ($answer27 == "C") { $totalCorrect++; }
            if ($answer28 == "D") { $totalCorrect++; }
            if ($answer29 == "B") { $totalCorrect++; }
            if ($answer30 == "A") { $totalCorrect++; }
            if ($answer31) { $totalCorrect++; }
            
            echo "<div id='results'>$totalCorrect / 31 correct</div>";
            
        ?>
	
	</div>
	
	<script type="text/javascript">
	var gaJsHost = (("https:" == document.location.protocol) ? "https://ssl." : "http://www.");
	document.write(unescape("%3Cscript src='" + gaJsHost + "google-analytics.com/ga.js' type='text/javascript'%3E%3C/script%3E"));
	</script>
	
	<script type="text/javascript">
	var pageTracker = _gat._getTracker("UA-103250894-1");
	pageTracker._initData();
	pageTracker._trackPageview();
	</script>

</body>

</html>
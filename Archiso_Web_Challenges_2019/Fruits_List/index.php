<?php
if (isset($_GET['source'])) {
  show_source(__FILE__);
  exit;
}
?>

<!DOCTYPE html>
<html>

<head>
  <meta charset="UTF-8">
  <title>Fruits List</title>
  <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.css">
  <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/milligram/1.3.0/milligram.css">
  <link rel="stylesheet" href="style.css">
</head>

<body>
  <div id="main" class="container">
    <h1>Fruits List</h1>
    <h3>Please choose a season you like!</h3>
    <p>You can see source code from <a href="index.php?source">here</a>!</p>

    <a href="index.php?season=spring">Spring</a>
    <a href="index.php?season=summer">Summer</a>
    <a href="index.php?season=autumn">Autumn</a>
    <a href="index.php?season=winter">Winter</a>

    <ul id="fruitsList">
      <?php if (isset($_GET['season'])): ?>
      <?php
          $fruits = array_filter(explode("\n", shell_exec("ls {$_GET['season']}")), "strlen");
          foreach ($fruits as $fruit):
        ?>
      <li><?php echo urlencode(trim($fruit)); ?></li>
      <?php endforeach; ?>
      <?php endif; ?>
    </ul>
  </div>
</body>

</html>

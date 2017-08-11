<ul class="side-nav">
    <li class="side-nav-item">
        <img class="profile-image" src="public/images/profile-image.png" alt="">
    </li>
    <li class="side-nav-item"><a href="<?= Yii::$app->urlManager->createUrl(['/site/index']); ?>"><i class="glyphicon glyphicon-home"></i> Home</a></li>
    <li class="side-nav-item"><a href="<?= Yii::$app->urlManager->createUrl(['/category/index']); ?>"><i class="glyphicon glyphicon-th-list"></i> Category</a></li>
    <li class="side-nav-item"><a href="#"><i class="glyphicon glyphicon-list-alt"></i> Transaction</a></li>
    <li class="side-nav-item"><a href="#"><i class="glyphicon glyphicon-folder-close"></i> Account</a></li>
    <li class="side-nav-item"><a href="#"><i class="glyphicon glyphicon-envelope"></i> Contact</a></li>
    <li class="side-nav-item"><a href="#"><i class="glyphicon glyphicon-off"></i> Logout</a></li>
</ul>

<input type="checkbox" id="side-nav-trigger" class="side-nav-trigger" />

<label for="side-nav-trigger">
    <svg height="32px" id="Layer_1" style="enable-background:new 0 0 32 32;"
         version="1.1" viewBox="0 0 32 32" width="32px"
         xml:space="preserve" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
            <path class="hamburger-icon" d="M4,10h24c1.104,0,2-0.896,2-2s-0.896-2-2-2H4C2.896,6,2,6.896,2,8S2.896,10,4,10z M28,14H4c-1.104,0-2,0.896-2,2  s0.896,2,2,2h24c1.104,0,2-0.896,2-2S29.104,14,28,14z M28,22H4c-1.104,0-2,0.896-2,2s0.896,2,2,2h24c1.104,0,2-0.896,2-2  S29.104,22,28,22z"/>
        </svg>
</label>
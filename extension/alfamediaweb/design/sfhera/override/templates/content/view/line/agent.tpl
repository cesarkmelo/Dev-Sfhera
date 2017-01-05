{default node_name=$object.main_node.name 
		 node_url=$object.main_node.url_alias
		 node = $object.main_node}

<div class="row-fluid item_agent">
	<div class="span4 image_agent"> <img src="img/team/1.jpg" alt="Image"> </div>
	<div class="span7 info_agent">
		<h5>{$node_name|wash}</h5>
		<ul>
			<li><i class="icon-envelope"></i><a href="#">pmaccarty@domain.com</a></li>
			<li><i class="icon-phone"></i><a href="#">331-23-45</a></li>
			<li><i class="icon-mobile-phone"></i><a href="#">331-23-45</a></li>
		</ul>
	</div>
</div>
<p>Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, habitant morbi tristique senectus.</p>
{/default}
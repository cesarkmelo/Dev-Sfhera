<!-- Footer area: START -->
{def $feedback_form_class = fetch( 'content', 'class', hash( 'class_id', 'feedback_form' ) )
     $feedback_form = $feedback_form_class.object_list[0]
	 $testimonial_class = fetch( 'content', 'class', hash( 'class_id', 'testimonial' ) )
     $testimonial =  $testimonial_class.object_list[0]}
<!-- Footer area - footer_top -->
<footer class="section_area footer_top">
	<div class="container center"> 
		{include uri='design:footer/description.tpl' node=$feedback_form}
	</div>
</footer>
<!-- End Footer area - footer_top -->

<!-- Footer area - footer_medium -->
<footer class="section_area footer_medium">
	<div class="container">
		<div class="row-fluid">

		   <!-- testimonials -->
		   <div class="span3">
			  {include uri='design:footer/address.tpl' node=$feedback_form}
		   </div>
			<!-- End testimonials -->

			<!-- newsletter -->
			<div class="span3 links">
			 {include uri='design:footer/useful_links.tpl' node=$feedback_form}	
			</div>
			<!-- End newsletter -->

			<!-- Tags -->
			<div class="span3 padding_items">
				{include uri='design:tagcloud/tagcloud.tpl' number=10}	
			</div>
			<!-- End Tags -->

			<!-- Contact Footer -->
			<div class="span3">
				{include uri='design:footer/testimonial.tpl' node=$testimonial}	
			</div>
			<!-- End Contact Footer -->
		</div>
	</div>
</footer>
<!-- End Footer area - footer_medium -->

<!-- Footer area - footer_down -->
<footer class="section_area footer_down">
	<div class="container">
		<div class="row-fluid">
		   <div class="span6">
				<p>Developed by <a href="http://www.alfamediaweb.com" title="Alfamedia WEB - Desarrollo WEB y aplicaiones moviles">AlfamediaWEB</a>.</p>             
			</div>
			<div class="span6">
				{include uri='design:footer/social.tpl'}	
			</div>
		</div>
	</div>
</footer>
<!-- End Footer area- footer_down -->
<!-- Footer area: END -->
{undef $feedback_form_class $feedback_form}
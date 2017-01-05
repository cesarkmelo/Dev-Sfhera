{* Override this template and place javascript based statestics here (like Google Analytics) *}
{def $scripts = ezini( 'JavaScriptSettings', 'JavaScriptList', 'design.ini' )}

<script src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>         
{literal}
<script>window.jQuery || document.write('<script src="/extension/alfamediaweb/design/sfhera/javascript/jquery-1.9.1.min.js"><\/script>')</script>
{/literal}
{foreach $scripts as $script}
<script type='text/javascript' src={concat('javascript/',$script)|ezdesign}></script>

{/foreach}

{literal}
<!--Run Slide Home-->
<script type="text/javascript">
	$('#slide').camera({        
		height: '650px',
		 navigation: true  
	 });
</script>

<script type="text/javascript">
	$('#slide_details').camera({        
		height: '55.5%',
		 navigation: true  
	 });
</script>
{/literal}

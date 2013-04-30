html = """
<h1>This is an interactive page of sorts...</h1>
<img style='height:200px;clear:both' src='https://i.chzbgr.com/maxW500/7226615040/h5A622C86/' alt='One day...' />
<script>function writeText(){
  p = document.createElement('p');
	p.innerHTML = 'I am Text';
  document.getElementById("container").appendChild(p);
}
</script>

<div id="container">
<button style='background-color:red;color:white;' onclick="writeText()">Write some text</button>
</div>
"""

console.log html
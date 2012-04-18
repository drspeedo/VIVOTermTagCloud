<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ page import="org.mcavallo.opencloud.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>OpenCloud - Example 1</title>
<link rel="stylesheet" type="text/css" href="css/flickr.css" />
</head>
<body>

<h3 style="text-align: center">Tag cloud using proportional font size</h3>

<br />

<%
Cloud cloud = new Cloud();

// Sets the number of tag to display in the cloud
cloud.setMaxTagsToDisplay(100);

// We want to use a maximum font size of 38px for a tag,
// so we set the maximum weight value to 38.0 for convenience.
cloud.setMaxWeight(38.0);

// Sets a default url to assign to tags.
// The format specifier %s will be substituted by the tag name
//cloud.setDefaultLink("http://www.flickr.com/photos/tags/%s/");

// Add sample tags with corresponding score
cloud.addTag(new Tag("Crohn's Disease",75));
cloud.addTag(new Tag("Inflammatory Bowel",100));
cloud.addTag(new Tag("Intestinal Diseases",100));
cloud.addTag(new Tag("GastroIntestinal Diseases",100));
cloud.addTag(new Tag("Digestive Diseases",100));
cloud.addTag(new Tag("Diseases",100));
%>
<div class="tagcloud" style="margin: auto; width: 80%;">
<%
// Cycles through the output tags
for (Tag tag : cloud.tags()) {
	// Writes a link for each tag.
	// We use the method getWeightInt() to set the font size of the link
%>
	<a href="<%= tag.getLink() %>" style="font-size: <%= tag.getWeightInt() %>px;"><%= tag.getName() %></a>
<%
}
%>
</div>

</body>
</html>